package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.KeyValueEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * KeyValue repository.
 * ====================
 * 
 * Repository for the KeyValue entity.
 * 
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface KeyValueRepository extends JpaRepository<KeyValueEntity, Integer> {
}
