package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.Collection;

/**
 * Techfactory items entity.
 * =========================
 *
 * Entity for the `techfactory_items` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "techfactory_items", schema = "kalaazu")
@Data
public class TechfactoryItemsEntity {
    @Id
    @Column(name = "id", nullable = false)
    private byte id;

    @Basic
    @Column(name = "name", nullable = false, length = 255)
    private String name;

    @Basic
    @Column(name = "description", nullable = false, length = -1)
    private String description;

    @Basic
    @Column(name = "effect", nullable = false, length = -1)
    private String effect;

    @Basic
    @Column(name = "duration", nullable = false)
    private short duration;

    @Basic
    @Column(name = "cooldown", nullable = false)
    private short cooldown;

    @Basic
    @Column(name = "time", nullable = false)
    private int time;

    @Basic
    @Column(name = "free_production", nullable = false)
    private short freeProduction;

    @Basic
    @Column(name = "instant_production", nullable = false)
    private short instantProduction;

    @OneToMany(mappedBy = "techfactoryItemsByTechfactoryItemsId")
    private Collection<TechfactoryCostsEntity> techfactoryCosts;
}
