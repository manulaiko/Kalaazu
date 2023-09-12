package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.MapsEntity;
import com.kalaazu.persistence.repository.MapsRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Maps service.
 * ================
 * <p>
 * Service for the Maps entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
@RequiredArgsConstructor
public class MapsServiceImpl implements MapsService {
    private final MapsRepository repository;

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
