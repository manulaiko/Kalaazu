package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.Collection;

/**
 * Galaxygates stages entity.
 * ==========================
 *
 * Entity for the `galaxygates_stages` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "galaxygates_stages", schema = "kalaazu")
@Data
public class GalaxygatesStagesEntity {
    @Id
    @Column(name = "id", nullable = false)
    private int id;

    @Basic
    @Column(name = "comment", length = -1)
    private String comment;

    @ManyToOne
    @JoinColumn(name = "galaxygates_waves_id", referencedColumnName = "id", nullable = false)
    private GalaxygatesWavesEntity galaxygatesWavesByGalaxygatesWavesId;

    @ManyToMany
    @JoinTable(
            name = "galaxygates_stages_spawns",
            joinColumns = @JoinColumn(name = "galaxygates_stages_id"),
            inverseJoinColumns = @JoinColumn(name = "galaxygates_spawns_id")
    )
    private Collection<GalaxygatesSpawnsEntity> galaxygatesSpawns;
}
