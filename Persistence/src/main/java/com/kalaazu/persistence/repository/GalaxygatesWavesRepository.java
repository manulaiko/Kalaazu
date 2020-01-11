package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.GalaxygatesWavesEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * GalaxygatesWaves repository.
 * ============================
 *
 * Repository for the GalaxygatesWaves entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface GalaxygatesWavesRepository extends JpaRepository<GalaxygatesWavesEntity, Byte> {
}
