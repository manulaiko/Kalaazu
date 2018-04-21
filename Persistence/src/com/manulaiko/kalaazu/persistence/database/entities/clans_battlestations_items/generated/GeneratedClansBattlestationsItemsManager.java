package com.manulaiko.kalaazu.persistence.database.entities.clans_battlestations_items.generated;

import com.manulaiko.kalaazu.persistence.database.entities.clans_battlestations_items.ClansBattlestationsItems;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.runtime.core.manager.Manager;
import com.speedment.runtime.field.Field;
import java.util.List;
import static java.util.Arrays.asList;
import static java.util.Collections.unmodifiableList;

/**
 * The generated base interface for the manager of every {@link
 * com.manulaiko.kalaazu.persistence.database.entities.clans_battlestations_items.ClansBattlestationsItems}
 * entity.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 * 
 * @author Speedment
 */
@GeneratedCode("Speedment")
public interface GeneratedClansBattlestationsItemsManager extends Manager<ClansBattlestationsItems> {
    
    List<Field<ClansBattlestationsItems>> FIELDS = unmodifiableList(asList(
        ClansBattlestationsItems.ID,
        ClansBattlestationsItems.CLANS_BATTLESTATIONS_ID,
        ClansBattlestationsItems.ACCOUNTS_ITEMS_ID,
        ClansBattlestationsItems.SLOT,
        ClansBattlestationsItems.DATE
    ));
    
    @Override
    default Class<ClansBattlestationsItems> getEntityClass() {
        return ClansBattlestationsItems.class;
    }
}