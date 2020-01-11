package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.RanksEntity;
import com.kalaazu.persistence.repository.RanksRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Ranks service.
 * =================
 *
 * Service for the Ranks entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
public class RanksServiceImpl implements RanksService {
    @Autowired
    private RanksRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public RanksEntity create(RanksEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public RanksEntity find(Byte id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<RanksEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public RanksEntity update(RanksEntity entity) {
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