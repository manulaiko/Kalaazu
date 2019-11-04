package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.AccountsPetsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * AccountsPets repository.
 * ========================
 * 
 * Repository for the AccountsPets entity.
 * 
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface AccountsPetsRepository extends JpaRepository<AccountsPetsEntity, Integer> {
}
