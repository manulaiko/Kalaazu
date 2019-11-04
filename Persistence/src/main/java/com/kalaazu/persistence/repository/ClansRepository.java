package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.ClansEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Clans repository.
 * =================
 *
 * Repository for the Clans entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface ClansRepository extends JpaRepository<ClansEntity, Integer> {
}
