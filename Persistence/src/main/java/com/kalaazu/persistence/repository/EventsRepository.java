package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.EventsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Events repository.
 * ==================
 * <p>
 * Repository for the Events entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface EventsRepository extends JpaRepository<EventsEntity, Integer> {
}
