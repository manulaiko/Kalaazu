package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.TechfactoryCostsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * TechfactoryCosts repository.
 * ============================
 * <p>
 * Repository for the TechfactoryCosts entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface TechfactoryCostsRepository extends JpaRepository<TechfactoryCostsEntity, Byte> {
}
