package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.AccountsConfigurationsAccountsItemsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * AccountsConfigurationsAccountsItems repository.
 * ===============================================
 *
 * Repository for the AccountsConfigurationsAccountsItems entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface AccountsConfigurationsAccountsItemsRepository extends JpaRepository<AccountsConfigurationsAccountsItemsEntity, Integer> {
}
