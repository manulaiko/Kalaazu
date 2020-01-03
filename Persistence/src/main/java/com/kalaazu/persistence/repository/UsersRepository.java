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
    /**
     * Returns the user with the provided login info.
     *
     * @param username Login username.
     * @param password Login password.
     *
     * @return Login user.
     */
    UsersEntity findByNameAndPassword(String username, String password);

    /**
     * Returns the user with the provided register info.
     *
     * @param username Login username.
     * @param email    Login password.
     *
     * @return Login user.
     */
    UsersEntity findByNameOrEmail(String username, String email);
}
