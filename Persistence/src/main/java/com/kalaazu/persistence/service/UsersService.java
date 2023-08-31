package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.UsersEntity;

/**
 * Users service.
 * =================
 * <p>
 * Service for the Users entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface UsersService extends IService<UsersEntity, Integer> {
    /**
     * Returns the user with the provided login info.
     *
     * @param username Login username.
     * @param password Login password.
     * @return Login user.
     */
    UsersEntity login(String username, String password);

    /**
     * Registers a new user with the provided info.
     *
     * @param username Login username.
     * @param password Login password.
     * @param email    User email.
     * @return Created user.
     */
    UsersEntity register(String username, String password, String email) throws Exception;
}
