package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;

/**
 * Rewards entity.
 * ===============
 *
 * Entity for the `rewards` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "rewards", schema = "kalaazu")
@Data
public class RewardsEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private short id;

    @Basic
    @Column(name = "amount", nullable = false)
    private int amount;

    @Basic
    @Column(name = "probability", nullable = false, precision = 2)
    private double probability = 100;

    @Basic
    @Column(name = "comment")
    private String comment;

    @ManyToOne
    @JoinColumn(name = "items_id", referencedColumnName = "id", nullable = false)
    private ItemsEntity itemsByItemsId;
}
