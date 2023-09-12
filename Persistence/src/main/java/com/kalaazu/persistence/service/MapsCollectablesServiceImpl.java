package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.MapsCollectablesEntity;
import com.kalaazu.persistence.repository.MapsCollectablesRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * MapsCollectables service.
 * ====================
 * <p>
 * Service for the MapsCollectables entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
@RequiredArgsConstructor
public class MapsCollectablesServiceImpl implements MapsCollectablesService {
    private final MapsCollectablesRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public MapsCollectablesEntity create(MapsCollectablesEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public MapsCollectablesEntity find(Byte id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<MapsCollectablesEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public MapsCollectablesEntity update(MapsCollectablesEntity entity) {
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
