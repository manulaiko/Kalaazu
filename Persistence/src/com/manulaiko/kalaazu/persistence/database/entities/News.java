package com.manulaiko.kalaazu.persistence.database.entities;

import com.manulaiko.kalaazu.persistence.database.entities.Entity;
import com.manulaiko.kalaazu.persistence.database.entities.news.generated.GeneratedNews;

/**
 * The main interface for entities of the {@code news}-table in the database.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface News extends GeneratedNews, Entity<Short> {
}