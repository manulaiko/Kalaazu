package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.GalaxygatesSpawnsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * GalaxygatesSpawns repository.
 * =============================
 * 
 * Repository for the GalaxygatesSpawns entity.
 * 
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface GalaxygatesSpawnsRepository extends JpaRepository<GalaxygatesSpawnsEntity, Integer> {
}
