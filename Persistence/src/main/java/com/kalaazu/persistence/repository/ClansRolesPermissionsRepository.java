package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.ClansRolesPermissionsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * ClansRolesPermissions repository.
 * =================================
 * 
 * Repository for the ClansRolesPermissions entity.
 * 
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface ClansRolesPermissionsRepository extends JpaRepository<ClansRolesPermissionsEntity, Integer> {
}
