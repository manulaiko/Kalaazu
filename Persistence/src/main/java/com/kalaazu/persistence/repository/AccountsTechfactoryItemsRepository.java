package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.AccountsTechfactoryItemsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * AccountsTechfactoryItems repository.
 * ====================================
 *
 * Repository for the AccountsTechfactoryItems entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface AccountsTechfactoryItemsRepository extends JpaRepository<AccountsTechfactoryItemsEntity, Integer> {
}
