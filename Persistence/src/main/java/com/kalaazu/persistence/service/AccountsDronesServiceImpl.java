package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.AccountsDronesEntity;
import com.kalaazu.persistence.repository.AccountsDronesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * AccountsDrones service.
 * ==========================
 *
 * Service for the AccountsDrones entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
public class AccountsDronesServiceImpl implements AccountsDronesService {
    @Autowired
    private AccountsDronesRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public AccountsDronesEntity create(AccountsDronesEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public AccountsDronesEntity find(Integer id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<AccountsDronesEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public AccountsDronesEntity update(AccountsDronesEntity entity) {
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