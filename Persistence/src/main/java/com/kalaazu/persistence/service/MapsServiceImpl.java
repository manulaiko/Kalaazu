package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.MapsEntity;
import com.kalaazu.persistence.repository.MapsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Maps service.
 * ================
 *
 * Service for the Maps entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
public class MapsServiceImpl implements MapsService {
    @Autowired
    private MapsRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public MapsEntity create(MapsEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public MapsEntity find(Byte id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<MapsEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public MapsEntity update(MapsEntity entity) {
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