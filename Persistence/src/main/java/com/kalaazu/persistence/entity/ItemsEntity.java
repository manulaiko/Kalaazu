package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;

/**
 * Items entity.
 * =============
 *
 * Entity for the `items` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "items", schema = "kalaazu")
@Data
public class ItemsEntity {
    @Id
    @Column(name = "id", nullable = false)
    private short id;

    @Basic
    @Column(name = "name", nullable = false)
    private String name = "";

    @Basic
    @Column(name = "category", nullable = false)
    private byte category = 0;

    @Basic
    @Column(name = "description", nullable = false, length = -1, columnDefinition = "TEXT")
    private String description;

    @Basic
    @Column(name = "price", nullable = false)
    private int price = 0;

    @Basic
    @Column(name = "type", nullable = false)
    private byte type = 0;

    @Basic
    @Column(name = "is_elite", nullable = false)
    private boolean isElite = false;

    @Basic
    @Column(name = "is_event", nullable = false)
    private boolean isEvent = false;

    @Basic
    @Column(name = "is_buyable", nullable = false)
    private boolean isBuyable = true;

}
