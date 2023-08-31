package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.PermissionsEntity;
import com.kalaazu.persistence.repository.PermissionsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Permissions service.
 * =======================
 * <p>
 * Service for the Permissions entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
public class PermissionsServiceImpl implements PermissionsService {
    @Autowired
    private PermissionsRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public PermissionsEntity create(PermissionsEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public PermissionsEntity find(Byte id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<PermissionsEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public PermissionsEntity update(PermissionsEntity entity) {
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
