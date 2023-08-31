package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.QuestsConditionsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * QuestsConditions repository.
 * ============================
 * <p>
 * Repository for the QuestsConditions entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface QuestsConditionsRepository extends JpaRepository<QuestsConditionsEntity, Integer> {
}
