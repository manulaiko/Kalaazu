package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.MapsNpcsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * MapsNpcs repository.
 * ====================
 *
 * Repository for the MapsNpcs entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface MapsNpcsRepository extends JpaRepository<MapsNpcsEntity, Byte> {
}
