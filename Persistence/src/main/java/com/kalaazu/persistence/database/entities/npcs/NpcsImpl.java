package com.kalaazu.persistence.database.entities.npcs;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.Npcs;
import com.kalaazu.persistence.database.entities.Rewards;
import com.kalaazu.persistence.database.entities.RewardsNpcs;
import com.kalaazu.persistence.database.entities.npcs.generated.GeneratedNpcsImpl;

import java.util.List;
import java.util.stream.Collectors;

/**
 * The default implementation of the {@link
 * Npcs}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class NpcsImpl
        extends GeneratedNpcsImpl
        implements Npcs {
    /**
     * Rewards.
     */
    private List<Rewards> rewards;

    @Override
    public List<Rewards> rewards() {
        if (this.rewards != null) {
            return this.rewards;
        }

        this.rewards = Database.instance()
                               .all(RewardsNpcs.class)
                               .filter(RewardsNpcs.NPCS_ID.equal(super.id()))
                               .map(RewardsNpcs::reward)
                               .collect(Collectors.toList());

        return this.rewards;
    }
}