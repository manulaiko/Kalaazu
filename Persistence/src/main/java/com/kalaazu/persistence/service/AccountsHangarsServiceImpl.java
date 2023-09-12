package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.AccountsHangarsEntity;
import com.kalaazu.persistence.repository.AccountsHangarsRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * AccountsHangars service.
 * ===========================
 * <p>
 * Service for the AccountsHangars entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
@RequiredArgsConstructor
public class AccountsHangarsServiceImpl implements AccountsHangarsService {
    private final AccountsHangarsRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public AccountsHangarsEntity create(AccountsHangarsEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public AccountsHangarsEntity find(Integer id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<AccountsHangarsEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public AccountsHangarsEntity update(AccountsHangarsEntity entity) {
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
