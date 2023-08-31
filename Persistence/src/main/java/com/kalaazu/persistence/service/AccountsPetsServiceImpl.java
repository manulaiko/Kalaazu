package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.AccountsPetsEntity;
import com.kalaazu.persistence.repository.AccountsPetsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * AccountsPets service.
 * ========================
 * <p>
 * Service for the AccountsPets entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
public class AccountsPetsServiceImpl implements AccountsPetsService {
    @Autowired
    private AccountsPetsRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public AccountsPetsEntity create(AccountsPetsEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public AccountsPetsEntity find(Integer id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<AccountsPetsEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public AccountsPetsEntity update(AccountsPetsEntity entity) {
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
