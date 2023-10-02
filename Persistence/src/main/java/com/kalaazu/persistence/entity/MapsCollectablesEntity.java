package com.kalaazu.persistence.entity;

import com.kalaazu.math.Vector;
import com.kalaazu.math.VectorRegion;
import com.kalaazu.persistence.VectorRegionType;
import com.kalaazu.persistence.VectorType;
import jakarta.persistence.*;
import lombok.Data;
import org.hibernate.annotations.Type;

/**
 * Maps collectables entity.
 * =========================
 * <p>
 * Entity for the `maps_collectables` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "maps_collectables", schema = "kalaazu")
@Data
public class MapsCollectablesEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private byte id;

    @Basic
    @Column(name = "amount", nullable = false)
    private short amount = 0;

    @Basic
    @Column(name = "region", nullable = false)
    @Type(VectorRegionType.class)
    private VectorRegion region = new VectorRegion("0,0|20800,12800");

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "maps_id", referencedColumnName = "id", nullable = false)
    private MapsEntity mapsByMapsId;

    @Basic
    @Column(name= "maps_id", nullable = false, insertable = false, updatable = false)
    private short mapsId = 0;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "collectables_id", referencedColumnName = "id", nullable = false)
    private CollectablesEntity collectablesByCollectablesId;

    @Basic
    @Column(name= "collectables_id", nullable = false, insertable = false, updatable = false)
    private byte collectablesId = 0;
}
