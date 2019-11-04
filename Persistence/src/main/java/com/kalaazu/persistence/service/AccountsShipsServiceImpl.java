package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.AccountsShipsEntity;
import com.kalaazu.persistence.repository.AccountsShipsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * AccountsShips service.
 * =========================
 *
 * Service for the AccountsShips entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
public class AccountsShipsServiceImpl implements AccountsShipsService {
    @Autowired
    private AccountsShipsRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public AccountsShipsEntity create(AccountsShipsEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public AccountsShipsEntity find(Integer id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<AccountsShipsEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public AccountsShipsEntity update(AccountsShipsEntity entity) {
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