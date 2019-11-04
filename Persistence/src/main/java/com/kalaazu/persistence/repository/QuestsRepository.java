package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.QuestsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Quests repository.
 * ==================
 * 
 * Repository for the Quests entity.
 * 
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface QuestsRepository extends JpaRepository<QuestsEntity, Integer> {
}
