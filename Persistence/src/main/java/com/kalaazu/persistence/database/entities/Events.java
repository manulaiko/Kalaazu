package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.events.generated.GeneratedEvents;

/**
 * Events table.
 * =============
 *
 * Contains all the events of the server.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface Events extends GeneratedEvents, Entity<Integer> {
}