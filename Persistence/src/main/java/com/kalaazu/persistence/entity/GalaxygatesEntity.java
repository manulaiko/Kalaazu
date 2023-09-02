package com.kalaazu.persistence.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.util.Collection;

/**
 * Galaxygates entity.
 * ===================
 * <p>
 * Entity for the `galaxygates` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "galaxygates", schema = "kalaazu")
@Data
public class GalaxygatesEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private byte id;

    @Basic
    @Column(name = "name", nullable = false)
    private String name = "GG-A";

    @Basic
    @Column(name = "parts", nullable = false)
    private byte parts = 0;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "galaxygates_waves_id", referencedColumnName = "id", nullable = false)
    private GalaxygatesWavesEntity galaxygatesWavesByGalaxygatesWavesId;

    @OneToMany(mappedBy = "galaxygatesByGalaxygatesId", fetch = FetchType.EAGER)
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
