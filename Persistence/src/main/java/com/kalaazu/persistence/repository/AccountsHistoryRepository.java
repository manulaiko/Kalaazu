package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.AccountsHistoryEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * AccountsHistory repository.
 * ===========================
 *
 * Repository for the AccountsHistory entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface AccountsHistoryRepository extends JpaRepository<AccountsHistoryEntity, Integer> {
}
