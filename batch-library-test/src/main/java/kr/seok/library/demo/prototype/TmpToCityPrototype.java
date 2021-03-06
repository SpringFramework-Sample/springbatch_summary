package kr.seok.library.demo.prototype;

import kr.seok.library.domain.entity.CityEntity;
import kr.seok.library.domain.entity.CommonEntity;
import kr.seok.library.domain.entity.TmpEntity;
import kr.seok.library.repository.CityRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.batch.core.Job;
import org.springframework.batch.core.JobExecution;
import org.springframework.batch.core.JobExecutionListener;
import org.springframework.batch.core.Step;
import org.springframework.batch.core.configuration.annotation.JobBuilderFactory;
import org.springframework.batch.core.configuration.annotation.StepBuilderFactory;
import org.springframework.batch.core.launch.support.RunIdIncrementer;
import org.springframework.batch.item.ItemProcessor;
import org.springframework.batch.item.ItemReader;
import org.springframework.batch.item.ItemWriter;
import org.springframework.batch.item.database.JdbcCursorItemReader;
import org.springframework.batch.item.database.JpaItemWriter;
import org.springframework.batch.item.support.CompositeItemProcessor;
import org.springframework.batch.item.support.CompositeItemWriter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.BeanPropertyRowMapper;

import javax.persistence.EntityManagerFactory;
import javax.sql.DataSource;
import java.util.*;

import static kr.seok.library.common.Constants.CHUNK_SIZE;

/**
 * 임시 테이블에서 City Table로 데이터를 적재하는 Job
 */
@Slf4j
@Configuration
@RequiredArgsConstructor
public class TmpToCityPrototype {

    /* batch */
    private static final String JOB_NAME = "batch_TMP_TO_CITY";
    private final JobBuilderFactory jobBuilderFactory;
    private final StepBuilderFactory stepBuilderFactory;

    /* DB */
    private final DataSource datasource;
    private final EntityManagerFactory entityManagerFactory;
    private final CityRepository cityRepository;

    /* Domain Attribute */
    private static Set<String> cityKeySet = new HashSet<>();

    @Bean(name = JOB_NAME)
    public Job tmpToCityJob() {
        return jobBuilderFactory.get(JOB_NAME)
                .incrementer(new RunIdIncrementer())
                /* Do City Table Empty */
                .listener(new JobExecutionListener() {
                    @Override
                    public void beforeJob(JobExecution jobExecution) {
                        cityRepository.deleteAllInBatch();
                    }

                    @Override
                    public void afterJob(JobExecution jobExecution) {

                    }
                })
                /* 임시 테이블에서 유일한 값*/
                .start(tmpToCityStep())
                .build();
    }

    /* 임시테이블에서 City 테이블에 적재하는 Step */
    private Step tmpToCityStep() {
        return stepBuilderFactory.get(JOB_NAME + "_STEP")
                .<TmpEntity, CommonEntity>chunk(CHUNK_SIZE)
                /* One Reader: JdbcCursorItemReader */
                .reader(tmpDbJdbcCursorReader())
                /* CompositeItemProcessor 로 구현되어 있지만 tmpToCityProcessor 만 수행 함 */
                .processor(compositeProcessor())
                /* CompositeItemWriter 로 구현되어 있지만 cityWriter 만 수행 함 */
                .writer(compositeWriter())
                .build();

    }

    /* One Reader: JdbcCursorItemReader Type */
    private ItemReader<? extends TmpEntity> tmpDbJdbcCursorReader() {
        /* TB_TMP_LIBRARY 테이블의 컬럼리스트를 작성 */
        StringBuilder sb = new StringBuilder();
        for(String fields : TmpEntity.TmpFields.getFields())
            sb.append(fields).append(", ");

        return new JdbcCursorItemReader<TmpEntity>() {{
            /* 실행 Reader 명 설정 */
            setName(JOB_NAME + "_READER");
            /* Jdbc 방식으로 DB 접근 */
            setDataSource(datasource);
            /* 조회 쿼리 */
            setSql("SELECT " + sb.substring(0, sb.toString().length() - 2) + " FROM TB_TMP_LIBRARY");
            /* 조회된 row 데이터 Bean으로 매핑 */
            setRowMapper(new BeanPropertyRowMapper<>(TmpEntity.class));
        }};
    }

    /* CompositeProcessor를 사용하여 데이터 처리가 가능하나 현 프로젝트에서는 사용할 필요가 없음 */
    @Deprecated
    private ItemProcessor<? super TmpEntity, ? extends CommonEntity> compositeProcessor() {

        /* Processor 리스트 저장 */
        List<ItemProcessor<? super TmpEntity, ? extends CommonEntity>> delegates = new ArrayList<>();
        delegates.add(tmpToCityProcessor());

        /* Processor 위임 */
        CompositeItemProcessor<? super TmpEntity, ? extends CommonEntity> compositeProcessor = new CompositeItemProcessor<>();
        compositeProcessor.setDelegates(delegates);

        return compositeProcessor;
    }

    /* 임시 테이블에서 각 도시명의 유일한 값으로 Filtering 하는 Processor */
    private ItemProcessor<? super TmpEntity, ? extends CommonEntity> tmpToCityProcessor() {
        return (ItemProcessor<TmpEntity, CityEntity>) item -> {
            /* Set에 키 값이 포함되어 있으면 넘어가기*/
            if(cityKeySet.contains(item.getCityNm())) return null;
            /* 값이 포함되지 않은 경우 set에 설정 및 Entity에 저장 */
            cityKeySet.add(item.getCityNm());
            return CityEntity.builder().cityNm(item.getCityNm()).build();
        };
    }

    /* Composite Multi Writer */
    private ItemWriter<? super CommonEntity> compositeWriter() {
        /* 데이터 처리할 Processor를 리스트에 등록 */
        List<ItemWriter<CityEntity>> delegates = new ArrayList<>();
        delegates.add(cityWriter());

        /* Writer 위임 */
        CompositeItemWriter compositeItemWriter = new CompositeItemWriter<>();
        compositeItemWriter.setDelegates(delegates);

        return compositeItemWriter;
    }

    /* Jpa Writer: City */
    private ItemWriter<CityEntity> cityWriter() {
        return new JpaItemWriter<CityEntity>() {{
            setEntityManagerFactory(entityManagerFactory);
        }};
    }
}
