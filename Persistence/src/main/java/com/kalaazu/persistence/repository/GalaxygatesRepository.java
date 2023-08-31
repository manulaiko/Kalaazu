package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.GalaxygatesEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Galaxygates repository.
 * =======================
 * <p>
 * Repository for the Galaxygates entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface GalaxygatesRepository extends JpaRepository<GalaxygatesEntity, Byte> {
}
