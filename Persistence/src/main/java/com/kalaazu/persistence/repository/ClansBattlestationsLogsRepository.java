package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.ClansBattlestationsLogsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * ClansBattlestationsLogs repository.
 * ===================================
 * 
 * Repository for the ClansBattlestationsLogs entity.
 * 
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface ClansBattlestationsLogsRepository extends JpaRepository<ClansBattlestationsLogsEntity, Integer> {
}
