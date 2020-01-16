package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;

/**
 * Maps npcs entity.
 * =================
 *
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

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "npcs_id", referencedColumnName = "id", nullable = false)
    private NpcsEntity npcsByNpcsId;
}
