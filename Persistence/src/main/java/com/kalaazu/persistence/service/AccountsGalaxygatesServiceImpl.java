package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.AccountsGalaxygatesEntity;
import com.kalaazu.persistence.repository.AccountsGalaxygatesRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * AccountsGalaxygates service.
 * ===============================
 * <p>
 * Service for the AccountsGalaxygates entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
@RequiredArgsConstructor
public class AccountsGalaxygatesServiceImpl implements AccountsGalaxygatesService {
    private final AccountsGalaxygatesRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public AccountsGalaxygatesEntity create(AccountsGalaxygatesEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public AccountsGalaxygatesEntity find(Integer id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<AccountsGalaxygatesEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public AccountsGalaxygatesEntity update(AccountsGalaxygatesEntity entity) {
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
