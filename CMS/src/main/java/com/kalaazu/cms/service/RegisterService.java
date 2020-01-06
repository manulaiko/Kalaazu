package com.kalaazu.cms.service;

import com.kalaazu.persistence.entity.AccountsEntity;
import com.kalaazu.persistence.entity.UsersEntity;
import com.kalaazu.persistence.service.AccountsService;
import com.kalaazu.persistence.service.LevelsService;
import com.kalaazu.persistence.service.UsersService;
import com.kalaazu.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Register service.
 * =================
 *
 * Provides the logic for user registration.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
public class RegisterService {
    @Autowired
    private UsersService users;

    @Autowired
    private AccountsService accounts;

    @Autowired
    private LevelsService levels;

    /**
     * Performs the user registration.
     *
     * @param username User name.
     * @param password User password.
     * @param email    User email.
     *
     * @return Registered account session ID.
     *
     * @throws Exception If something goes wrong.
     */
    public String register(String username, String password, String email) throws Exception {
        var u = username.trim();
        var p = password.trim();
        var e = email.trim();

        if (u.isEmpty() || p.isEmpty() || e.isEmpty()) {
            throw new Exception("All fields are required!");
        }

        var user = users.register(u, p, e);
        var account = this.createAccount(user);

        // TODO Add starting items.

        return account.getSessionId();
    }

    /**
     * Creates the account for the user.
     *
     * @param user User that will own the account.
     *
     * @return Created account.
     */
    private AccountsEntity createAccount(UsersEntity user) {
        var account = new AccountsEntity();
        account.setName(user.getName());
        account.setSessionId(StringUtils.sessionId());

        account.setUsersByUsersId(user);
        account.setLevelsByLevelsId(this.levels.find(1));

        return this.accounts.create(account);
    }
}
