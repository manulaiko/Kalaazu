package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.GalaxygatesWavesEntity;
import com.kalaazu.persistence.repository.GalaxygatesWavesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * GalaxygatesWaves service.
 * ============================
 * <p>
 * Service for the GalaxygatesWaves entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
public class GalaxygatesWavesServiceImpl implements GalaxygatesWavesService {
    @Autowired
    private GalaxygatesWavesRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public GalaxygatesWavesEntity create(GalaxygatesWavesEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public GalaxygatesWavesEntity find(Byte id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<GalaxygatesWavesEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public GalaxygatesWavesEntity update(GalaxygatesWavesEntity entity) {
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
