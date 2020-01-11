package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;

/**
 * Levels entity.
 * ==============
 *
 * Entity for the `levels` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "levels", schema = "kalaazu")
@Data
public class LevelsEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private byte id;

    @Basic
    @Column(name = "account", nullable = false)
    private long account = 0;

    @Basic
    @Column(name = "drone", nullable = false)
    private short drone = -1;

    @Basic
    @Column(name = "pet", nullable = false)
    private int pet = -1;

    @Basic
    @Column(name = "damage", nullable = false, precision = 1)
    private double damage = 0;

    @Basic
    @Column(name = "shield", nullable = false, precision = 1)
    private double shield = 0;
}
