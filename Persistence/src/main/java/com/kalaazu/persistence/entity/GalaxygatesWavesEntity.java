package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.Collection;

/**
 * Galaxygates waves entity.
 * =========================
 *
 * Entity for the `galaxygates_waves` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "galaxygates_waves", schema = "kalaazu")
@Data
public class GalaxygatesWavesEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private byte id;

    @Basic
    @Column(name = "seconds", nullable = false)
    private byte seconds = 120;

    @Basic
    @Column(name = "npcs", nullable = false)
    private byte npcs = 5;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "maps_id", referencedColumnName = "id", nullable = false)
    private MapsEntity mapsByMapsId;

    @OneToMany(mappedBy = "galaxygatesWavesByGalaxygatesWavesId", fetch = FetchType.LAZY)
    private Collection<GalaxygatesStagesEntity> galaxygatesStages;
}
