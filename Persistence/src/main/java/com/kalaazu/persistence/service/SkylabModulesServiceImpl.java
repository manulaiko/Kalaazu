package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.SkylabModulesEntity;
import com.kalaazu.persistence.repository.SkylabModulesRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * SkylabModules service.
 * =========================
 * <p>
 * Service for the SkylabModules entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
@RequiredArgsConstructor
public class SkylabModulesServiceImpl implements SkylabModulesService {
    private final SkylabModulesRepository repository;

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
    public SkylabModulesEntity find(Byte id) {
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
    public boolean delete(Byte id) {
        this.repository.deleteById(id);

        return !this.repository.existsById(id);
    }
}
