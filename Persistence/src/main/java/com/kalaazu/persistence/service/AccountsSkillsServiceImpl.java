package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.AccountsSkillsEntity;
import com.kalaazu.persistence.repository.AccountsSkillsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * AccountsSkills service.
 * ==========================
 *
 * Service for the AccountsSkills entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
public class AccountsSkillsServiceImpl implements AccountsSkillsService {
    @Autowired
    private AccountsSkillsRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public AccountsSkillsEntity create(AccountsSkillsEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public AccountsSkillsEntity find(Integer id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<AccountsSkillsEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public AccountsSkillsEntity update(AccountsSkillsEntity entity) {
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