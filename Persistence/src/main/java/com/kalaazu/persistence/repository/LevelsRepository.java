package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.LevelsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Levels repository.
 * ==================
 * <p>
 * Repository for the Levels entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface LevelsRepository extends JpaRepository<LevelsEntity, Byte> {
}
