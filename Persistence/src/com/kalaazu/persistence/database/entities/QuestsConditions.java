package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.quests_conditions.generated.GeneratedQuestsConditions;

import java.util.Optional;

/**
 * The main interface for entities of the {@code quests_conditions}-table in the
 * database.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface QuestsConditions extends GeneratedQuestsConditions, Entity<Integer> {
    /**
     * Returns the required quest condition.
     *
     * @return Required quest condition.
     */
    Optional<QuestsConditions> getCondition();

    /**
     * Returns the quest.
     *
     * @return The quest.
     */
    Quests getQuest();
}