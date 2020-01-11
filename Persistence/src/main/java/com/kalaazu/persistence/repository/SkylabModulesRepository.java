package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.SkylabModulesEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * SkylabModules repository.
 * =========================
 *
 * Repository for the SkylabModules entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface SkylabModulesRepository extends JpaRepository<SkylabModulesEntity, Byte> {
}
