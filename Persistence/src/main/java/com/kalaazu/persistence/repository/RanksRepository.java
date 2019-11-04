package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.RanksEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Ranks repository.
 * =================
 * 
 * Repository for the Ranks entity.
 * 
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface RanksRepository extends JpaRepository<RanksEntity, Integer> {
}
