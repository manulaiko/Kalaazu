package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;

/**
 * Skylab modules entity.
 * ======================
 *
 * Entity for the `skylabs_modules` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "skylab_modules", schema = "kalaazu")
@Data
public class SkylabModulesEntity {
    @Id
    @Column(name = "id", nullable = false)
    private byte id;

    @Basic
    @Column(name = "name", nullable = false)
    private String name;

    @Basic
    @Column(name = "production_factor", nullable = false)
    private byte productionFactor;

    @Basic
    @Column(name = "production_base", nullable = false)
    private short productionBase;

    @Basic
    @Column(name = "storage_factor", nullable = false)
    private short storageFactor;

    @Basic
    @Column(name = "storage_base", nullable = false)
    private short storageBase;

    @Basic
    @Column(name = "upgrade_factor", nullable = false)
    private byte upgradeFactor;

    @Basic
    @Column(name = "upgrade_base", nullable = false)
    private short upgradeBase;

    @Basic
    @Column(name = "energy_factor", nullable = false)
    private byte energyFactor;

    @Basic
    @Column(name = "energy_base", nullable = false)
    private byte energyBase;
}
