package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.AccountsRankingsEntity;
import com.kalaazu.persistence.repository.AccountsRankingsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * AccountsRankings service.
 * ============================
 *
 * Service for the AccountsRankings entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
public class AccountsRankingsServiceImpl implements AccountsRankingsService {
    @Autowired
    private AccountsRankingsRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public AccountsRankingsEntity create(AccountsRankingsEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public AccountsRankingsEntity find(Integer id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<AccountsRankingsEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public AccountsRankingsEntity update(AccountsRankingsEntity entity) {
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