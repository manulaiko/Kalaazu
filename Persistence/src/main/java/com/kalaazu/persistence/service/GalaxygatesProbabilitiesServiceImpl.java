package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.GalaxygatesProbabilitiesEntity;
import com.kalaazu.persistence.repository.GalaxygatesProbabilitiesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * GalaxygatesProbabilities service.
 * ====================================
 * <p>
 * Service for the GalaxygatesProbabilities entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
public class GalaxygatesProbabilitiesServiceImpl implements GalaxygatesProbabilitiesService {
    @Autowired
    private GalaxygatesProbabilitiesRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public GalaxygatesProbabilitiesEntity create(GalaxygatesProbabilitiesEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public GalaxygatesProbabilitiesEntity find(Byte id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<GalaxygatesProbabilitiesEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public GalaxygatesProbabilitiesEntity update(GalaxygatesProbabilitiesEntity entity) {
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
