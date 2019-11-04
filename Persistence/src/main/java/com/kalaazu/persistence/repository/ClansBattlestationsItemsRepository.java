package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.ClansBattlestationsItemsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * ClansBattlestationsItems repository.
 * ====================================
 * 
 * Repository for the ClansBattlestationsItems entity.
 * 
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface ClansBattlestationsItemsRepository extends JpaRepository<ClansBattlestationsItemsEntity, Integer> {
}
