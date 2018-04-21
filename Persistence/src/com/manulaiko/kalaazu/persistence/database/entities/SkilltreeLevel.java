package com.manulaiko.kalaazu.persistence.database.entities;


import java.util.Collection;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
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

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSkilltreeSkillsId() {
        return skilltreeSkillsId;
    }

    public void setSkilltreeSkillsId(int skilltreeSkillsId) {
        this.skilltreeSkillsId = skilltreeSkillsId;
    }

    public int getLevelsId() {
        return levelsId;
    }

    public void setLevelsId(int levelsId) {
        this.levelsId = levelsId;
    }

    public int getCredits() {
        return credits;
    }

    public void setCredits(int credits) {
        this.credits = credits;
    }

    public int getSeprom() {
        return seprom;
    }

    public void setSeprom(int seprom) {
        this.seprom = seprom;
    }

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

    public Collection<AccountsSkill> getAccountsSkillsById() {
        return accountsSkillsById;
    }

    public void setAccountsSkillsById(
            Collection<AccountsSkill> accountsSkillsById
    ) {
        this.accountsSkillsById = accountsSkillsById;
    }

    public SkilltreeSkill getSkilltreeSkillsBySkilltreeSkillsId() {
        return skilltreeSkillsBySkilltreeSkillsId;
    }

    public void setSkilltreeSkillsBySkilltreeSkillsId(
            SkilltreeSkill skilltreeSkillsBySkilltreeSkillsId
    ) {
        this.skilltreeSkillsBySkilltreeSkillsId = skilltreeSkillsBySkilltreeSkillsId;
    }

    public Level getLevelsByLevelsId() {
        return levelsByLevelsId;
    }

    public void setLevelsByLevelsId(Level levelsByLevelsId) {
        this.levelsByLevelsId = levelsByLevelsId;
    }

    public Collection<SkilltreeUnlock> getSkilltreeUnlocksById() {
        return skilltreeUnlocksById;
    }

    public void setSkilltreeUnlocksById(
            Collection<SkilltreeUnlock> skilltreeUnlocksById
    ) {
        this.skilltreeUnlocksById = skilltreeUnlocksById;
    }

    public Collection<SkilltreeUnlock> getSkilltreeUnlocksById_0() {
        return skilltreeUnlocksById_0;
    }

    public void setSkilltreeUnlocksById_0(
            Collection<SkilltreeUnlock> skilltreeUnlocksById_0
    ) {
        this.skilltreeUnlocksById_0 = skilltreeUnlocksById_0;
    }
}
