package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.RewardsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Rewards repository.
 * ===================
 * 
 * Repository for the Rewards entity.
 * 
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface RewardsRepository extends JpaRepository<RewardsEntity, Integer> {
}
