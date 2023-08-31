package com.kalaazu.persistence.entity;

import jakarta.persistence.*;
import lombok.Data;

/**
 * Galaxygates spins entity.
 * =========================
 * <p>
 * Entity for the `galaxygates_spins` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "galaxygates_spins", schema = "kalaazu")
@Data
public class GalaxygatesSpinsEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private byte id;

    @Basic
    @Column(name = "type", nullable = false)
    @Enumerated(EnumType.ORDINAL)
    private ProbabilityType type = ProbabilityType.AMMO;

    @Basic
    @Column(name = "probability", nullable = false)
    private double probability = 0;

    @Basic
    @Column(name = "amount", nullable = false)
    private short amount = 1;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "items_id", referencedColumnName = "id", nullable = false)
    private ItemsEntity itemsByItemsId;
}
