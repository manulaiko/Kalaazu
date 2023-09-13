package com.kalaazu.persistence.entity;

import com.kalaazu.math.Vector2;
import com.kalaazu.persistence.Vector2Type;
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
    @Type(value = Vector2Type.class)
    private Vector2 lowMapsPosition = new Vector2(0L);

    @Basic
    @Column(name = "high_maps_position", nullable = false)
    @Type(value = Vector2Type.class)
    private Vector2 highMapsPosition = new Vector2(0L);

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "low_maps_id", nullable = false)
    private MapsEntity lowMapsByLowMapsId;

    @Basic
    @Column(name= "low_maps_id", nullable = false, insertable = false, updatable = false)
    private byte lowMapsId = 0;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "high_maps_id", nullable = false)
    private MapsEntity highMapsByHighMapsId;

    @Basic
    @Column(name= "high_maps_id", nullable = false, insertable = false, updatable = false)
    private byte highMapsId = 0;
}
