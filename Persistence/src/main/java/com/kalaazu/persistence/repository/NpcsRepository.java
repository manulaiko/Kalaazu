package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.NpcsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Npcs repository.
 * ================
 *
 * Repository for the Npcs entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface NpcsRepository extends JpaRepository<NpcsEntity, Integer> {
}
