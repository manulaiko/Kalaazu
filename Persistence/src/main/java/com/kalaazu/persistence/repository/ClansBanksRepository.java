package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.ClansBanksEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * ClansBanks repository.
 * ======================
 *
 * Repository for the ClansBanks entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface ClansBanksRepository extends JpaRepository<ClansBanksEntity, Integer> {
}
