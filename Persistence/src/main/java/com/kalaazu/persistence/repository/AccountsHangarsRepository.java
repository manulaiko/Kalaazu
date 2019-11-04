package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.AccountsHangarsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * AccountsHangars repository.
 * ===========================
 * 
 * Repository for the AccountsHangars entity.
 * 
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface AccountsHangarsRepository extends JpaRepository<AccountsHangarsEntity, Integer> {
}
