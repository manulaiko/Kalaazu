package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.KeyValueEntity;
import com.kalaazu.persistence.repository.KeyValueRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * KeyValue service.
 * ====================
 * <p>
 * Service for the KeyValue entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
public class KeyValueServiceImpl implements KeyValueService {
    @Autowired
    private KeyValueRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public KeyValueEntity create(KeyValueEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public KeyValueEntity find(Integer id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<KeyValueEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public KeyValueEntity update(KeyValueEntity entity) {
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
