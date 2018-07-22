package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.quests_conditions.generated.GeneratedQuestsConditions;

import java.util.Optional;

/**
 * Quests' conditions table.
 * =========================
 *
 * Contains the conditions required to accomplish a quest.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface QuestsConditions extends GeneratedQuestsConditions, Entity<Integer> {
    /**
     * Returns the required quest condition.
     *
     * @return Required quest condition.
     */
    Optional<QuestsConditions> condition();

    /**
     * Returns the quest.
     *
     * @return The quest.
     */
    Quests quest();
}