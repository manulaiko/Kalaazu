package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.AccountsQuestsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * AccountsQuests repository.
 * ==========================
 * <p>
 * Repository for the AccountsQuests entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface AccountsQuestsRepository extends JpaRepository<AccountsQuestsEntity, Integer> {
}
