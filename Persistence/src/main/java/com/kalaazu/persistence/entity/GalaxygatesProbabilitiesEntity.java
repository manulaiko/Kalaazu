package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;

/**
 * Galaxygates probabilities entity.
 * =================================
 *
 * Entity for the `galaxygates_probabilities` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "galaxygates_probabilities", schema = "kalaazu")
@Data
public class GalaxygatesProbabilitiesEntity {
    @Id
    @Column(name = "id", nullable = false)
    private byte id;

    @Basic
    @Column(name = "type", nullable = false)
    private byte type;

    @Basic
    @Column(name = "probability", nullable = false, precision = 0)
    private double probability;

    @ManyToOne
    @JoinColumn(name = "galaxygates_id", referencedColumnName = "id", nullable = false)
    private GalaxygatesEntity galaxygatesByGalaxygatesId;
}
