package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;

/**
 * Galaxygates spins entity.
 * =========================
 *
 * Entity for the `galaxygates_spins` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "galaxygates_spins", schema = "kalaazu")
@Data
public class GalaxygatesSpinsEntity {
    @Id
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

    @ManyToOne
    @JoinColumn(name = "items_id", referencedColumnName = "id", nullable = false)
    private ItemsEntity itemsByItemsId;
}
