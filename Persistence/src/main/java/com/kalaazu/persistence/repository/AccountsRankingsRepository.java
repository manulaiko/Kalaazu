package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.AccountsRankingsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * AccountsRankings repository.
 * ============================
 *
 * Repository for the AccountsRankings entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface AccountsRankingsRepository extends JpaRepository<AccountsRankingsEntity, Integer> {
}
