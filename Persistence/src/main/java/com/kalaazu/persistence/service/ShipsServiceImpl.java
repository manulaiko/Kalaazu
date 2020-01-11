package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.ShipsEntity;
import com.kalaazu.persistence.repository.ShipsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Ships service.
 * =================
 *
 * Service for the Ships entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
public class ShipsServiceImpl implements ShipsService {
    @Autowired
    private ShipsRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public ShipsEntity create(ShipsEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public ShipsEntity find(Byte id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<ShipsEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public ShipsEntity update(ShipsEntity entity) {
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