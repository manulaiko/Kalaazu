package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.GalaxygatesStagesEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * GalaxygatesStages repository.
 * =============================
 *
 * Repository for the GalaxygatesStages entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface GalaxygatesStagesRepository extends JpaRepository<GalaxygatesStagesEntity, Integer> {
}
