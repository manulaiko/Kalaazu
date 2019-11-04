package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.VouchersRedeemLogsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * VouchersRedeemLogs repository.
 * ==============================
 *
 * Repository for the VouchersRedeemLogs entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface VouchersRedeemLogsRepository extends JpaRepository<VouchersRedeemLogsEntity, Integer> {
}
