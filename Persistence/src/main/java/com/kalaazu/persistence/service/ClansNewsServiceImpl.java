package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.ClansNewsEntity;
import com.kalaazu.persistence.repository.ClansNewsRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * ClansNews service.
 * =====================
 * <p>
 * Service for the ClansNews entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
@RequiredArgsConstructor
public class ClansNewsServiceImpl implements ClansNewsService {
    private final ClansNewsRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public ClansNewsEntity create(ClansNewsEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public ClansNewsEntity find(Integer id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<ClansNewsEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public ClansNewsEntity update(ClansNewsEntity entity) {
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
