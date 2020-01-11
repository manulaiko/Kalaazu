package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.PermissionsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Permissions repository.
 * =======================
 *
 * Repository for the Permissions entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface PermissionsRepository extends JpaRepository<PermissionsEntity, Byte> {
}
