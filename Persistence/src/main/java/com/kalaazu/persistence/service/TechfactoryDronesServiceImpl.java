package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.TechfactoryDronesEntity;
import com.kalaazu.persistence.repository.TechfactoryDronesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * TechfactoryDrones service.
 * =============================
 *
 * Service for the TechfactoryDrones entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
public class TechfactoryDronesServiceImpl implements TechfactoryDronesService {
    @Autowired
    private TechfactoryDronesRepository repository;

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