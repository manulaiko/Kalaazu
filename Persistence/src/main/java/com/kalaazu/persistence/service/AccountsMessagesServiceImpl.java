package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.AccountsMessagesEntity;
import com.kalaazu.persistence.repository.AccountsMessagesRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * AccountsMessages service.
 * ============================
 * <p>
 * Service for the AccountsMessages entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
@RequiredArgsConstructor
public class AccountsMessagesServiceImpl implements AccountsMessagesService {
    private final AccountsMessagesRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public AccountsMessagesEntity create(AccountsMessagesEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public AccountsMessagesEntity find(Integer id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<AccountsMessagesEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public AccountsMessagesEntity update(AccountsMessagesEntity entity) {
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
