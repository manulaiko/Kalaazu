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
    @Column(name = "position", nullable = false)
    private long position = 0;

    @Basic
    @Column(name = "target_position", nullable = false)
    private long targetPosition = 0;

    @Basic
    @Column(name = "is_visible", nullable = false)
    private boolean isVisible = true;

    @Basic
    @Column(name = "is_working", nullable = false)
    private boolean isWorking = true;

    @Basic
    @Column(name = "gfx", nullable = false)
    private byte gfx = 1;

    @ManyToOne
    @JoinColumn(name = "maps_id", referencedColumnName = "id", nullable = false)
    private MapsEntity mapsByMapsId;

    @ManyToOne
    @JoinColumn(name = "target_maps_id", referencedColumnName = "id", nullable = false)
    private MapsEntity mapsByTargetMapsId;

    @OneToMany
    @JoinColumn(name = "levels_id", referencedColumnName = "id", nullable = false)
    private LevelsEntity levelsByLevelsId;
}
