package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;

/**
 * Galaxygates gg spins entity.
 * ============================
 *
 * Entity for the `galaxygates_gg_spins` table.
 *
 * @author Manulaiko <manulaiko@gmial.com>
 */
@Entity
@Table(name = "galaxygates_gg_spins", schema = "kalaazu")
@Data
public class GalaxygatesGgSpinsEntity {
    @Id
    @Column(name = "id", nullable = false)
    private short id;

    @ManyToOne
    @JoinColumn(name = "galaxygates_id", referencedColumnName = "id", nullable = false)
    private GalaxygatesEntity galaxygatesByGalaxygatesId;

    @ManyToOne
    @JoinColumn(name = "galaxygates_spins_id", referencedColumnName = "id", nullable = false)
    private GalaxygatesSpinsEntity galaxygatesSpinsByGalaxygatesSpinsId;
}
