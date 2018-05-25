package com.kalaazu.persistence.database.entities.quests.generated;

import com.kalaazu.persistence.database.entities.Manager;
import com.kalaazu.persistence.database.entities.Quests;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.runtime.field.Field;

import java.util.List;

import static java.util.Arrays.asList;
import static java.util.Collections.unmodifiableList;

/**
 * The generated base interface for the manager of every {@link
 * Quests} entity.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 *
 * @author Speedment
 */
@GeneratedCode("Speedment")
public interface GeneratedQuestsManager extends Manager<Quests> {

    List<Field<Quests>> FIELDS = unmodifiableList(asList(
            Quests.ID,
            Quests.LEVELS_ID,
            Quests.QUESTS_ID,
            Quests.FACTIONS_ID,
            Quests.NAME
    ));

    @Override
    default Class<Quests> getEntityClass() {
        return Quests.class;
    }
}