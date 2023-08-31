package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.TechfactoryDronesEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * TechfactoryDrones repository.
 * =============================
 * <p>
 * Repository for the TechfactoryDrones entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface TechfactoryDronesRepository extends JpaRepository<TechfactoryDronesEntity, Byte> {
}
