package com.manulaiko.kalaazu.persistence.database.entities.accounts_pets.generated;

import com.manulaiko.kalaazu.persistence.database.entities.accounts_pets.AccountsPets;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.runtime.core.manager.Manager;
import com.speedment.runtime.field.Field;
import java.util.List;
import static java.util.Arrays.asList;
import static java.util.Collections.unmodifiableList;

/**
 * The generated base interface for the manager of every {@link
 * com.manulaiko.kalaazu.persistence.database.entities.accounts_pets.AccountsPets}
 * entity.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 * 
 * @author Speedment
 */
@GeneratedCode("Speedment")
public interface GeneratedAccountsPetsManager extends Manager<AccountsPets> {
    
    List<Field<AccountsPets>> FIELDS = unmodifiableList(asList(
        AccountsPets.ID,
        AccountsPets.ACCOUNTS_ID,
        AccountsPets.LEVELS_ID,
        AccountsPets.NAME,
        AccountsPets.EXPERIENCE,
        AccountsPets.FUEL,
        AccountsPets.HEALTH,
        AccountsPets.SLOTS_LASERS_TOTAL,
        AccountsPets.SLOTS_LASERS_AVAILABLE,
        AccountsPets.SLOTS_GENERATORS_TOTAL,
        AccountsPets.SLOTS_GENERATORS_AVAILABLE,
        AccountsPets.SLOTS_PROTOCOLS_TOTAL,
        AccountsPets.SLOTS_PROTOCOLS_AVAILABLE,
        AccountsPets.SLOTS_GEARS_TOTAL,
        AccountsPets.SLOTS_GEARS_AVAILABLE
    ));
    
    @Override
    default Class<AccountsPets> getEntityClass() {
        return AccountsPets.class;
    }
}