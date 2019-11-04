package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.AccountsConfigurationsEntity;
import com.kalaazu.persistence.repository.AccountsConfigurationsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * AccountsConfigurations service.
 * ==================================
 *
 * Service for the AccountsConfigurations entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
public class AccountsConfigurationsServiceImpl implements AccountsConfigurationsService {
    @Autowired
    private AccountsConfigurationsRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public AccountsConfigurationsEntity create(AccountsConfigurationsEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public AccountsConfigurationsEntity find(Integer id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<AccountsConfigurationsEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public AccountsConfigurationsEntity update(AccountsConfigurationsEntity entity) {
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