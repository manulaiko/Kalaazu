package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.ClansMessagesEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * ClansMessages repository.
 * =========================
 * <p>
 * Repository for the ClansMessages entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface ClansMessagesRepository extends JpaRepository<ClansMessagesEntity, Integer> {
}
