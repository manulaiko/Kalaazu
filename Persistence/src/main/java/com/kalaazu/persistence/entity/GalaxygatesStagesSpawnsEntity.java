package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;

/**
 * Galaxygates stages spawns entity.
 * =================================
 *
 * Entity for the `galaxygates_stages_spawns` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "galaxygates_stages_spawns", schema = "kalaazu")
@Data
public class GalaxygatesStagesSpawnsEntity {
    @Id
    @Column(name = "id", nullable = false)
    private int id;

    @ManyToOne
    @JoinColumn(name = "galaxygates_stages_id", referencedColumnName = "id", nullable = false)
    private GalaxygatesStagesEntity galaxygatesStagesByGalaxygatesStagesId;

    @ManyToOne
    @JoinColumn(name = "galaxygates_spawns_id", referencedColumnName = "id", nullable = false)
    private GalaxygatesSpawnsEntity galaxygatesSpawnsByGalaxygatesSpawnsId;
}
