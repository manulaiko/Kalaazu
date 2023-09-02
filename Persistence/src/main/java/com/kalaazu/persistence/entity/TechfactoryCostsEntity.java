package com.kalaazu.persistence.entity;

import jakarta.persistence.*;
import lombok.Data;

/**
 * Techfactory costs entity.
 * =========================
 * <p>
 * Entity for the `techfactory_costs` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "techfactory_costs", schema = "kalaazu")
@Data
public class TechfactoryCostsEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private byte id;

    @Basic
    @Column(name = "amount", nullable = false)
    private int amount;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "items_id", referencedColumnName = "id", nullable = false)
    private ItemsEntity itemsByItemsId;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "techfactory_items_id", referencedColumnName = "id", nullable = false)
    private TechfactoryItemsEntity techfactoryItemsByTechfactoryItemsId;
}
