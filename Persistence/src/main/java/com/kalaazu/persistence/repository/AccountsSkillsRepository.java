package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.AccountsSkillsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * AccountsSkills repository.
 * ==========================
 *
 * Repository for the AccountsSkills entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface AccountsSkillsRepository extends JpaRepository<AccountsSkillsEntity, Integer> {
}
