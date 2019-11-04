package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.AccountsTechfactoriesEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * AccountsTechfactories repository.
 * =================================
 * 
 * Repository for the AccountsTechfactories entity.
 * 
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface AccountsTechfactoriesRepository extends JpaRepository<AccountsTechfactoriesEntity, Integer> {
}
