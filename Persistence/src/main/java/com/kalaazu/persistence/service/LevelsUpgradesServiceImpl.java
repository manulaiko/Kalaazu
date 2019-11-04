package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.LevelsUpgradesEntity;
import com.kalaazu.persistence.repository.LevelsUpgradesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * LevelsUpgrades service.
 * ==========================
 *
 * Service for the LevelsUpgrades entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
public class LevelsUpgradesServiceImpl implements LevelsUpgradesService {
    @Autowired
    private LevelsUpgradesRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public LevelsUpgradesEntity create(LevelsUpgradesEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public LevelsUpgradesEntity find(Integer id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<LevelsUpgradesEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public LevelsUpgradesEntity update(LevelsUpgradesEntity entity) {
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