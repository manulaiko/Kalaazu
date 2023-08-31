package com.kalaazu.cms.service;

import com.kalaazu.persistence.entity.AccountsEntity;
import com.kalaazu.persistence.service.AccountsService;
import com.kalaazu.persistence.service.UsersService;
import com.kalaazu.util.StringUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.time.Instant;
import java.util.Date;

/**
 * Login service.
 * ==============
 * <p>
 * Provides the logic for user authentication.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
@RequiredArgsConstructor
public class LoginService {
    private final UsersService users;
    private final AccountsService accounts;

    private Date nextBanExpire = null;
    private Date now = null;

    /**
     * Performs the user authentication.
     *
     * @param username User name.
     * @param password Password.
     * @return Authenticated user's account.
     * @throws Exception If something goes wrong.
     */
    public AccountsEntity login(String username, String password) throws Exception {
        var u = username.trim();
        var p = password.trim();

        if (u.isEmpty() || p.isEmpty()) {
            throw new Exception("Username/Password can't be empty!");
        }

        var user = this.users.login(u, p);
        if (user == null) {
            throw new Exception("Username/Password combination not found!");
        }


        this.now = Date.from(Instant.now());
        this.nextBanExpire = now;

        // Filter banned accounts, get last logged in account.
        var lastUsedAccount = user.getAccounts()
                .stream()
                .filter(this::filterBannedAccounts)
                .min(this::lastLoggedInAccount)
                .orElse(null);

        if (lastUsedAccount == null) {
            throw new Exception("All your accounts are banned until " + this.nextBanExpire);
        }

        // Generate new session ID.
        lastUsedAccount.setSessionId(StringUtils.sessionId());
        lastUsedAccount.setLastLogin(Timestamp.from(Instant.now()));

        return this.accounts.update(lastUsedAccount);
    }

    /**
     * Banned accounts filter.
     *
     * @param account Account to filter.
     * @return Whether the account is banned or not.
     */
    private boolean filterBannedAccounts(AccountsEntity account) {
        var date = account.getBanDate();

        // Not banned yet.
        if (date == null) {
            return true;
        }

        // If banned.
        if (date.compareTo(this.now) > 0) {
            // If this ban expires before `nextBanExpire`
            if (date.compareTo(this.nextBanExpire) > 0) {
                this.nextBanExpire = date;
            }

            return false;
        }

        // Ban expired
        return true;
    }

    /**
     * Filters the last logged in account.
     *
     * @param a1 First account to compare.
     * @param a2 Second account to compare.
     * @return Which account was last logged in.
     */
    private int lastLoggedInAccount(AccountsEntity a1, AccountsEntity a2) {
        return a2.getLastLogin()
                .compareTo(a1.getLastLogin());
    }
}
