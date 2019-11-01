package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;

/**
 * Techfactory costs entity.
 * =========================
 *
 * Entity for the `techfactory_costs` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "techfactory_costs", schema = "kalaazu")
@Data
public class TechfactoryCostsEntity {
    @Id
    @Column(name = "id", nullable = false)
    private byte id;

    @Basic
    @Column(name = "amount", nullable = false)
    private int amount;

    @ManyToOne
    @JoinColumn(name = "items_id", referencedColumnName = "id", nullable = false)
    private ItemsEntity itemsByItemsId;

    @ManyToOne
    @JoinColumn(name = "techfactory_items_id", referencedColumnName = "id", nullable = false)
    private TechfactoryItemsEntity techfactoryItemsByTechfactoryItemsId;
}
