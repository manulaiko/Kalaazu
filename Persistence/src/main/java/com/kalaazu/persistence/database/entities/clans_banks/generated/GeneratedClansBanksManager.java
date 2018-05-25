package com.kalaazu.persistence.database.entities.clans_banks.generated;

import com.kalaazu.persistence.database.entities.ClansBanks;
import com.kalaazu.persistence.database.entities.Manager;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.runtime.field.Field;

import java.util.List;

import static java.util.Arrays.asList;
import static java.util.Collections.unmodifiableList;

/**
 * The generated base interface for the manager of every {@link
 * ClansBanks}
 * entity.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 *
 * @author Speedment
 */
@GeneratedCode("Speedment")
public interface GeneratedClansBanksManager extends Manager<ClansBanks> {

    List<Field<ClansBanks>> FIELDS = unmodifiableList(asList(
            ClansBanks.ID,
            ClansBanks.CLANS_ID,
            ClansBanks.CREDITS,
            ClansBanks.URIDIUM,
            ClansBanks.TAX_CREDITS,
            ClansBanks.TAX_URIDIUM
    ));

    @Override
    default Class<ClansBanks> getEntityClass() {
        return ClansBanks.class;
    }
}