package com.kalaazu.persistence.database.entities.quests_conditions;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.Quests;
import com.kalaazu.persistence.database.entities.QuestsConditions;
import com.kalaazu.persistence.database.entities.quests_conditions.generated.GeneratedQuestsConditionsImpl;

import java.util.Optional;

/**
 * The default implementation of the {@link
 * QuestsConditions}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class QuestsConditionsImpl
        extends GeneratedQuestsConditionsImpl
        implements QuestsConditions {
    /**
     * Required condition.
     */
    public Optional<QuestsConditions> condition;

    /**
     * The quest.
     */
    public Quests quest;

    @Override
    public Optional<QuestsConditions> condition() {
        if (this.condition != null) {
            return this.condition;
        }

        this.condition = super.findQuestsConditionsId(
                Database.instance()
                        .db()
                        .manager(QuestsConditions.class)
        );

        return this.condition;
    }

    @Override
    public Quests quest() {
        if (this.quest != null) {
            return this.quest;
        }

        this.quest = super.findQuestsId(
                Database.instance()
                        .db()
                        .manager(Quests.class)
        );

        return this.quest;
    }
}