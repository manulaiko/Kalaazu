package com.kalaazu.persistence.entity;

import jakarta.persistence.*;
import lombok.Data;

/**
 * Techfactory drones entity.
 * ==========================
 * <p>
 * Entity for the `techfactory_drones` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "techfactory_drones", schema = "kalaazu")
@Data
public class TechfactoryDronesEntity {
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
    @Column(name = "time", nullable = false)
    private byte time = 0;

    @Basic
    @Column(name = "parts", nullable = false)
    private byte parts = 45;

    @Basic
    @Column(name = "price", nullable = false)
    private int price = 0;

    @Basic
    @Column(name = "factor", nullable = false)
    private byte factor = 5;
}
