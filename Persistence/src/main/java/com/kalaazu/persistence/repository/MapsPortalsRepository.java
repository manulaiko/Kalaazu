package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.MapsPortalsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * MapsPortals repository.
 * =======================
 * 
 * Repository for the MapsPortals entity.
 * 
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface MapsPortalsRepository extends JpaRepository<MapsPortalsEntity, Integer> {
}
