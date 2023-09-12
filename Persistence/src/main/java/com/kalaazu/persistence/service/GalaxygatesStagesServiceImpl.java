package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.GalaxygatesStagesEntity;
import com.kalaazu.persistence.repository.GalaxygatesStagesRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * GalaxygatesStages service.
 * =============================
 * <p>
 * Service for the GalaxygatesStages entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
@RequiredArgsConstructor
public class GalaxygatesStagesServiceImpl implements GalaxygatesStagesService {
    private final GalaxygatesStagesRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public GalaxygatesStagesEntity create(GalaxygatesStagesEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public GalaxygatesStagesEntity find(Integer id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<GalaxygatesStagesEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public GalaxygatesStagesEntity update(GalaxygatesStagesEntity entity) {
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
