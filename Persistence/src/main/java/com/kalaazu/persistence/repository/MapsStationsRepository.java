package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.MapsStationsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * MapsStations repository.
 * ========================
 *
 * Repository for the MapsStations entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface MapsStationsRepository extends JpaRepository<MapsStationsEntity, Integer> {
}
