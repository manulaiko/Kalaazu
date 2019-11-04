package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.AccountsBanksEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * AccountsBanks repository.
 * =========================
 * 
 * Repository for the AccountsBanks entity.
 * 
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface AccountsBanksRepository extends JpaRepository<AccountsBanksEntity, Integer> {
}
