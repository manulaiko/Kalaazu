package com.manulaiko.kalaazu.persistence.database;

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
}