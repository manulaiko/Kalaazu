package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.InvitationCodesRedeemLogsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * InvitationCodesRedeemLogs repository.
 * =====================================
 * <p>
 * Repository for the InvitationCodesRedeemLogs entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface InvitationCodesRedeemLogsRepository extends JpaRepository<InvitationCodesRedeemLogsEntity, Integer> {
}
