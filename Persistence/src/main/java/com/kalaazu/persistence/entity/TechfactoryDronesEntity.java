package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;

/**
 * Techfactory drones entity.
 * ==========================
 *
 * Entity for the `techfactory_drones` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "techfactory_drones", schema = "kalaazu")
@Data
public class TechfactoryDronesEntity {
    @Id
    @Column(name = "id", nullable = false)
    private byte id;

    @Basic
    @Column(name = "name", nullable = false)
    private String name;

    @Basic
    @Column(name = "description", nullable = false, length = -1, columnDefinition = "TEXT")
    private String description;

    @Basic
    @Column(name = "time", nullable = false)
    private byte time;

    @Basic
    @Column(name = "parts", nullable = false)
    private byte parts;

    @Basic
    @Column(name = "price", nullable = false)
    private int price;

    @Basic
    @Column(name = "factor", nullable = false)
    private byte factor;
}