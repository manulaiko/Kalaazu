package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.SkilltreeLevelsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * SkilltreeLevels repository.
 * ===========================
 * <p>
 * Repository for the SkilltreeLevels entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface SkilltreeLevelsRepository extends JpaRepository<SkilltreeLevelsEntity, Short> {
}
