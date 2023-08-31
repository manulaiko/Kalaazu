package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.AccountsShipsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * AccountsShips repository.
 * =========================
 * <p>
 * Repository for the AccountsShips entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface AccountsShipsRepository extends JpaRepository<AccountsShipsEntity, Integer> {
}
