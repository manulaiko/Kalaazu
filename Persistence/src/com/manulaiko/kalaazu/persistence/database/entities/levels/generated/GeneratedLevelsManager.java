package com.manulaiko.kalaazu.persistence.database.entities.levels.generated;

import com.manulaiko.kalaazu.persistence.database.entities.levels.Levels;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.runtime.core.manager.Manager;
import com.speedment.runtime.field.Field;
import java.util.List;
import static java.util.Arrays.asList;
import static java.util.Collections.unmodifiableList;

/**
 * The generated base interface for the manager of every {@link
 * com.manulaiko.kalaazu.persistence.database.entities.levels.Levels} entity.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 * 
 * @author Speedment
 */
@GeneratedCode("Speedment")
public interface GeneratedLevelsManager extends Manager<Levels> {
    
    List<Field<Levels>> FIELDS = unmodifiableList(asList(
        Levels.ID,
        Levels.ACCOUNT,
        Levels.DRONE,
        Levels.PET,
        Levels.DAMAGE,
        Levels.SHIELD
    ));
    
    @Override
    default Class<Levels> getEntityClass() {
        return Levels.class;
    }
}