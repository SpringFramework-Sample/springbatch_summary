package kr.seok.admin.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.time.LocalDateTime;

@Entity
@Getter
@Table(name = "BATCH_STEP_EXECUTION")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class BatchStepExecution implements Serializable {
    @Id
    @Column(name = "STEP_EXECUTION_ID")
    private Long stepExecutionId;
    @Column(name = "VERSION")
    private Long version;
    @Column(name = "STEP_NAME")
    private String stepName;
    @Column(name = "JOB_EXECUTION_ID")
    private Long jobExecutionId;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
    @Column(name = "START_TIME")
    private LocalDateTime startTime;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
    @Column(name = "END_TIME")
    private LocalDateTime endTime;
    @Column(name = "STATUS")
    private String status;
    @Column(name = "COMMIT_COUNT")
    private Long commitCount;
    @Column(name = "READ_COUNT")
    private Long readCount;
    @Column(name = "FILTER_COUNT")
    private Long filterCount;
    @Column(name = "WRITE_COUNT")
    private Long writeCount;
    @Column(name = "READ_SKIP_COUNT")
    private Long readSkipCount;
    @Column(name = "WRITE_SKIP_COUNT")
    private Long writeSkipCount;
    @Column(name = "PROCESS_SKIP_COUNT")
    private Long processSkipCount;
    @Column(name = "ROLLBACK_COUNT")
    private Long rollbackCount;
    @Column(name = "EXIT_CODE")
    private String exitCode;
    @Column(name = "EXIT_MESSAGE")
    private String exitMessage;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
    @Column(name = "LAST_UPDATED")
    private LocalDateTime lastUpdated;
}
