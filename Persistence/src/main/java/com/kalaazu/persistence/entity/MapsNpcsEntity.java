package com.kalaazu.persistence.entity;

import jakarta.persistence.*;
import lombok.Data;

/**
 * Maps npcs entity.
 * =================
 * <p>
 * Entity for the `maps_npcs` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "maps_npcs", schema = "kalaazu")
@Data
public class MapsNpcsEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private byte id;

    @Basic
    @Column(name = "amount", nullable = false)
    private byte amount = 0;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "maps_id", referencedColumnName = "id", nullable = false)
    private MapsEntity mapsByMapsId;

    @Basic
    @Column(name= "maps_id", nullable = false, insertable = false, updatable = false)
    private byte mapsId = 0;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "npcs_id", referencedColumnName = "id", nullable = false)
    private NpcsEntity npcsByNpcsId;

    @Basic
    @Column(name= "npcs_id", nullable = false, insertable = false, updatable = false)
    private byte npcsId = 0;
}
