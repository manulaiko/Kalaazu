package com.kalaazu.persistence.database.entities.accounts_skylabs.generated;

import com.kalaazu.persistence.database.entities.AccountsSkylabs;
import com.kalaazu.persistence.database.entities.Manager;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.runtime.field.Field;

import java.util.List;

import static java.util.Arrays.asList;
import static java.util.Collections.unmodifiableList;

/**
 * The generated base interface for the manager of every {@link
 * AccountsSkylabs}
 * entity.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 *
 * @author Speedment
 */
@GeneratedCode("Speedment")
public interface GeneratedAccountsSkylabsManager extends Manager<AccountsSkylabs> {

    List<Field<AccountsSkylabs>> FIELDS = unmodifiableList(asList(
            AccountsSkylabs.ID,
            AccountsSkylabs.ACCOUNTS_ID,
            AccountsSkylabs.SKYLAB_MODULES_ID,
            AccountsSkylabs.LEVELS_ID,
            AccountsSkylabs.SPACE,
            AccountsSkylabs.UPGRADE
    ));

    @Override
    default Class<AccountsSkylabs> getEntityClass() {
        return AccountsSkylabs.class;
    }
}