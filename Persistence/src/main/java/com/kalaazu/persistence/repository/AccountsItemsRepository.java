package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.AccountsItemsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * AccountsItems repository.
 * =========================
 *
 * Repository for the AccountsItems entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface AccountsItemsRepository extends JpaRepository<AccountsItemsEntity, Integer> {
}
