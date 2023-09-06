package com.kalaazu.persistence.entity;

import jakarta.persistence.*;
import lombok.Data;

/**
 * Items entity.
 * =============
 * <p>
 * Entity for the `items` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "items", schema = "kalaazu")
@Data
public class ItemsEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private short id;

    @Basic
    @Column(name = "name", nullable = false)
    private String name = "";

    @Basic
    @Column(name = "loot_id", nullable = false)
    private String lootId = "";

    @Basic
    @Column(name = "category", nullable = false)
    @Enumerated(EnumType.ORDINAL)
    private ItemCategory category = ItemCategory.CURRENCY;

    @Basic
    @Column(name = "description", nullable = false, length = -1, columnDefinition = "TEXT")
    private String description;

    @Basic
    @Column(name = "price", nullable = false)
    private int price = 0;

    @Basic
    @Column(name = "type", nullable = false)
    @Enumerated(EnumType.ORDINAL)
    private ItemType type = ItemType.OTHER;

    @Basic
    @Column(name = "cooldown", nullable = false)
    private int cooldown = 1000;

    @Basic
    @Column(name = "is_elite", nullable = false)
    private boolean isElite = false;

    @Basic
    @Column(name = "is_event", nullable = false)
    private boolean isEvent = false;

    @Basic
    @Column(name = "is_buyable", nullable = false)
    private boolean isBuyable = true;

    @Basic
    @Column(name = "bonus", nullable = false)
    private int bonus = 0;
}
