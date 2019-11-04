package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.TechfactoryCostsEntity;
import com.kalaazu.persistence.repository.TechfactoryCostsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * TechfactoryCosts service.
 * ============================
 *
 * Service for the TechfactoryCosts entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
public class TechfactoryCostsServiceImpl implements TechfactoryCostsService {
    @Autowired
    private TechfactoryCostsRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public TechfactoryCostsEntity create(TechfactoryCostsEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public TechfactoryCostsEntity find(Integer id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<TechfactoryCostsEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public TechfactoryCostsEntity update(TechfactoryCostsEntity entity) {
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