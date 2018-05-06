package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.news.generated.GeneratedNews;

/**
 * News table.
 * ===========
 *
 * Contains the server news.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface News extends GeneratedNews, Entity<Short> {
}