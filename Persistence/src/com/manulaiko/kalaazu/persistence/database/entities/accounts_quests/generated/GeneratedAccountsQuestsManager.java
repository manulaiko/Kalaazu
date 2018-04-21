package com.manulaiko.kalaazu.persistence.database.entities.accounts_quests.generated;

import com.manulaiko.kalaazu.persistence.database.entities.accounts_quests.AccountsQuests;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.runtime.core.manager.Manager;
import com.speedment.runtime.field.Field;
import java.util.List;
import static java.util.Arrays.asList;
import static java.util.Collections.unmodifiableList;

/**
 * The generated base interface for the manager of every {@link
 * com.manulaiko.kalaazu.persistence.database.entities.accounts_quests.AccountsQuests}
 * entity.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 * 
 * @author Speedment
 */
@GeneratedCode("Speedment")
public interface GeneratedAccountsQuestsManager extends Manager<AccountsQuests> {
    
    List<Field<AccountsQuests>> FIELDS = unmodifiableList(asList(
        AccountsQuests.ID,
        AccountsQuests.QUESTS_ID,
        AccountsQuests.ACCOUNTS_ID,
        AccountsQuests.COMPLETED,
        AccountsQuests.DATE
    ));
    
    @Override
    default Class<AccountsQuests> getEntityClass() {
        return AccountsQuests.class;
    }
}