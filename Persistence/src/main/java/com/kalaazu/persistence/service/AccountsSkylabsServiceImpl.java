package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.AccountsSkylabsEntity;
import com.kalaazu.persistence.repository.AccountsSkylabsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * AccountsSkylabs service.
 * ===========================
 * <p>
 * Service for the AccountsSkylabs entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
public class AccountsSkylabsServiceImpl implements AccountsSkylabsService {
    @Autowired
    private AccountsSkylabsRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public AccountsSkylabsEntity create(AccountsSkylabsEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public AccountsSkylabsEntity find(Integer id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<AccountsSkylabsEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public AccountsSkylabsEntity update(AccountsSkylabsEntity entity) {
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
