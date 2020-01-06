package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.Collection;

/**
 * Galaxygates entity.
 * ===================
 *
 * Entity for the `galaxygates` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "galaxygates", schema = "kalaazu")
@Data
public class GalaxygatesEntity {
    @Id
    @Column(name = "id", nullable = false)
    private byte id;

    @Basic
    @Column(name = "name", nullable = false)
    private String name = "GG-A";

    @Basic
    @Column(name = "parts", nullable = false)
    private byte parts = 0;

    @ManyToOne
    @JoinColumn(name = "galaxygates_waves_id", referencedColumnName = "id", nullable = false)
    private GalaxygatesWavesEntity galaxygatesWavesByGalaxygatesWavesId;

    @OneToMany(mappedBy = "galaxygatesByGalaxygatesId")
    private Collection<GalaxygatesProbabilitiesEntity> galaxygatesProbabilities;

    @ManyToMany
    @JoinTable(
            name = "galaxygates_gg_spins",
            joinColumns = @JoinColumn(name = "galaxygates_id"),
            inverseJoinColumns = @JoinColumn(name = "galaxygates_spins_id")
    )
    private Collection<GalaxygatesSpinsEntity> galaxygatesSpins;

    @ManyToMany
    @JoinTable(
            name = "galaxygates_gg_waves",
            joinColumns = @JoinColumn(name = "galaxygates_id"),
            inverseJoinColumns = @JoinColumn(name = "galaxygates_waves_id")
    )
    private Collection<GalaxygatesWavesEntity> galaxygatesWaves;

    @ManyToMany
    @JoinTable(
            name = "rewards_galaxygates",
            joinColumns = @JoinColumn(name = "galaxygates_id"),
            inverseJoinColumns = @JoinColumn(name = "rewards_id")
    )
    private Collection<RewardsEntity> rewards;
}
