package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "skylab_modules", schema = "kalaazu", catalog = "")
public class SkylabModulesEntity {
    private byte   id;
    private String name;
    private byte   productionFactor;
    private short  productionBase;
    private short  storageFactor;
    private short  storageBase;
    private byte   upgradeFactor;
    private short  upgradeBase;
    private byte   energyFactor;
    private byte   energyBase;

    @Id
    @Column(name = "id", nullable = false)
    public byte getId() {
        return id;
    }

    public void setId(byte id) {
        this.id = id;
    }

    @Basic
    @Column(name = "name", nullable = false, length = 255)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "production_factor", nullable = false)
    public byte getProductionFactor() {
        return productionFactor;
    }

    public void setProductionFactor(byte productionFactor) {
        this.productionFactor = productionFactor;
    }

    @Basic
    @Column(name = "production_base", nullable = false)
    public short getProductionBase() {
        return productionBase;
    }

    public void setProductionBase(short productionBase) {
        this.productionBase = productionBase;
    }

    @Basic
    @Column(name = "storage_factor", nullable = false)
    public short getStorageFactor() {
        return storageFactor;
    }

    public void setStorageFactor(short storageFactor) {
        this.storageFactor = storageFactor;
    }

    @Basic
    @Column(name = "storage_base", nullable = false)
    public short getStorageBase() {
        return storageBase;
    }

    public void setStorageBase(short storageBase) {
        this.storageBase = storageBase;
    }

    @Basic
    @Column(name = "upgrade_factor", nullable = false)
    public byte getUpgradeFactor() {
        return upgradeFactor;
    }

    public void setUpgradeFactor(byte upgradeFactor) {
        this.upgradeFactor = upgradeFactor;
    }

    @Basic
    @Column(name = "upgrade_base", nullable = false)
    public short getUpgradeBase() {
        return upgradeBase;
    }

    public void setUpgradeBase(short upgradeBase) {
        this.upgradeBase = upgradeBase;
    }

    @Basic
    @Column(name = "energy_factor", nullable = false)
    public byte getEnergyFactor() {
        return energyFactor;
    }

    public void setEnergyFactor(byte energyFactor) {
        this.energyFactor = energyFactor;
    }

    @Basic
    @Column(name = "energy_base", nullable = false)
    public byte getEnergyBase() {
        return energyBase;
    }

    public void setEnergyBase(byte energyBase) {
        this.energyBase = energyBase;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        SkylabModulesEntity that = (SkylabModulesEntity) o;
        return id == that.id &&
               productionFactor == that.productionFactor &&
               productionBase == that.productionBase &&
               storageFactor == that.storageFactor &&
               storageBase == that.storageBase &&
               upgradeFactor == that.upgradeFactor &&
               upgradeBase == that.upgradeBase &&
               energyFactor == that.energyFactor &&
               energyBase == that.energyBase &&
               Objects.equals(name, that.name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(
                id,
                name,
                productionFactor,
                productionBase,
                storageFactor,
                storageBase,
                upgradeFactor,
                upgradeBase,
                energyFactor,
                energyBase
        );
    }
}
