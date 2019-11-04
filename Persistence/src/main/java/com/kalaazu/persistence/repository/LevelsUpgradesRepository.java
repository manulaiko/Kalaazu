package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.LevelsUpgradesEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * LevelsUpgrades repository.
 * ==========================
 *
 * Repository for the LevelsUpgrades entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface LevelsUpgradesRepository extends JpaRepository<LevelsUpgradesEntity, Integer> {
}
