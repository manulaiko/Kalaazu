package com.kalaazu.persistence.database.entities.quests;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.Factions;
import com.kalaazu.persistence.database.entities.Levels;
import com.kalaazu.persistence.database.entities.Quests;
import com.kalaazu.persistence.database.entities.quests.generated.GeneratedQuestsImpl;

import java.util.Optional;

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

        return faction;
    }
}