package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.AccountsConfigurationsAccountsItemsEntity;
import com.kalaazu.persistence.repository.AccountsConfigurationsAccountsItemsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * AccountsConfigurationsAccountsItems service.
 * ===============================================
 *
 * Service for the AccountsConfigurationsAccountsItems entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
public class AccountsConfigurationsAccountsItemsServiceImpl implements AccountsConfigurationsAccountsItemsService {
    @Autowired
    private AccountsConfigurationsAccountsItemsRepository repository;

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