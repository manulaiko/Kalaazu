package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.AccountsDronesEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * AccountsDrones repository.
 * ==========================
 * 
 * Repository for the AccountsDrones entity.
 * 
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface AccountsDronesRepository extends JpaRepository<AccountsDronesEntity, Integer> {
}
