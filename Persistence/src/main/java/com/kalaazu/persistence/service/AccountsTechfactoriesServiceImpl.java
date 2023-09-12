package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.AccountsTechfactoriesEntity;
import com.kalaazu.persistence.repository.AccountsTechfactoriesRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * AccountsTechfactories service.
 * =================================
 * <p>
 * Service for the AccountsTechfactories entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
@RequiredArgsConstructor
public class AccountsTechfactoriesServiceImpl implements AccountsTechfactoriesService {
    private final AccountsTechfactoriesRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public AccountsTechfactoriesEntity create(AccountsTechfactoriesEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public AccountsTechfactoriesEntity find(Integer id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<AccountsTechfactoriesEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public AccountsTechfactoriesEntity update(AccountsTechfactoriesEntity entity) {
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
