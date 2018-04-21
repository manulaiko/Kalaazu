package com.manulaiko.kalaazu.persistence.database.entities.rewards_npcs.generated;

import com.manulaiko.kalaazu.persistence.database.entities.rewards_npcs.RewardsNpcs;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.runtime.core.manager.Manager;
import com.speedment.runtime.field.Field;
import java.util.List;
import static java.util.Arrays.asList;
import static java.util.Collections.unmodifiableList;

/**
 * The generated base interface for the manager of every {@link
 * com.manulaiko.kalaazu.persistence.database.entities.rewards_npcs.RewardsNpcs} entity.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 * 
 * @author Speedment
 */
@GeneratedCode("Speedment")
public interface GeneratedRewardsNpcsManager extends Manager<RewardsNpcs> {
    
    List<Field<RewardsNpcs>> FIELDS = unmodifiableList(asList(
        RewardsNpcs.ID,
        RewardsNpcs.NPCS_ID,
        RewardsNpcs.REWARDS_ID
    ));
    
    @Override
    default Class<RewardsNpcs> getEntityClass() {
        return RewardsNpcs.class;
    }
}