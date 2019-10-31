package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "levels_upgrades", schema = "kalaazu", catalog = "")
public class LevelsUpgradesEntity {
    private int          id;
    private byte         probability;
    private int          credits;
    private short        uridium;
    private LevelsEntity levelsByLevelsId;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "probability", nullable = false)
    public byte getProbability() {
        return probability;
    }

    public void setProbability(byte probability) {
        this.probability = probability;
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
    @Column(name = "uridium", nullable = false)
    public short getUridium() {
        return uridium;
    }

    public void setUridium(short uridium) {
        this.uridium = uridium;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        LevelsUpgradesEntity that = (LevelsUpgradesEntity) o;
        return id == that.id &&
               probability == that.probability &&
               credits == that.credits &&
               uridium == that.uridium;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, probability, credits, uridium);
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
