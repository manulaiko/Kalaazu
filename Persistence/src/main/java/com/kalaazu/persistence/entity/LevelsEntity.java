package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;

/**
 * Levels entity.
 * ==============
 *
 * Entity for the `levels` table.
 *
 * @author Manulaiko <manulaiko@gmial.com>
 */
@Entity
@Table(name = "levels", schema = "kalaazu")
@Data
public class LevelsEntity {

    @Id
    @Column(name = "id", nullable = false)
    private byte id;

    @Basic
    @Column(name = "account", nullable = false)
    private long account;

    @Basic
    @Column(name = "drone", nullable = false)
    private short drone;

    @Basic
    @Column(name = "pet", nullable = false)
    private int pet;

    @Basic
    @Column(name = "damage", nullable = false)
    private double damage;

    @Basic
    @Column(name = "shield", nullable = false)
    private double shield;
}
