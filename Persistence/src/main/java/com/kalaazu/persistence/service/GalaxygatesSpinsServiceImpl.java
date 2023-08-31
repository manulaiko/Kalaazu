package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.GalaxygatesSpinsEntity;
import com.kalaazu.persistence.repository.GalaxygatesSpinsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * GalaxygatesSpins service.
 * ============================
 * <p>
 * Service for the GalaxygatesSpins entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
public class GalaxygatesSpinsServiceImpl implements GalaxygatesSpinsService {
    @Autowired
    private GalaxygatesSpinsRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public GalaxygatesSpinsEntity create(GalaxygatesSpinsEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public GalaxygatesSpinsEntity find(Byte id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<GalaxygatesSpinsEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public GalaxygatesSpinsEntity update(GalaxygatesSpinsEntity entity) {
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
