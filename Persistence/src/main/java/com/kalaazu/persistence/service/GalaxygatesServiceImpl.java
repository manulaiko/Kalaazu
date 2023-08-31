package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.GalaxygatesEntity;
import com.kalaazu.persistence.repository.GalaxygatesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Galaxygates service.
 * =======================
 * <p>
 * Service for the Galaxygates entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
public class GalaxygatesServiceImpl implements GalaxygatesService {
    @Autowired
    private GalaxygatesRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public GalaxygatesEntity create(GalaxygatesEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public GalaxygatesEntity find(Byte id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<GalaxygatesEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public GalaxygatesEntity update(GalaxygatesEntity entity) {
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
