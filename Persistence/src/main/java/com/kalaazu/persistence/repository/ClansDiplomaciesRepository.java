package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.ClansDiplomaciesEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * ClansDiplomacies repository.
 * ============================
 *
 * Repository for the ClansDiplomacies entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface ClansDiplomaciesRepository extends JpaRepository<ClansDiplomaciesEntity, Integer> {
}
