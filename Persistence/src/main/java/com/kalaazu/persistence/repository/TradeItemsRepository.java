package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.TradeItemsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * TradeItems repository.
 * ======================
 *
 * Repository for the TradeItems entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface TradeItemsRepository extends JpaRepository<TradeItemsEntity, Integer> {
}
