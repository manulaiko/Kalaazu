package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.AccountsConfigurationsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * AccountsConfigurations repository.
 * ==================================
 * <p>
 * Repository for the AccountsConfigurations entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface AccountsConfigurationsRepository extends JpaRepository<AccountsConfigurationsEntity, Integer> {
}
