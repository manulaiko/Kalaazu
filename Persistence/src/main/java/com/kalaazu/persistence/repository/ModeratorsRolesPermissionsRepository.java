package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.ModeratorsRolesPermissionsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * ModeratorsRolesPermissions repository.
 * ======================================
 * <p>
 * Repository for the ModeratorsRolesPermissions entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface ModeratorsRolesPermissionsRepository extends JpaRepository<ModeratorsRolesPermissionsEntity, Byte> {
}
