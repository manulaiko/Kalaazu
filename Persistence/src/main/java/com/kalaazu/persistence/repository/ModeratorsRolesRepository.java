package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.ModeratorsRolesEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * ModeratorsRoles repository.
 * ===========================
 *
 * Repository for the ModeratorsRoles entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface ModeratorsRolesRepository extends JpaRepository<ModeratorsRolesEntity, Integer> {
}
