package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.AccountsDronesEntity;
import com.kalaazu.persistence.repository.AccountsDronesRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * AccountsDrones service.
 * ==========================
 * <p>
 * Service for the AccountsDrones entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
@RequiredArgsConstructor
public class AccountsDronesServiceImpl implements AccountsDronesService {
    private final AccountsDronesRepository repository;

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
