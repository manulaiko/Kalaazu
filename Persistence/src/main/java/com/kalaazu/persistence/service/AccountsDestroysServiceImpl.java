package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.AccountsDestroysEntity;
import com.kalaazu.persistence.repository.AccountsDestroysRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * AccountsDestroys service.
 * ============================
 * <p>
 * Service for the AccountsDestroys entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
@RequiredArgsConstructor
public class AccountsDestroysServiceImpl implements AccountsDestroysService {
    private final AccountsDestroysRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public AccountsDestroysEntity create(AccountsDestroysEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public AccountsDestroysEntity find(Integer id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<AccountsDestroysEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public AccountsDestroysEntity update(AccountsDestroysEntity entity) {
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
