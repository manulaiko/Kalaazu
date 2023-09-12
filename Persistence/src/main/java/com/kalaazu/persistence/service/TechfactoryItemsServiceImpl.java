package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.TechfactoryItemsEntity;
import com.kalaazu.persistence.repository.TechfactoryItemsRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * TechfactoryItems service.
 * ============================
 * <p>
 * Service for the TechfactoryItems entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
@RequiredArgsConstructor
public class TechfactoryItemsServiceImpl implements TechfactoryItemsService {
    private final TechfactoryItemsRepository repository;

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
    public TechfactoryItemsEntity find(Byte id) {
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
    public boolean delete(Byte id) {
        this.repository.deleteById(id);

        return !this.repository.existsById(id);
    }
}
