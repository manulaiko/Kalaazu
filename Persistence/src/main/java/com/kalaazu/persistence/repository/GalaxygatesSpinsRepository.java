package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.GalaxygatesSpinsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * GalaxygatesSpins repository.
 * ============================
 *
 * Repository for the GalaxygatesSpins entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface GalaxygatesSpinsRepository extends JpaRepository<GalaxygatesSpinsEntity, Integer> {
}
