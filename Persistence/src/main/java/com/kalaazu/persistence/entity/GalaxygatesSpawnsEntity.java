package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;

/**
 * Galaxygates spawns entity.
 * ==========================
 *
 * Entity for the `galaxygates_spawns` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "galaxygates_spawns", schema = "kalaazu")
@Data
public class GalaxygatesSpawnsEntity {
    @Id
    @Column(name = "id", nullable = false)
    private int id;

    @Basic
    @Column(name = "amount", nullable = false)
    private byte amount = 20;

    @ManyToOne
    @JoinColumn(name = "npcs_id", referencedColumnName = "id", nullable = false)
    private NpcsEntity npcsByNpcsId;
}
