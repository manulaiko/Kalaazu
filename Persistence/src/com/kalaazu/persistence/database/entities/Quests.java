package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.quests.generated.GeneratedQuests;

import java.util.List;
import java.util.Optional;

/**
 * Quests table.
 * =============
 *
 * Contains all the quests in the server.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface Quests extends GeneratedQuests, Entity<Short> {
    /**
     * Returns the required level for this quest.
     *
     * @return Required level.
     */
    Levels getLevel();

    /**
     * Returns the required quest.
     *
     * @return Required quest.
     */
    Optional<Quests> getQuest();

    /**
     * Returns the required faction.
     *
     * @return Required faction.
     */
    Optional<Factions> getFaction();

    /**
     * Returns the required conditions.
     *
     * @return Required conditions.
     */
    List<QuestsConditions> getConditions();
}