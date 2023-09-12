package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.MapsCollectablesEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * MapsCollectables repository.
 * ====================
 * <p>
 * Repository for the MapsCollectables entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface MapsCollectablesRepository extends JpaRepository<MapsCollectablesEntity, Byte> {
}
