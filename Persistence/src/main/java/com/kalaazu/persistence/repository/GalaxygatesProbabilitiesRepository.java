package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.GalaxygatesProbabilitiesEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * GalaxygatesProbabilities repository.
 * ====================================
 * 
 * Repository for the GalaxygatesProbabilities entity.
 * 
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface GalaxygatesProbabilitiesRepository extends JpaRepository<GalaxygatesProbabilitiesEntity, Integer> {
}
