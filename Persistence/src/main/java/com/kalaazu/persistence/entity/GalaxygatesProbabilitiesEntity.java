package com.kalaazu.persistence.entity;

import jakarta.persistence.*;
import lombok.Data;

/**
 * Galaxygates probabilities entity.
 * =================================
 * <p>
 * Entity for the `galaxygates_probabilities` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "galaxygates_probabilities", schema = "kalaazu")
@Data
public class GalaxygatesProbabilitiesEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private byte id;

    @Basic
    @Column(name = "type", nullable = false)
    @Enumerated(EnumType.ORDINAL)
    private ProbabilityType type = ProbabilityType.AMMO;

    @Basic
    @Column(name = "probability", nullable = false, precision = 2)
    private double probability = 100;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "galaxygates_id", referencedColumnName = "id", nullable = false)
    private GalaxygatesEntity galaxygatesByGalaxygatesId;
}
