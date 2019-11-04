package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.AccountsHistoryEntity;
import com.kalaazu.persistence.repository.AccountsHistoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * AccountsHistory service.
 * ===========================
 *
 * Service for the AccountsHistory entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
public class AccountsHistoryServiceImpl implements AccountsHistoryService {
    @Autowired
    private AccountsHistoryRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public AccountsHistoryEntity create(AccountsHistoryEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public AccountsHistoryEntity find(Integer id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<AccountsHistoryEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public AccountsHistoryEntity update(AccountsHistoryEntity entity) {
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