package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.CollectablesEntity;
import com.kalaazu.persistence.repository.CollectablesRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Collectables service.
 * ========================
 * <p>
 * Service for the Collectables entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
@RequiredArgsConstructor
public class CollectablesServiceImpl implements CollectablesService {
    private final CollectablesRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public CollectablesEntity create(CollectablesEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public CollectablesEntity find(Integer id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<CollectablesEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public CollectablesEntity update(CollectablesEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public boolean delete(Integer id) {
        this.repository.deleteById(id);

        return !this.repository.existsById(id);
    }
}
