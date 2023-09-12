package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.MapsPortalsEntity;
import com.kalaazu.persistence.repository.MapsPortalsRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * MapsPortals service.
 * =======================
 * <p>
 * Service for the MapsPortals entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
@RequiredArgsConstructor
public class MapsPortalsServiceImpl implements MapsPortalsService {
    private final MapsPortalsRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public MapsPortalsEntity create(MapsPortalsEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public MapsPortalsEntity find(Byte id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<MapsPortalsEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public MapsPortalsEntity update(MapsPortalsEntity entity) {
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
