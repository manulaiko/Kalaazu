package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "skilltree_levels", schema = "kalaazu", catalog = "")
public class SkilltreeLevelsEntity {
    private short                 id;
    private int                   credits;
    private short                 seprom;
    private byte                  points;
    private SkilltreeSkillsEntity skilltreeSkillsBySkilltreeSkillsId;
    private LevelsEntity          levelsByLevelsId;

    @Id
    @Column(name = "id", nullable = false)
    public short getId() {
        return id;
    }

    public void setId(short id) {
        this.id = id;
    }

    @Basic
    @Column(name = "credits", nullable = false)
    public int getCredits() {
        return credits;
    }

    public void setCredits(int credits) {
        this.credits = credits;
    }

    @Basic
    @Column(name = "seprom", nullable = false)
    public short getSeprom() {
        return seprom;
    }

    public void setSeprom(short seprom) {
        this.seprom = seprom;
    }

    @Basic
    @Column(name = "points", nullable = false)
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
        SkilltreeLevelsEntity that = (SkilltreeLevelsEntity) o;
        return id == that.id &&
               credits == that.credits &&
               seprom == that.seprom &&
               points == that.points;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, credits, seprom, points);
    }

    @ManyToOne
    @JoinColumn(name = "skilltree_skills_id", referencedColumnName = "id", nullable = false)
    public SkilltreeSkillsEntity getSkilltreeSkillsBySkilltreeSkillsId() {
        return skilltreeSkillsBySkilltreeSkillsId;
    }

    public void setSkilltreeSkillsBySkilltreeSkillsId(
            SkilltreeSkillsEntity skilltreeSkillsBySkilltreeSkillsId
    ) {
        this.skilltreeSkillsBySkilltreeSkillsId = skilltreeSkillsBySkilltreeSkillsId;
    }

    @ManyToOne
    @JoinColumn(name = "levels_id", referencedColumnName = "id", nullable = false)
    public LevelsEntity getLevelsByLevelsId() {
        return levelsByLevelsId;
    }

    public void setLevelsByLevelsId(LevelsEntity levelsByLevelsId) {
        this.levelsByLevelsId = levelsByLevelsId;
    }
}
