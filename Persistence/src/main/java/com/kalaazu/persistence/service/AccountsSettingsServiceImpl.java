package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.AccountsSettingsEntity;
import com.kalaazu.persistence.repository.AccountsSettingsRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Accounts settings service.
 * ==========================
 * <p>
 * Service for the AccountsSettings entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
@RequiredArgsConstructor
public class AccountsSettingsServiceImpl implements AccountsSettingsService {
    private final AccountsSettingsRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public AccountsSettingsEntity create(AccountsSettingsEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public AccountsSettingsEntity find(Integer id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<AccountsSettingsEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public AccountsSettingsEntity update(AccountsSettingsEntity entity) {
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
