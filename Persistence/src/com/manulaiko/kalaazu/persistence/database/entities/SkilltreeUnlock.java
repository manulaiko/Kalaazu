package com.manulaiko.kalaazu.persistence.database.entities;


import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class SkilltreeUnlock {
    private int id;

    private int upgradeSkilltreeLevelsId;

    private int requiredSkilltreeLevelsId;

    private SkilltreeLevel skilltreeLevelsByUpgradeSkilltreeLevelsId;

    private SkilltreeLevel skilltreeLevelsByRequiredSkilltreeLevelsId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUpgradeSkilltreeLevelsId() {
        return upgradeSkilltreeLevelsId;
    }

    public void setUpgradeSkilltreeLevelsId(int upgradeSkilltreeLevelsId) {
        this.upgradeSkilltreeLevelsId = upgradeSkilltreeLevelsId;
    }

    public int getRequiredSkilltreeLevelsId() {
        return requiredSkilltreeLevelsId;
    }

    public void setRequiredSkilltreeLevelsId(int requiredSkilltreeLevelsId) {
        this.requiredSkilltreeLevelsId = requiredSkilltreeLevelsId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        SkilltreeUnlock that = (SkilltreeUnlock) o;
        return id == that.id &&
               upgradeSkilltreeLevelsId == that.upgradeSkilltreeLevelsId &&
               requiredSkilltreeLevelsId == that.requiredSkilltreeLevelsId;
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, upgradeSkilltreeLevelsId, requiredSkilltreeLevelsId);
    }

    public SkilltreeLevel getSkilltreeLevelsByUpgradeSkilltreeLevelsId() {
        return skilltreeLevelsByUpgradeSkilltreeLevelsId;
    }

    public void setSkilltreeLevelsByUpgradeSkilltreeLevelsId(
            SkilltreeLevel skilltreeLevelsByUpgradeSkilltreeLevelsId
    ) {
        this.skilltreeLevelsByUpgradeSkilltreeLevelsId = skilltreeLevelsByUpgradeSkilltreeLevelsId;
    }

    public SkilltreeLevel getSkilltreeLevelsByRequiredSkilltreeLevelsId() {
        return skilltreeLevelsByRequiredSkilltreeLevelsId;
    }

    public void setSkilltreeLevelsByRequiredSkilltreeLevelsId(
            SkilltreeLevel skilltreeLevelsByRequiredSkilltreeLevelsId
    ) {
        this.skilltreeLevelsByRequiredSkilltreeLevelsId = skilltreeLevelsByRequiredSkilltreeLevelsId;
    }
}
