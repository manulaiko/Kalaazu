package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.MapsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Maps repository.
 * ================
 * <p>
 * Repository for the Maps entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface MapsRepository extends JpaRepository<MapsEntity, Byte> {
}
