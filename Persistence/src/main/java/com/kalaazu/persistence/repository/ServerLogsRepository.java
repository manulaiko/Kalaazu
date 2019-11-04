package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.ServerLogsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * ServerLogs repository.
 * ======================
 *
 * Repository for the ServerLogs entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface ServerLogsRepository extends JpaRepository<ServerLogsEntity, Integer> {
}
