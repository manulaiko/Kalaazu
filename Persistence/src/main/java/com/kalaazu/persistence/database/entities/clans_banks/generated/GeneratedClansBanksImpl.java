package com.kalaazu.persistence.database.entities.clans_banks.generated;

import com.kalaazu.persistence.database.entities.Clans;
import com.kalaazu.persistence.database.entities.ClansBanks;
import com.kalaazu.persistence.database.entities.Manager;
import com.speedment.common.annotation.GeneratedCode;
import lombok.Data;

/**
 * The generated base implementation of the {@link
 * ClansBanks}-interface.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 *
 * @author Speedment
 */
@GeneratedCode("Speedment")
@Data
public abstract class GeneratedClansBanksImpl implements ClansBanks {

    private Integer id;

    private int clansId;

    private long credits;

    private long uridium;

    private byte taxCredits;

    private byte taxUridium;

    protected GeneratedClansBanksImpl() {

    }

    @Override
    public Clans findClansId(Manager<Clans> foreignManager) {
        return foreignManager.stream()
                             .filter(Clans.ID.equal(clansId()))
                             .findAny()
                             .orElse(null);
    }
}