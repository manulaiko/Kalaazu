package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.MapsNpcsEntity;
import com.kalaazu.persistence.repository.MapsNpcsRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * MapsNpcs service.
 * ====================
 * <p>
 * Service for the MapsNpcs entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
@RequiredArgsConstructor
public class MapsNpcsServiceImpl implements MapsNpcsService {
    private final MapsNpcsRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public MapsNpcsEntity create(MapsNpcsEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public MapsNpcsEntity find(Byte id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<MapsNpcsEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public MapsNpcsEntity update(MapsNpcsEntity entity) {
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
