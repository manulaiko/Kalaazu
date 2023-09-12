package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.AccountsItemsEntity;
import com.kalaazu.persistence.repository.AccountsItemsRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * AccountsItems service.
 * =========================
 * <p>
 * Service for the AccountsItems entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
@RequiredArgsConstructor
public class AccountsItemsServiceImpl implements AccountsItemsService {
    private final AccountsItemsRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public AccountsItemsEntity create(AccountsItemsEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public AccountsItemsEntity find(Integer id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<AccountsItemsEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public AccountsItemsEntity update(AccountsItemsEntity entity) {
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
