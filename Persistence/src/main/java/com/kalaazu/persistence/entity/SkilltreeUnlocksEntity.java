package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "skilltree_unlocks", schema = "kalaazu", catalog = "")
public class SkilltreeUnlocksEntity {
    private short                 id;
    private SkilltreeLevelsEntity skilltreeLevelsByUpgradeSkilltreeLevelsId;
    private SkilltreeLevelsEntity skilltreeLevelsByRequiredSkilltreeLevelsId;

    @Id
    @Column(name = "id", nullable = false)
    public short getId() {
        return id;
    }

    public void setId(short id) {
        this.id = id;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        SkilltreeUnlocksEntity that = (SkilltreeUnlocksEntity) o;
        return id == that.id;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

    @ManyToOne
    @JoinColumn(name = "upgrade_skilltree_levels_id", referencedColumnName = "id", nullable = false)
    public SkilltreeLevelsEntity getSkilltreeLevelsByUpgradeSkilltreeLevelsId() {
        return skilltreeLevelsByUpgradeSkilltreeLevelsId;
    }

    public void setSkilltreeLevelsByUpgradeSkilltreeLevelsId(
            SkilltreeLevelsEntity skilltreeLevelsByUpgradeSkilltreeLevelsId
    ) {
        this.skilltreeLevelsByUpgradeSkilltreeLevelsId = skilltreeLevelsByUpgradeSkilltreeLevelsId;
    }

    @ManyToOne
    @JoinColumn(name = "required_skilltree_levels_id", referencedColumnName = "id", nullable = false)
    public SkilltreeLevelsEntity getSkilltreeLevelsByRequiredSkilltreeLevelsId() {
        return skilltreeLevelsByRequiredSkilltreeLevelsId;
    }

    public void setSkilltreeLevelsByRequiredSkilltreeLevelsId(
            SkilltreeLevelsEntity skilltreeLevelsByRequiredSkilltreeLevelsId
    ) {
        this.skilltreeLevelsByRequiredSkilltreeLevelsId = skilltreeLevelsByRequiredSkilltreeLevelsId;
    }
}
