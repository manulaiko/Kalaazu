package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.ClansRankingEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * ClansRanking repository.
 * ========================
 *
 * Repository for the ClansRanking entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface ClansRankingRepository extends JpaRepository<ClansRankingEntity, Integer> {
}
