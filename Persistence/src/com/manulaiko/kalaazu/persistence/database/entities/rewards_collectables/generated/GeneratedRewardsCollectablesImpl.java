package com.manulaiko.kalaazu.persistence.database.entities.rewards_collectables.generated;

import com.manulaiko.kalaazu.persistence.database.entities.collectables.Collectables;
import com.manulaiko.kalaazu.persistence.database.entities.rewards.Rewards;
import com.manulaiko.kalaazu.persistence.database.entities.rewards_collectables.RewardsCollectables;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.runtime.core.manager.Manager;
import java.util.Objects;
import java.util.StringJoiner;

/**
 * The generated base implementation of the {@link
 * com.manulaiko.kalaazu.persistence.database.entities.rewards_collectables.RewardsCollectables}-interface.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 * 
 * @author Speedment
 */
@GeneratedCode("Speedment")
public abstract class GeneratedRewardsCollectablesImpl implements RewardsCollectables {
    
    private int id;
    private int collectablesId;
    private int rewardsId;
    
    protected GeneratedRewardsCollectablesImpl() {
        
    }
    
    @Override
    public int getId() {
        return id;
    }
    
    @Override
    public int getCollectablesId() {
        return collectablesId;
    }
    
    @Override
    public int getRewardsId() {
        return rewardsId;
    }
    
    @Override
    public RewardsCollectables setId(int id) {
        this.id = id;
        return this;
    }
    
    @Override
    public RewardsCollectables setCollectablesId(int collectablesId) {
        this.collectablesId = collectablesId;
        return this;
    }
    
    @Override
    public RewardsCollectables setRewardsId(int rewardsId) {
        this.rewardsId = rewardsId;
        return this;
    }
    
    @Override
    public Collectables findCollectablesId(Manager<Collectables> foreignManager) {
        return foreignManager.stream().filter(Collectables.ID.equal(getCollectablesId())).findAny().orElse(null);
    }
    
    @Override
    public Rewards findRewardsId(Manager<Rewards> foreignManager) {
        return foreignManager.stream().filter(Rewards.ID.equal(getRewardsId())).findAny().orElse(null);
    }
    
    @Override
    public String toString() {
        final StringJoiner sj = new StringJoiner(", ", "{ ", " }");
        sj.add("id = "             + Objects.toString(getId()));
        sj.add("collectablesId = " + Objects.toString(getCollectablesId()));
        sj.add("rewardsId = "      + Objects.toString(getRewardsId()));
        return "RewardsCollectablesImpl " + sj.toString();
    }
    
    @Override
    public boolean equals(Object that) {
        if (this == that) { return true; }
        if (!(that instanceof RewardsCollectables)) { return false; }
        final RewardsCollectables thatRewardsCollectables = (RewardsCollectables)that;
        if (this.getId() != thatRewardsCollectables.getId()) {return false; }
        if (this.getCollectablesId() != thatRewardsCollectables.getCollectablesId()) {return false; }
        if (this.getRewardsId() != thatRewardsCollectables.getRewardsId()) {return false; }
        return true;
    }
    
    @Override
    public int hashCode() {
        int hash = 7;
        hash = 31 * hash + Integer.hashCode(getId());
        hash = 31 * hash + Integer.hashCode(getCollectablesId());
        hash = 31 * hash + Integer.hashCode(getRewardsId());
        return hash;
    }
}