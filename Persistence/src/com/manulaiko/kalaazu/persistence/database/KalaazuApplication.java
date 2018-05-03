package com.manulaiko.kalaazu.persistence.database;

import com.manulaiko.kalaazu.persistence.database.entities.Entity;
import com.manulaiko.kalaazu.persistence.database.entities.Manager;
import com.manulaiko.kalaazu.persistence.database.generated.GeneratedKalaazuApplication;

/**
 * Speedment application.
 * ======================
 *
 * Main class to use speedment.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface KalaazuApplication extends GeneratedKalaazuApplication {
    /**
     * Initializes the managers.
     */
    void initialize();

    /**
     * Returns a manager by its entity class.
     *
     * @param type Entity class.
     *
     * @return Manager for `type`.
     */
    <T extends Entity> Manager<T> manager(Class<? extends Entity> type);
}