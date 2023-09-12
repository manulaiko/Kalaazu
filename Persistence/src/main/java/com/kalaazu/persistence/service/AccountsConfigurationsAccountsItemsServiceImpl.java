package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.AccountsConfigurationsAccountsItemsEntity;
import com.kalaazu.persistence.repository.AccountsConfigurationsAccountsItemsRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * AccountsConfigurationsAccountsItems service.
 * ===============================================
 * <p>
 * Service for the AccountsConfigurationsAccountsItems entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
@RequiredArgsConstructor
public class AccountsConfigurationsAccountsItemsServiceImpl implements AccountsConfigurationsAccountsItemsService {
    private final AccountsConfigurationsAccountsItemsRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public AccountsConfigurationsAccountsItemsEntity create(AccountsConfigurationsAccountsItemsEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public AccountsConfigurationsAccountsItemsEntity find(Integer id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<AccountsConfigurationsAccountsItemsEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public AccountsConfigurationsAccountsItemsEntity update(AccountsConfigurationsAccountsItemsEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public boolean delete(Integer id) {
        this.repository.deleteById(id);

        return !this.repository.existsById(id);
    }
}
