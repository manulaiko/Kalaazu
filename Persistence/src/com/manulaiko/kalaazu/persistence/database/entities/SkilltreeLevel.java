package com.manulaiko.kalaazu.persistence.database.entities;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "skilltree_levels", schema = "kalaazu")
public class SkilltreeLevel {
    private int id;

    private int skilltreeSkillsId;

    private int levelsId;

    private int credits;

    private int seprom;

    private byte points;

    private Collection<AccountsSkill> accountsSkillsById;

    private SkilltreeSkill skilltreeSkillsBySkilltreeSkillsId;

    private Level levelsByLevelsId;

    private Collection<SkilltreeUnlock> skilltreeUnlocksById;

    private Collection<SkilltreeUnlock> skilltreeUnlocksById_0;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "skilltree_skills_id")
    public int getSkilltreeSkillsId() {
        return skilltreeSkillsId;
    }

    public void setSkilltreeSkillsId(int skilltreeSkillsId) {
        this.skilltreeSkillsId = skilltreeSkillsId;
    }

    @Basic
    @Column(name = "levels_id")
    public int getLevelsId() {
        return levelsId;
    }

    public void setLevelsId(int levelsId) {
        this.levelsId = levelsId;
    }

    @Basic
    @Column(name = "credits")
    public int getCredits() {
        return credits;
    }

    public void setCredits(int credits) {
        this.credits = credits;
    }

    @Basic
    @Column(name = "seprom")
    public int getSeprom() {
        return seprom;
    }

    public void setSeprom(int seprom) {
        this.seprom = seprom;
    }

    @Basic
    @Column(name = "points")
    public byte getPoints() {
        return points;
    }

    public void setPoints(byte points) {
        this.points = points;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        SkilltreeLevel that = (SkilltreeLevel) o;
        return id == that.id &&
               skilltreeSkillsId == that.skilltreeSkillsId &&
               levelsId == that.levelsId &&
               credits == that.credits &&
               seprom == that.seprom &&
               points == that.points;
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, skilltreeSkillsId, levelsId, credits, seprom, points);
    }

    @OneToMany(mappedBy = "skilltreeLevelsBySkilltreeLevelsId")
    public Collection<AccountsSkill> getAccountsSkillsById() {
        return accountsSkillsById;
    }

    public void setAccountsSkillsById(
            Collection<AccountsSkill> accountsSkillsById
    ) {
        this.accountsSkillsById = accountsSkillsById;
    }

    @ManyToOne
    @JoinColumn(name = "skilltree_skills_id", referencedColumnName = "id", nullable = false)
    public SkilltreeSkill getSkilltreeSkillsBySkilltreeSkillsId() {
        return skilltreeSkillsBySkilltreeSkillsId;
    }

    public void setSkilltreeSkillsBySkilltreeSkillsId(
            SkilltreeSkill skilltreeSkillsBySkilltreeSkillsId
    ) {
        this.skilltreeSkillsBySkilltreeSkillsId = skilltreeSkillsBySkilltreeSkillsId;
    }

    @ManyToOne
    @JoinColumn(name = "levels_id", referencedColumnName = "id", nullable = false)
    public Level getLevelsByLevelsId() {
        return levelsByLevelsId;
    }

    public void setLevelsByLevelsId(Level levelsByLevelsId) {
        this.levelsByLevelsId = levelsByLevelsId;
    }

    @OneToMany(mappedBy = "skilltreeLevelsByUpgradeSkilltreeLevelsId")
    public Collection<SkilltreeUnlock> getSkilltreeUnlocksById() {
        return skilltreeUnlocksById;
    }

    public void setSkilltreeUnlocksById(
            Collection<SkilltreeUnlock> skilltreeUnlocksById
    ) {
        this.skilltreeUnlocksById = skilltreeUnlocksById;
    }

    @OneToMany(mappedBy = "skilltreeLevelsByRequiredSkilltreeLevelsId")
    public Collection<SkilltreeUnlock> getSkilltreeUnlocksById_0() {
        return skilltreeUnlocksById_0;
    }

    public void setSkilltreeUnlocksById_0(
            Collection<SkilltreeUnlock> skilltreeUnlocksById_0
    ) {
        this.skilltreeUnlocksById_0 = skilltreeUnlocksById_0;
    }
}
