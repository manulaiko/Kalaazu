package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.UsersEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Users repository.
 * =================
 * <p>
 * Repository for the Users entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface UsersRepository extends JpaRepository<UsersEntity, Integer> {
    /**
     * Returns the user with the provided login info.
     *
     * @param username Login username.
     * @return Login user.
     */
    UsersEntity findByName(String username);

    /**
     * Returns the user with the provided register info.
     *
     * @param username Login username.
     * @param email    Login password.
     * @return Login user.
     */
    UsersEntity findByNameOrEmail(String username, String email);
}
