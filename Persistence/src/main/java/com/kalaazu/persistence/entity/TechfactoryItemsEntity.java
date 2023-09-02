package com.kalaazu.persistence.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.util.Collection;

/**
 * Techfactory items entity.
 * =========================
 * <p>
 * Entity for the `techfactory_items` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "techfactory_items", schema = "kalaazu")
@Data
public class TechfactoryItemsEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private byte id;

    @Basic
    @Column(name = "name", nullable = false)
    private String name;

    @Basic
    @Column(name = "description", nullable = false, length = -1, columnDefinition = "TEXT")
    private String description;

    @Basic
    @Column(name = "effect", nullable = false, length = -1, columnDefinition = "TEXT")
    private String effect;

    @Basic
    @Column(name = "duration", nullable = false)
    private short duration = 900;

    @Basic
    @Column(name = "cooldown", nullable = false)
    private short cooldown = 900;

    @Basic
    @Column(name = "time", nullable = false)
    private int time;

    @Basic
    @Column(name = "free_production", nullable = false)
    private short freeProduction;

    @Basic
    @Column(name = "instant_production", nullable = false)
    private short instantProduction;

    @OneToMany(mappedBy = "techfactoryItemsByTechfactoryItemsId", fetch = FetchType.EAGER)
    private Collection<TechfactoryCostsEntity> techfactoryCosts;
}
