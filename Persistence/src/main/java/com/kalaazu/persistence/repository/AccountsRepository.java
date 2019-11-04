package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.AccountsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Accounts repository.
 * ====================
 * 
 * Repository for the Accounts entity.
 * 
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface AccountsRepository extends JpaRepository<AccountsEntity, Integer> {
}
