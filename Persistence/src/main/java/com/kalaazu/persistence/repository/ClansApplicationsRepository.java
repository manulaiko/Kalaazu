package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.ClansApplicationsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * ClansApplications repository.
 * =============================
 * <p>
 * Repository for the ClansApplications entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface ClansApplicationsRepository extends JpaRepository<ClansApplicationsEntity, Integer> {
}
