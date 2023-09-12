package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.AccountsSkylabsEntity;
import com.kalaazu.persistence.repository.AccountsSkylabsRepository;
import lombok.RequiredArgsConstructor;
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
@RequiredArgsConstructor
public class AccountsSkylabsServiceImpl implements AccountsSkylabsService {
    private final AccountsSkylabsRepository repository;

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
