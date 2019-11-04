package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.SkylabModulesEntity;
import com.kalaazu.persistence.repository.SkylabModulesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * SkylabModules service.
 * =========================
 *
 * Service for the SkylabModules entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
public class SkylabModulesServiceImpl implements SkylabModulesService {
    @Autowired
    private SkylabModulesRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public SkylabModulesEntity create(SkylabModulesEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public SkylabModulesEntity find(Integer id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<SkylabModulesEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public SkylabModulesEntity update(SkylabModulesEntity entity) {
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