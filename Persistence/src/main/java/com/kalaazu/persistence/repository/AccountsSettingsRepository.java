package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.AccountsSettingsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * AccountsSettings repository.
 * ============================
 * <p>
 * Repository for the AccountsSettings entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface AccountsSettingsRepository extends JpaRepository<AccountsSettingsEntity, Integer> {
}
