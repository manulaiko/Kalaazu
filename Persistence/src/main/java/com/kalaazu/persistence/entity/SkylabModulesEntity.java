package com.kalaazu.persistence.entity;

import jakarta.persistence.*;
import lombok.Data;

/**
 * Skylab modules entity.
 * ======================
 * <p>
 * Entity for the `skylabs_modules` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "skylab_modules", schema = "kalaazu")
@Data
public class SkylabModulesEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private byte id;

    @Basic
    @Column(name = "name", nullable = false)
    private String name = "";

    @Basic
    @Column(name = "production_factor", nullable = false)
    private byte productionFactor = 20;

    @Basic
    @Column(name = "production_base", nullable = false)
    private short productionBase = 1000;

    @Basic
    @Column(name = "storage_factor", nullable = false)
    private short storageFactor = 50;

    @Basic
    @Column(name = "storage_base", nullable = false)
    private short storageBase = 20000;

    @Basic
    @Column(name = "upgrade_factor", nullable = false)
    private byte upgradeFactor = 35;

    @Basic
    @Column(name = "upgrade_base", nullable = false)
    private short upgradeBase = 5000;

    @Basic
    @Column(name = "energy_factor", nullable = false)
    private byte energyFactor = 10;

    @Basic
    @Column(name = "energy_base", nullable = false)
    private byte energyBase = 10;
}
