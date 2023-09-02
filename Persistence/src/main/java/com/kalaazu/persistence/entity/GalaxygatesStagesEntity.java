package com.kalaazu.persistence.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.util.Collection;

/**
 * Galaxygates stages entity.
 * ==========================
 * <p>
 * Entity for the `galaxygates_stages` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "galaxygates_stages", schema = "kalaazu")
@Data
public class GalaxygatesStagesEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private int id;

    @Basic
    @Column(name = "comment", length = -1, columnDefinition = "TEXT")
    private String comment;

    @ManyToOne(fetch = FetchType.EAGER)
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
