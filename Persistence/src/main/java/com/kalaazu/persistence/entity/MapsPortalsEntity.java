package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;

/**
 * Maps portals entity.
 * ====================
 *
 * Entity for the `maps_portals` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "maps_portals", schema = "kalaazu")
@Data
public class MapsPortalsEntity {
    @Id
    @Column(name = "id", nullable = false)
    private byte id;

    @Basic
    @Column(name = "levels_id", nullable = false)
    private byte levelsId;

    @Basic
    @Column(name = "position", nullable = false)
    private long position;

    @Basic
    @Column(name = "target_position", nullable = false)
    private long targetPosition;

    @Basic
    @Column(name = "is_visible", nullable = false)
    private byte isVisible;

    @Basic
    @Column(name = "is_working", nullable = false)
    private byte isWorking;

    @Basic
    @Column(name = "gfx", nullable = false)
    private byte gfx;

    @ManyToOne
    @JoinColumn(name = "maps_id", referencedColumnName = "id", nullable = false)
    private MapsEntity mapsByMapsId;

    @ManyToOne
    @JoinColumn(name = "target_maps_id", referencedColumnName = "id", nullable = false)
    private MapsEntity mapsByTargetMapsId;
}
