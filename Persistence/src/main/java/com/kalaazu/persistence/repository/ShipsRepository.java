package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.ShipsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Ships repository.
 * =================
 *
 * Repository for the Ships entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface ShipsRepository extends JpaRepository<ShipsEntity, Integer> {
}
