package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.NpcsEntity;
import com.kalaazu.persistence.repository.NpcsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Npcs service.
 * ================
 *
 * Service for the Npcs entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
public class NpcsServiceImpl implements NpcsService {
    @Autowired
    private NpcsRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public NpcsEntity create(NpcsEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public NpcsEntity find(Byte id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<NpcsEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public NpcsEntity update(NpcsEntity entity) {
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