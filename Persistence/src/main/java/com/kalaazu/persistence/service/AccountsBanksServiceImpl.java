package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.AccountsBanksEntity;
import com.kalaazu.persistence.repository.AccountsBanksRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * AccountsBanks service.
 * =========================
 *
 * Service for the AccountsBanks entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
public class AccountsBanksServiceImpl implements AccountsBanksService {
    @Autowired
    private AccountsBanksRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public AccountsBanksEntity create(AccountsBanksEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public AccountsBanksEntity find(Integer id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<AccountsBanksEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public AccountsBanksEntity update(AccountsBanksEntity entity) {
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