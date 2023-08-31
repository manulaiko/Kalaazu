package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.TechfactoryItemsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * TechfactoryItems repository.
 * ============================
 * <p>
 * Repository for the TechfactoryItems entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface TechfactoryItemsRepository extends JpaRepository<TechfactoryItemsEntity, Byte> {
}
