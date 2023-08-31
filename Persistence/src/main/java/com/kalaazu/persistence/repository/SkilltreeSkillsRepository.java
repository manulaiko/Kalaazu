package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.SkilltreeSkillsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * SkilltreeSkills repository.
 * ===========================
 * <p>
 * Repository for the SkilltreeSkills entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface SkilltreeSkillsRepository extends JpaRepository<SkilltreeSkillsEntity, Byte> {
}
