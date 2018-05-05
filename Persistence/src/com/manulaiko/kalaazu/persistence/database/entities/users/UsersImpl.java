package com.manulaiko.kalaazu.persistence.database.entities.users;

import com.manulaiko.kalaazu.persistence.database.Database;
import com.manulaiko.kalaazu.persistence.database.entities.Accounts;
import com.manulaiko.kalaazu.persistence.database.entities.InvitationCodes;
import com.manulaiko.kalaazu.persistence.database.entities.Users;
import com.manulaiko.kalaazu.persistence.database.entities.users.generated.GeneratedUsersImpl;

import java.util.Comparator;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * The default implementation of the {@link
 * Users}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class UsersImpl
        extends GeneratedUsersImpl
        implements Users {
    /**
     * This user's accounts.
     */
    private List<Accounts> accounts;

    /**
     * Invitation code.
     */
    private Optional<InvitationCodes> invitationCode;

    /**
     * Last used account.
     */
    private Accounts lastUsedAccount;

    @Override
    public List<Accounts> getAccounts() {
        if (this.accounts != null) {
            return this.accounts;
        }

        this.accounts = Database.getInstance()
                                .all(Accounts.class)
                                .filter(a -> a.getUsersId() == super.getId())
                                .collect(Collectors.toList());

        return this.accounts;
    }

    @Override
    public Optional<InvitationCodes> getInvitationCode() {
        if (this.invitationCode != null) {
            return this.invitationCode;
        }

        this.invitationCode = Optional.empty();

        super.getInvitationCodesId()
            .ifPresent(
                    id -> this.invitationCode = Database.getInstance()
                                                        .find(id, InvitationCodes.class)
            );

        return this.invitationCode;
    }

    @Override
    public Accounts getLastUsedAccount() {
        if (this.lastUsedAccount != null) {
            return this.lastUsedAccount;
        }

        this.getAccounts()
            .stream()
            .min(Comparator.comparing(
                    a -> a.getLastLogin()
                          .orElse(super.getDate())
                    // TODO odds are this will fail ¯\_(ツ)_/¯
            ))
            .ifPresent(accounts1 -> this.lastUsedAccount = accounts1);

        return this.lastUsedAccount;
    }
}