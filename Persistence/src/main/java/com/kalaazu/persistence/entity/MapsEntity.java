package com.kalaazu.persistence.entity;

import com.kalaazu.math.Vector2;
import com.kalaazu.persistence.Vector2Type;
import jakarta.persistence.*;
import lombok.Data;
import org.hibernate.annotations.Type;

import java.util.Collection;

/**
 * Maps entity.
 * ============
 * <p>
 * Entity for the `maps` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "maps", schema = "kalaazu")
@Data
public class MapsEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private byte id;

    @Basic
    @Column(name = "name", nullable = false)
    private String name = "";

    @Basic
    @Column(name = "is_pvp", nullable = false)
    private boolean isPvp = false;

    @Basic
    @Column(name = "is_starter", nullable = false)
    private boolean isStarter = false;

    @Basic
    @Column(name = "limits", nullable = false)
    @Type(value = Vector2Type.class)
    private Vector2 limits = new Vector2(89335319769600L);

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "factions_id", referencedColumnName = "id")
    private FactionsEntity factionsByFactionsId;

    @OneToMany(mappedBy = "mapsByMapsId", fetch = FetchType.EAGER)
    private Collection<MapsNpcsEntity> mapsNpcs;

    @OneToMany(mappedBy = "mapsByMapsId", fetch = FetchType.EAGER)
    private Collection<MapsPortalsEntity> mapsPortals;

    @OneToMany(mappedBy = "mapsByMapsId", fetch = FetchType.EAGER)
    private Collection<MapsStationsEntity> mapsStations;

    @OneToMany(mappedBy = "mapsByMapsId", fetch = FetchType.EAGER)
    private Collection<MapsCollectablesEntity> mapsCollectables;
}
