package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.LevelsEntity;
import com.kalaazu.persistence.repository.LevelsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Levels service.
 * ==================
 *
 * Service for the Levels entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
public class LevelsServiceImpl implements LevelsService {
    @Autowired
    private LevelsRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public LevelsEntity create(LevelsEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public LevelsEntity find(Byte id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<LevelsEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public LevelsEntity update(LevelsEntity entity) {
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