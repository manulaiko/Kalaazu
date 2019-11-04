package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.ClansRankingEntity;
import com.kalaazu.persistence.repository.ClansRankingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * ClansRanking service.
 * ========================
 *
 * Service for the ClansRanking entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
public class ClansRankingServiceImpl implements ClansRankingService {
    @Autowired
    private ClansRankingRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public ClansRankingEntity create(ClansRankingEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public ClansRankingEntity find(Integer id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<ClansRankingEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public ClansRankingEntity update(ClansRankingEntity entity) {
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