package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.AccountsGalaxygatesEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * AccountsGalaxygates repository.
 * ===============================
 * <p>
 * Repository for the AccountsGalaxygates entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface AccountsGalaxygatesRepository extends JpaRepository<AccountsGalaxygatesEntity, Integer> {
}
