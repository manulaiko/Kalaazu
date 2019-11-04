package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.UsersEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Users repository.
 * =================
 *
 * Repository for the Users entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface UsersRepository extends JpaRepository<UsersEntity, Integer> {
}
