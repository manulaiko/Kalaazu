package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.ClansNewsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * ClansNews repository.
 * =====================
 *
 * Repository for the ClansNews entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface ClansNewsRepository extends JpaRepository<ClansNewsEntity, Integer> {
}
