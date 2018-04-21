package com.manulaiko.kalaazu.persistence.database.entities;


import java.math.BigDecimal;
import java.util.Collection;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class SkylabModule {
    private int id;

    private String name;

    private BigDecimal productionFactor;

    private int productionBase;

    private BigDecimal storageFactor;

    private int storageBase;

    private BigDecimal upgradeFactor;

    private int upgradeBase;

    private BigDecimal energyFactor;

    private int energyBase;

    private Collection<AccountsSkylab> accountsSkylabsById;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public BigDecimal getProductionFactor() {
        return productionFactor;
    }

    public void setProductionFactor(BigDecimal productionFactor) {
        this.productionFactor = productionFactor;
    }

    public int getProductionBase() {
        return productionBase;
    }

    public void setProductionBase(int productionBase) {
        this.productionBase = productionBase;
    }

    public BigDecimal getStorageFactor() {
        return storageFactor;
    }

    public void setStorageFactor(BigDecimal storageFactor) {
        this.storageFactor = storageFactor;
    }

    public int getStorageBase() {
        return storageBase;
    }

    public void setStorageBase(int storageBase) {
        this.storageBase = storageBase;
    }

    public BigDecimal getUpgradeFactor() {
        return upgradeFactor;
    }

    public void setUpgradeFactor(BigDecimal upgradeFactor) {
        this.upgradeFactor = upgradeFactor;
    }

    public int getUpgradeBase() {
        return upgradeBase;
    }

    public void setUpgradeBase(int upgradeBase) {
        this.upgradeBase = upgradeBase;
    }

    public BigDecimal getEnergyFactor() {
        return energyFactor;
    }

    public void setEnergyFactor(BigDecimal energyFactor) {
        this.energyFactor = energyFactor;
    }

    public int getEnergyBase() {
        return energyBase;
    }

    public void setEnergyBase(int energyBase) {
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
        SkylabModule that = (SkylabModule) o;
        return id == that.id &&
               productionBase == that.productionBase &&
               storageBase == that.storageBase &&
               upgradeBase == that.upgradeBase &&
               energyBase == that.energyBase &&
               Objects.equals(name, that.name) &&
               Objects.equals(productionFactor, that.productionFactor) &&
               Objects.equals(storageFactor, that.storageFactor) &&
               Objects.equals(upgradeFactor, that.upgradeFactor) &&
               Objects.equals(energyFactor, that.energyFactor);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, name, productionFactor, productionBase, storageFactor, storageBase, upgradeFactor,
                            upgradeBase, energyFactor, energyBase
        );
    }

    public Collection<AccountsSkylab> getAccountsSkylabsById() {
        return accountsSkylabsById;
    }

    public void setAccountsSkylabsById(
            Collection<AccountsSkylab> accountsSkylabsById
    ) {
        this.accountsSkylabsById = accountsSkylabsById;
    }
}
