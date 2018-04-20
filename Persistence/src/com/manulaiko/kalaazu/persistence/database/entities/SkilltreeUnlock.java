package com.manulaiko.kalaazu.persistence.database.entities;

import javax.persistence.*;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "skilltree_unlocks", schema = "kalaazu")
public class SkilltreeUnlock {
    private int id;

    private int upgradeSkilltreeLevelsId;

    private int requiredSkilltreeLevelsId;

    private SkilltreeLevel skilltreeLevelsByUpgradeSkilltreeLevelsId;

    private SkilltreeLevel skilltreeLevelsByRequiredSkilltreeLevelsId;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "upgrade_skilltree_levels_id")
    public int getUpgradeSkilltreeLevelsId() {
        return upgradeSkilltreeLevelsId;
    }

    public void setUpgradeSkilltreeLevelsId(int upgradeSkilltreeLevelsId) {
        this.upgradeSkilltreeLevelsId = upgradeSkilltreeLevelsId;
    }

    @Basic
    @Column(name = "required_skilltree_levels_id")
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

    @ManyToOne
    @JoinColumn(name = "upgrade_skilltree_levels_id", referencedColumnName = "id", nullable = false)
    public SkilltreeLevel getSkilltreeLevelsByUpgradeSkilltreeLevelsId() {
        return skilltreeLevelsByUpgradeSkilltreeLevelsId;
    }

    public void setSkilltreeLevelsByUpgradeSkilltreeLevelsId(
            SkilltreeLevel skilltreeLevelsByUpgradeSkilltreeLevelsId
    ) {
        this.skilltreeLevelsByUpgradeSkilltreeLevelsId = skilltreeLevelsByUpgradeSkilltreeLevelsId;
    }

    @ManyToOne
    @JoinColumn(name = "required_skilltree_levels_id", referencedColumnName = "id", nullable = false)
    public SkilltreeLevel getSkilltreeLevelsByRequiredSkilltreeLevelsId() {
        return skilltreeLevelsByRequiredSkilltreeLevelsId;
    }

    public void setSkilltreeLevelsByRequiredSkilltreeLevelsId(
            SkilltreeLevel skilltreeLevelsByRequiredSkilltreeLevelsId
    ) {
        this.skilltreeLevelsByRequiredSkilltreeLevelsId = skilltreeLevelsByRequiredSkilltreeLevelsId;
    }
}
