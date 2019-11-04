package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.CollectablesEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Collectables repository.
 * ========================
 * 
 * Repository for the Collectables entity.
 * 
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface CollectablesRepository extends JpaRepository<CollectablesEntity, Integer> {
}
