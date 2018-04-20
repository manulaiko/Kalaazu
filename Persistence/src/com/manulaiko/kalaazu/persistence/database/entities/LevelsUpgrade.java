package com.manulaiko.kalaazu.persistence.database.entities;

import javax.persistence.*;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "levels_upgrades", schema = "kalaazu")
public class LevelsUpgrade {
    private int id;

    private int levelsId;

    private byte probability;

    private int credits;

    private int uridium;

    private Level levelsByLevelsId;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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
    @Column(name = "probability")
    public byte getProbability() {
        return probability;
    }

    public void setProbability(byte probability) {
        this.probability = probability;
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
    @Column(name = "uridium")
    public int getUridium() {
        return uridium;
    }

    public void setUridium(int uridium) {
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
        LevelsUpgrade that = (LevelsUpgrade) o;
        return id == that.id &&
               levelsId == that.levelsId &&
               probability == that.probability &&
               credits == that.credits &&
               uridium == that.uridium;
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, levelsId, probability, credits, uridium);
    }

    @ManyToOne
    @JoinColumn(name = "levels_id", referencedColumnName = "id", nullable = false)
    public Level getLevelsByLevelsId() {
        return levelsByLevelsId;
    }

    public void setLevelsByLevelsId(Level levelsByLevelsId) {
        this.levelsByLevelsId = levelsByLevelsId;
    }
}
