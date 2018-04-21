package com.manulaiko.kalaazu.persistence.database.entities.clans_messages.generated;

import com.manulaiko.kalaazu.persistence.database.entities.clans_messages.ClansMessages;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.runtime.core.manager.Manager;
import com.speedment.runtime.field.Field;
import java.util.List;
import static java.util.Arrays.asList;
import static java.util.Collections.unmodifiableList;

/**
 * The generated base interface for the manager of every {@link
 * com.manulaiko.kalaazu.persistence.database.entities.clans_messages.ClansMessages}
 * entity.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 * 
 * @author Speedment
 */
@GeneratedCode("Speedment")
public interface GeneratedClansMessagesManager extends Manager<ClansMessages> {
    
    List<Field<ClansMessages>> FIELDS = unmodifiableList(asList(
        ClansMessages.ID,
        ClansMessages.CLANS_ID,
        ClansMessages.FROM_ACCOUNTS_ID,
        ClansMessages.TO_ACCOUNTS_ID,
        ClansMessages.SUBJECT,
        ClansMessages.TEXT,
        ClansMessages.DATE
    ));
    
    @Override
    default Class<ClansMessages> getEntityClass() {
        return ClansMessages.class;
    }
}