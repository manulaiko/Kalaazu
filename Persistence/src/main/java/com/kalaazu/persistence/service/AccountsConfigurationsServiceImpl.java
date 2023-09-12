package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.AccountsConfigurationsEntity;
import com.kalaazu.persistence.repository.AccountsConfigurationsRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * AccountsConfigurations service.
 * ==================================
 * <p>
 * Service for the AccountsConfigurations entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
@RequiredArgsConstructor
public class AccountsConfigurationsServiceImpl implements AccountsConfigurationsService {
    private final AccountsConfigurationsRepository repository;

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
