package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;

/**
 * Factions entity.
 * ================
 *
 * Entity for the `factions` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "factions", schema = "kalaazu")
@Data
public class FactionsEntity {
    @Id
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
    private long lowMapsPosition = 0;

    @Basic
    @Column(name = "high_maps_position", nullable = false)
    private long highMapsPosition = 0;

    @ManyToOne
    @JoinColumn(name = "low_maps_id", nullable = false)
    private MapsEntity lowMapsByLowMapsId;

    @ManyToOne
    @JoinColumn(name = "high_maps_id", nullable = false)
    private MapsEntity highMapsByHighMapsId;
}
