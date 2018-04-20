package com.manulaiko.kalaazu.persistence.database.entities;

import javax.persistence.*;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "rewards_ships", schema = "kalaazu")
public class RewardsShip {
    private int id;

    private int shipsId;

    private int rewardsId;

    private Ship shipsByShipsId;

    private Reward rewardsByRewardsId;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "ships_id")
    public int getShipsId() {
        return shipsId;
    }

    public void setShipsId(int shipsId) {
        this.shipsId = shipsId;
    }

    @Basic
    @Column(name = "rewards_id")
    public int getRewardsId() {
        return rewardsId;
    }

    public void setRewardsId(int rewardsId) {
        this.rewardsId = rewardsId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        RewardsShip that = (RewardsShip) o;
        return id == that.id &&
               shipsId == that.shipsId &&
               rewardsId == that.rewardsId;
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, shipsId, rewardsId);
    }

    @ManyToOne
    @JoinColumn(name = "ships_id", referencedColumnName = "id", nullable = false)
    public Ship getShipsByShipsId() {
        return shipsByShipsId;
    }

    public void setShipsByShipsId(Ship shipsByShipsId) {
        this.shipsByShipsId = shipsByShipsId;
    }

    @ManyToOne
    @JoinColumn(name = "rewards_id", referencedColumnName = "id", nullable = false)
    public Reward getRewardsByRewardsId() {
        return rewardsByRewardsId;
    }

    public void setRewardsByRewardsId(Reward rewardsByRewardsId) {
        this.rewardsByRewardsId = rewardsByRewardsId;
    }
}
