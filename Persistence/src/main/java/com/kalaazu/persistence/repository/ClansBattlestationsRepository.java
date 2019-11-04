package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.ClansBattlestationsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * ClansBattlestations repository.
 * ===============================
 * 
 * Repository for the ClansBattlestations entity.
 * 
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface ClansBattlestationsRepository extends JpaRepository<ClansBattlestationsEntity, Integer> {
}
