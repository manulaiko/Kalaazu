package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.FactionsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Factions repository.
 * ====================
 * 
 * Repository for the Factions entity.
 * 
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface FactionsRepository extends JpaRepository<FactionsEntity, Integer> {
}
