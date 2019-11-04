package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.UsersEntity;

/**
 * Users service.
 * =================
 *
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
     *
     * @return Login user.
     */
    UsersEntity login(String username, String password);
}
