package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.RewardsEntity;
import com.kalaazu.persistence.repository.RewardsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Rewards service.
 * ===================
 *
 * Service for the Rewards entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
public class RewardsServiceImpl implements RewardsService {
    @Autowired
    private RewardsRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public RewardsEntity create(RewardsEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public RewardsEntity find(Short id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<RewardsEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public RewardsEntity update(RewardsEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public boolean delete(Short id) {
        this.repository.deleteById(id);

        return !this.repository.existsById(id);
    }
}