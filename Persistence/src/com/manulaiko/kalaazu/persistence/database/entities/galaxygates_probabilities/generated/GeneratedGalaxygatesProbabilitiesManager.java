package com.manulaiko.kalaazu.persistence.database.entities.galaxygates_probabilities.generated;

import com.manulaiko.kalaazu.persistence.database.entities.galaxygates_probabilities.GalaxygatesProbabilities;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.runtime.core.manager.Manager;
import com.speedment.runtime.field.Field;
import java.util.List;
import static java.util.Arrays.asList;
import static java.util.Collections.unmodifiableList;

/**
 * The generated base interface for the manager of every {@link
 * com.manulaiko.kalaazu.persistence.database.entities.galaxygates_probabilities.GalaxygatesProbabilities}
 * entity.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 * 
 * @author Speedment
 */
@GeneratedCode("Speedment")
public interface GeneratedGalaxygatesProbabilitiesManager extends Manager<GalaxygatesProbabilities> {
    
    List<Field<GalaxygatesProbabilities>> FIELDS = unmodifiableList(asList(
        GalaxygatesProbabilities.ID,
        GalaxygatesProbabilities.GALAXYGATES_ID,
        GalaxygatesProbabilities.TYPE,
        GalaxygatesProbabilities.PROBABILITY
    ));
    
    @Override
    default Class<GalaxygatesProbabilities> getEntityClass() {
        return GalaxygatesProbabilities.class;
    }
}