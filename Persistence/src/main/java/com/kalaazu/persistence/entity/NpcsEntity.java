package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.Collection;

/**
 * Npcs entity.
 * ============
 *
 * Entity for the `npcs` table.
 *
 * @author Manulaiko <manulaiko@gamil.com>
 */
@Entity
@Table(name = "npcs", schema = "kalaazu")
@Data
public class NpcsEntity {
    @Id
    @Column(name = "id", nullable = false)
    private byte id;

    @Basic
    @Column(name = "name", nullable = false)
    private String name = "";

    @Basic
    @Column(name = "health", nullable = false)
    private int health = 0;

    @Basic
    @Column(name = "shield", nullable = false)
    private int shield = 0;

    @Basic
    @Column(name = "shield_absorption", nullable = false, precision = 2)
    private double shieldAbsorption = 0;

    @Basic
    @Column(name = "damage", nullable = false)
    private int damage = 0;

    @Basic
    @Column(name = "speed", nullable = false)
    private short speed = 0;

    @Basic
    @Column(name = "gfx", nullable = false)
    private byte gfx = 0;

    @Basic
    @Column(name = "ai", nullable = false)
    private byte ai = 1;

    @ManyToMany
    @JoinTable(
            name = "rewards_npcs",
            joinColumns = @JoinColumn(name = "npcs_id"),
            inverseJoinColumns = @JoinColumn(name = "rewards_id")
    )
    private Collection<RewardsEntity> rewards;
}
