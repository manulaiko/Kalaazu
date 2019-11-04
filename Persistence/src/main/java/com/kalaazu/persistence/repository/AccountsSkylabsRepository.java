package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.AccountsSkylabsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * AccountsSkylabs repository.
 * ===========================
 *
 * Repository for the AccountsSkylabs entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface AccountsSkylabsRepository extends JpaRepository<AccountsSkylabsEntity, Integer> {
}
