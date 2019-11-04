package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.AccountsDestroysEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * AccountsDestroys repository.
 * ============================
 *
 * Repository for the AccountsDestroys entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface AccountsDestroysRepository extends JpaRepository<AccountsDestroysEntity, Integer> {
}
