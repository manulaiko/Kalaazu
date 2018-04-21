package com.manulaiko.kalaazu.persistence.database.entities;


import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class LevelsUpgrade {
    private int id;

    private int levelsId;

    private byte probability;

    private int credits;

    private int uridium;

    private Level levelsByLevelsId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getLevelsId() {
        return levelsId;
    }

    public void setLevelsId(int levelsId) {
        this.levelsId = levelsId;
    }

    public byte getProbability() {
        return probability;
    }

    public void setProbability(byte probability) {
        this.probability = probability;
    }

    public int getCredits() {
        return credits;
    }

    public void setCredits(int credits) {
        this.credits = credits;
    }

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

    public Level getLevelsByLevelsId() {
        return levelsByLevelsId;
    }

    public void setLevelsByLevelsId(Level levelsByLevelsId) {
        this.levelsByLevelsId = levelsByLevelsId;
    }
}
