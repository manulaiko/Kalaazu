package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.AccountsBanksLogsEntity;
import com.kalaazu.persistence.repository.AccountsBanksLogsRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * AccountsBanksLogs service.
 * =============================
 * <p>
 * Service for the AccountsBanksLogs entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
@RequiredArgsConstructor
public class AccountsBanksLogsServiceImpl implements AccountsBanksLogsService {
    private final AccountsBanksLogsRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public AccountsBanksLogsEntity create(AccountsBanksLogsEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public AccountsBanksLogsEntity find(Integer id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<AccountsBanksLogsEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public AccountsBanksLogsEntity update(AccountsBanksLogsEntity entity) {
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
