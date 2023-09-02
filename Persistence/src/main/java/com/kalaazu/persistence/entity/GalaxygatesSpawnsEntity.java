package com.kalaazu.persistence.entity;

import jakarta.persistence.*;
import lombok.Data;

/**
 * Galaxygates spawns entity.
 * ==========================
 * <p>
 * Entity for the `galaxygates_spawns` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "galaxygates_spawns", schema = "kalaazu")
@Data
public class GalaxygatesSpawnsEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private int id;

    @Basic
    @Column(name = "amount", nullable = false)
    private byte amount = 20;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "npcs_id", referencedColumnName = "id", nullable = false)
    private NpcsEntity npcsByNpcsId;
}
