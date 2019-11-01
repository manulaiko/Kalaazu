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
    private String name;

    @Basic
    @Column(name = "parts", nullable = false)
    private byte parts;

    @ManyToOne
    @JoinColumn(name = "galaxygates_waves_id", referencedColumnName = "id", nullable = false)
    private GalaxygatesWavesEntity galaxygatesWavesByGalaxygatesWavesId;

    @OneToMany(mappedBy = "galaxygatesByGalaxygatesId")
    private Collection<GalaxygatesGgSpinsEntity> galaxygatesGgSpins;

    @OneToMany(mappedBy = "galaxygatesByGalaxygatesId")
    private Collection<GalaxygatesGgWavesEntity> galaxygatesGgWaves;

    @OneToMany(mappedBy = "galaxygatesByGalaxygatesId")
    private Collection<GalaxygatesProbabilitiesEntity> galaxygatesProbabilities;

    @OneToMany(mappedBy = "galaxygatesByGalaxygatesId")
    private Collection<RewardsGalaxygatesEntity> rewardsGalaxygates;
}
