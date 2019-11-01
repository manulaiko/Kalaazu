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
    private String name;

    @Basic
    @Column(name = "category", nullable = false)
    private byte category;

    @Basic
    @Column(name = "description", nullable = false, length = -1, columnDefinition = "TEXT")
    private String description;

    @Basic
    @Column(name = "price", nullable = false)
    private int price;

    @Basic
    @Column(name = "type", nullable = false)
    private byte type;

    @Basic
    @Column(name = "is_elite", nullable = false)
    private byte isElite;

    @Basic
    @Column(name = "is_event", nullable = false)
    private byte isEvent;

    @Basic
    @Column(name = "is_buyable", nullable = false)
    private byte isBuyable;

}
