package kr.seok.hospital.domain;

import lombok.AccessLevel;
import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name = "TB_HOSPITAL_POS")
@EqualsAndHashCode(of = {"id"}, callSuper = false)
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class HospitalPos extends BaseTimeEntity {

    @Id
    @Column(name = "ORG_ID", unique = true)
    private String id;

    @Column(name = "SIMPLE_MAP") /* 간이약도 */
    private String simpleMap;

    @Column(name = "LONGITUDE") /* 병원경도 */
    private Double lon;
    @Column(name = "LATITUDE") /* 병원위도 */
    private Double lat;

    @Builder
    public HospitalPos(String id, String simpleMap, Double lon, Double lat) {
        this.id = id;
        this.simpleMap = simpleMap;
        this.lon = lon;
        this.lat = lat;
    }
}
