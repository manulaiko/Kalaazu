package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.items.generated.GeneratedItems;

/**
 * Items table.
 * ============
 *
 * Contains all the items in the server.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface Items extends GeneratedItems, Entity<Short> {
}