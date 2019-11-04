package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.InvitationCodesEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * InvitationCodes repository.
 * ===========================
 * 
 * Repository for the InvitationCodes entity.
 * 
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface InvitationCodesRepository extends JpaRepository<InvitationCodesEntity, Integer> {
}
