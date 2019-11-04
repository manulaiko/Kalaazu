package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.AccountsMessagesEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * AccountsMessages repository.
 * ============================
 *
 * Repository for the AccountsMessages entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface AccountsMessagesRepository extends JpaRepository<AccountsMessagesEntity, Integer> {
}
