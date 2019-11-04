package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.ClansBanksLogsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * ClansBanksLogs repository.
 * ==========================
 * 
 * Repository for the ClansBanksLogs entity.
 * 
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface ClansBanksLogsRepository extends JpaRepository<ClansBanksLogsEntity, Integer> {
}
