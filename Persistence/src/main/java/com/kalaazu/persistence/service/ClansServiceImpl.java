package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.ClansEntity;
import com.kalaazu.persistence.repository.ClansRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Clans service.
 * =================
 * <p>
 * Service for the Clans entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
public class ClansServiceImpl implements ClansService {
    @Autowired
    private ClansRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public ClansEntity create(ClansEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public ClansEntity find(Integer id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<ClansEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public ClansEntity update(ClansEntity entity) {
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
