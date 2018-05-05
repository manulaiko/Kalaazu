package com.kalaazu.persistence.database.entities.quests;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.Factions;
import com.kalaazu.persistence.database.entities.Levels;
import com.kalaazu.persistence.database.entities.Quests;
import com.kalaazu.persistence.database.entities.QuestsConditions;
import com.kalaazu.persistence.database.entities.quests.generated.GeneratedQuestsImpl;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * The default implementation of the {@link
 * Quests}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class QuestsImpl
        extends GeneratedQuestsImpl
        implements Quests {
    /**
     * Required level.
     */
    private Levels level;

    /**
     * Required quest.
     */
    private Optional<Quests> quest;

    /**
     * Required faction.
     */
    private Optional<Factions> faction;

    /**
     * Quest conditions.
     */
    private List<QuestsConditions> conditions;

    @Override
    public Levels getLevel() {
        if (this.level != null) {
            return this.level;
        }

        this.level = super.findLevelsId(
                Database.getInstance()
                        .getDb()
                        .manager(Levels.class)
        );

        return this.level;
    }

    @Override
    public Optional<Quests> getQuest() {
        if (this.quest != null) {
            return this.quest;
        }

        this.quest = super.findQuestsId(
                Database.getInstance()
                        .getDb()
                        .manager(Quests.class)
        );

        return this.quest;
    }

    @Override
    public Optional<Factions> getFaction() {
        if (this.faction != null) {
            return this.faction;
        }

        this.faction = super.findFactionsId(
                Database.getInstance()
                        .getDb()
                        .manager(Factions.class)
        );

        return this.faction;
    }

    @Override
    public List<QuestsConditions> getConditions() {
        if (this.conditions != null) {
            return this.conditions;
        }

        this.conditions = Database.getInstance()
                                  .all(QuestsConditions.class)
                                  .filter(c -> c.getQuestsId() == super.getId())
                                  .collect(Collectors.toList());

        return this.conditions;
    }
}