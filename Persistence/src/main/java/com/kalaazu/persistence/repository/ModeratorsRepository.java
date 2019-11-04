package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.ModeratorsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Moderators repository.
 * ======================
 *
 * Repository for the Moderators entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface ModeratorsRepository extends JpaRepository<ModeratorsEntity, Integer> {
}
