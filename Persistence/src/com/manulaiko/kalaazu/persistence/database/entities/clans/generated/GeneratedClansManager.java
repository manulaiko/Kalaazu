package com.manulaiko.kalaazu.persistence.database.entities.clans.generated;

import com.manulaiko.kalaazu.persistence.database.entities.clans.Clans;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.runtime.core.manager.Manager;
import com.speedment.runtime.field.Field;
import java.util.List;
import static java.util.Arrays.asList;
import static java.util.Collections.unmodifiableList;

/**
 * The generated base interface for the manager of every {@link
 * com.manulaiko.kalaazu.persistence.database.entities.clans.Clans} entity.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 * 
 * @author Speedment
 */
@GeneratedCode("Speedment")
public interface GeneratedClansManager extends Manager<Clans> {
    
    List<Field<Clans>> FIELDS = unmodifiableList(asList(
        Clans.ID,
        Clans.ACCOUNTS_ID,
        Clans.FACTIONS_ID,
        Clans.TAG,
        Clans.NAME,
        Clans.DESCRIPTION,
        Clans.LOGO,
        Clans.STATUS
    ));
    
    @Override
    default Class<Clans> getEntityClass() {
        return Clans.class;
    }
}