package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.FactionsEntity;
import com.kalaazu.persistence.repository.FactionsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Factions service.
 * ====================
 * <p>
 * Service for the Factions entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
public class FactionsServiceImpl implements FactionsService {
    @Autowired
    private FactionsRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public FactionsEntity create(FactionsEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public FactionsEntity find(Byte id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<FactionsEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public FactionsEntity update(FactionsEntity entity) {
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
