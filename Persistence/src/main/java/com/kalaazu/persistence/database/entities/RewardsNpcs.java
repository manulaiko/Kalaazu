package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.rewards_npcs.generated.GeneratedRewardsNpcs;

/**
 * Rewards to npcs table.
 * ======================
 *
 * Maps the rewards to their given NPC.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface RewardsNpcs extends GeneratedRewardsNpcs, Entity<Short> {
    /**
     * Returns the reward.
     *
     * @return The reward.
     */
    Rewards reward();

    /**
     * Returns the NPC.
     *
     * @return The npc.
     */
    Npcs npc();
}