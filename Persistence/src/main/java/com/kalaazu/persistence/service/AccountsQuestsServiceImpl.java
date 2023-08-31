package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.AccountsQuestsEntity;
import com.kalaazu.persistence.repository.AccountsQuestsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * AccountsQuests service.
 * ==========================
 * <p>
 * Service for the AccountsQuests entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
public class AccountsQuestsServiceImpl implements AccountsQuestsService {
    @Autowired
    private AccountsQuestsRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public AccountsQuestsEntity create(AccountsQuestsEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public AccountsQuestsEntity find(Integer id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<AccountsQuestsEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public AccountsQuestsEntity update(AccountsQuestsEntity entity) {
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
