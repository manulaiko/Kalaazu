package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.AccountsBanksLogsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * AccountsBanksLogs repository.
 * =============================
 * <p>
 * Repository for the AccountsBanksLogs entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface AccountsBanksLogsRepository extends JpaRepository<AccountsBanksLogsEntity, Integer> {
}
