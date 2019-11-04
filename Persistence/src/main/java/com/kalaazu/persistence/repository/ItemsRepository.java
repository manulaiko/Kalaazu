package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.ItemsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Items repository.
 * =================
 *
 * Repository for the Items entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface ItemsRepository extends JpaRepository<ItemsEntity, Integer> {
}
