package com.manulaiko.kalaazu.persistence.database.entities;


import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class ClansRanking {
    private int id;

    private int clansId;

    private int points;

    private int bestPoints;

    private Clan clansByClansId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getClansId() {
        return clansId;
    }

    public void setClansId(int clansId) {
        this.clansId = clansId;
    }

    public int getPoints() {
        return points;
    }

    public void setPoints(int points) {
        this.points = points;
    }

    public int getBestPoints() {
        return bestPoints;
    }

    public void setBestPoints(int bestPoints) {
        this.bestPoints = bestPoints;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        ClansRanking that = (ClansRanking) o;
        return id == that.id &&
               clansId == that.clansId &&
               points == that.points &&
               bestPoints == that.bestPoints;
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, clansId, points, bestPoints);
    }

    public Clan getClansByClansId() {
        return clansByClansId;
    }

    public void setClansByClansId(Clan clansByClansId) {
        this.clansByClansId = clansByClansId;
    }
}
