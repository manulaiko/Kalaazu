package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.ModeratorsLogsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * ModeratorsLogs repository.
 * ==========================
 *
 * Repository for the ModeratorsLogs entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface ModeratorsLogsRepository extends JpaRepository<ModeratorsLogsEntity, Integer> {
}
