package com.kalaazu.persistence.entity;

import com.kalaazu.math.Vector2;
import com.kalaazu.persistence.Vector2Type;
import jakarta.persistence.*;
import lombok.Data;
import org.hibernate.annotations.Type;

/**
 * Maps portals entity.
 * ====================
 * <p>
 * Entity for the `maps_portals` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "maps_portals", schema = "kalaazu")
@Data
public class MapsPortalsEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private byte id;

    @Basic
    @Column(name = "position", nullable = false)
    @Type(value = Vector2Type.class)
    private Vector2 position = new Vector2(0L);

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

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "maps_id", referencedColumnName = "id", nullable = false)
    private MapsEntity mapsByMapsId;

    @Basic
    @Column(name= "maps_id", nullable = false, insertable = false, updatable = false)
    private byte mapsId = 0;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "target_maps_id", referencedColumnName = "id", nullable = false)
    private MapsEntity mapsByTargetMapsId;

    @Basic
    @Column(name= "target_maps_id", nullable = false, insertable = false, updatable = false)
    private byte targetMapsId = 0;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "levels_id", referencedColumnName = "id", nullable = false)
    private LevelsEntity levelsByLevelsId;

    @Basic
    @Column(name= "levels_id", nullable = false, insertable = false, updatable = false)
    private byte levelsId = 0;
}
