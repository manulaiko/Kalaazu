package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.TechfactoryDronesEntity;
import com.kalaazu.persistence.repository.TechfactoryDronesRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * TechfactoryDrones service.
 * =============================
 * <p>
 * Service for the TechfactoryDrones entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
@RequiredArgsConstructor
public class TechfactoryDronesServiceImpl implements TechfactoryDronesService {
    private final TechfactoryDronesRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public TechfactoryDronesEntity create(TechfactoryDronesEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public TechfactoryDronesEntity find(Byte id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<TechfactoryDronesEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public TechfactoryDronesEntity update(TechfactoryDronesEntity entity) {
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
