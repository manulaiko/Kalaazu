package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.TechfactoryItemsEntity;
import com.kalaazu.persistence.repository.TechfactoryItemsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * TechfactoryItems service.
 * ============================
 *
 * Service for the TechfactoryItems entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
public class TechfactoryItemsServiceImpl implements TechfactoryItemsService {
    @Autowired
    private TechfactoryItemsRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public TechfactoryItemsEntity create(TechfactoryItemsEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public TechfactoryItemsEntity find(Integer id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<TechfactoryItemsEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public TechfactoryItemsEntity update(TechfactoryItemsEntity entity) {
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