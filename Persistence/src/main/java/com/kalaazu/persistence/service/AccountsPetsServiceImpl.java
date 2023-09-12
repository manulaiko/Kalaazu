package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.AccountsPetsEntity;
import com.kalaazu.persistence.repository.AccountsPetsRepository;
import lombok.RequiredArgsConstructor;
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
@RequiredArgsConstructor
public class AccountsPetsServiceImpl implements AccountsPetsService {
    private final AccountsPetsRepository repository;

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
