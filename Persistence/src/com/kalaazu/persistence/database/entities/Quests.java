package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.quests.generated.GeneratedQuests;

import java.util.Optional;

/**
 * The main interface for entities of the {@code quests}-table in the database.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
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
}