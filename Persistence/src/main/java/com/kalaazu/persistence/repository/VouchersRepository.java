package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.VouchersEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Vouchers repository.
 * ====================
 *
 * Repository for the Vouchers entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface VouchersRepository extends JpaRepository<VouchersEntity, Integer> {
}
