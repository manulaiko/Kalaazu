package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "clans_ranking", schema = "kalaazu", catalog = "")
public class ClansRankingEntity {
    private int         id;
    private int         points;
    private int         bestPoints;
    private ClansEntity clansByClansId;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "points", nullable = false)
    public int getPoints() {
        return points;
    }

    public void setPoints(int points) {
        this.points = points;
    }

    @Basic
    @Column(name = "best_points", nullable = false)
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
        ClansRankingEntity that = (ClansRankingEntity) o;
        return id == that.id &&
               points == that.points &&
               bestPoints == that.bestPoints;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, points, bestPoints);
    }

    @ManyToOne
    @JoinColumn(name = "clans_id", referencedColumnName = "id", nullable = false)
    public ClansEntity getClansByClansId() {
        return clansByClansId;
    }

    public void setClansByClansId(ClansEntity clansByClansId) {
        this.clansByClansId = clansByClansId;
    }
}
