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
 * @author Manulaiko <manulaiko@gmial.com>
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

    @OneToMany(mappedBy = "galaxygatesStagesByGalaxygatesStagesById")
    private Collection<GalaxygatesStagesSpawnsEntity> galaxygatesStagesSpawns;
}
