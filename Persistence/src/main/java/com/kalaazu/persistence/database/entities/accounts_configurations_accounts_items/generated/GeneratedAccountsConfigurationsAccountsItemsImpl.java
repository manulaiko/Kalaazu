package com.kalaazu.persistence.database.entities.accounts_configurations_accounts_items.generated;

import com.kalaazu.persistence.database.entities.*;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.runtime.core.util.OptionalUtil;
import lombok.Data;

import java.util.Objects;
import java.util.Optional;
import java.util.OptionalInt;
import java.util.StringJoiner;

/**
 * The generated base implementation of the {@link
 * AccountsConfigurationsAccountsItems}-interface.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 *
 * @author Speedment
 */
@GeneratedCode("Speedment")
@Data
public abstract class GeneratedAccountsConfigurationsAccountsItemsImpl implements AccountsConfigurationsAccountsItems {

    private Integer id;

    private int accountsConfigurationsId;

    private int accountsItemsId;

    private Integer accountsDronesId;

    private Integer accountsPetsId;

    protected GeneratedAccountsConfigurationsAccountsItemsImpl() {

    }

    @Override
    public OptionalInt accountsDronesId() {
        return OptionalUtil.ofNullable(accountsDronesId);
    }

    @Override
    public OptionalInt accountsPetsId() {
        return OptionalUtil.ofNullable(accountsPetsId);
    }

    @Override
    public AccountsConfigurations findAccountsConfigurationsId(Manager<AccountsConfigurations> foreignManager) {
        return foreignManager.stream()
                             .filter(AccountsConfigurations.ID.equal(accountsConfigurationsId()))
                             .findAny()
                             .orElse(null);
    }

    @Override
    public AccountsItems findAccountsItemsId(Manager<AccountsItems> foreignManager) {
        return foreignManager.stream()
                             .filter(AccountsItems.ID.equal(accountsItemsId()))
                             .findAny()
                             .orElse(null);
    }

    @Override
    public Optional<AccountsDrones> findAccountsDronesId(Manager<AccountsDrones> foreignManager) {
        if (accountsDronesId().isPresent()) {
            return foreignManager.stream()
                                 .filter(AccountsDrones.ID.equal(accountsDronesId().getAsInt()))
                                 .findAny();
        } else {
            return Optional.empty();
        }
    }

    @Override
    public Optional<AccountsPets> findAccountsPetsId(Manager<AccountsPets> foreignManager) {
        if (accountsPetsId().isPresent()) {
            return foreignManager.stream()
                                 .filter(AccountsPets.ID.equal(accountsPetsId().getAsInt()))
                                 .findAny();
        } else {
            return Optional.empty();
        }
    }
}