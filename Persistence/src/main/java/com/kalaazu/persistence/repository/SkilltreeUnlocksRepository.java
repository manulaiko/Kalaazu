package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.SkilltreeUnlocksEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * SkilltreeUnlocks repository.
 * ============================
 *
 * Repository for the SkilltreeUnlocks entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface SkilltreeUnlocksRepository extends JpaRepository<SkilltreeUnlocksEntity, Short> {
}
