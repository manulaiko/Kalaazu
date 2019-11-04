package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.ClansRolesEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * ClansRoles repository.
 * ======================
 * 
 * Repository for the ClansRoles entity.
 * 
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface ClansRolesRepository extends JpaRepository<ClansRolesEntity, Integer> {
}
