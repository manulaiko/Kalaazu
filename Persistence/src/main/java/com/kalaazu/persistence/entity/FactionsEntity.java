package com.kalaazu.persistence.entity;

import com.kalaazu.math.Vector;
import com.kalaazu.math.VectorRegion;
import com.kalaazu.persistence.VectorType;
import com.kalaazu.persistence.VectorRegionType;
import jakarta.persistence.*;
import lombok.Data;
import org.hibernate.annotations.Type;

/**
 * Factions entity.
 * ================
 * <p>
 * Entity for the `factions` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "factions", schema = "kalaazu")
@Data
public class FactionsEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private byte id;

    @Basic
    @Column(name = "name", nullable = false)
    private String name = "";

    @Basic
    @Column(name = "tag", nullable = false, length = 3)
    private String tag = "";

    @Basic
    @Column(name = "description", nullable = false, length = -1, columnDefinition = "TEXT")
    private String description;

    @Basic
    @Column(name = "is_public", nullable = false)
    private boolean isPublic = true;

    @Basic
    @Column(name = "low_maps_position", nullable = false)
    @Type(value = VectorType.class)
    private Vector lowMapsPosition = Vector.ZERO;

    @Basic
    @Column(name = "high_maps_position", nullable = false)
    @Type(value = VectorType.class)
    private Vector highMapsPosition = Vector.ZERO;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "low_maps_id", nullable = false)
    private MapsEntity lowMapsByLowMapsId;

    @Basic
    @Column(name= "low_maps_id", nullable = false, insertable = false, updatable = false)
    private short lowMapsId = 0;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "high_maps_id", nullable = false)
    private MapsEntity highMapsByHighMapsId;

    @Basic
    @Column(name= "high_maps_id", nullable = false, insertable = false, updatable = false)
    private short highMapsId = 0;
}
