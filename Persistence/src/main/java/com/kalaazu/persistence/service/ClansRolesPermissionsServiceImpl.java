package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.ClansRolesPermissionsEntity;
import com.kalaazu.persistence.repository.ClansRolesPermissionsRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * ClansRolesPermissions service.
 * =================================
 * <p>
 * Service for the ClansRolesPermissions entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
@RequiredArgsConstructor
public class ClansRolesPermissionsServiceImpl implements ClansRolesPermissionsService {
    private final ClansRolesPermissionsRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public ClansRolesPermissionsEntity create(ClansRolesPermissionsEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public ClansRolesPermissionsEntity find(Integer id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<ClansRolesPermissionsEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public ClansRolesPermissionsEntity update(ClansRolesPermissionsEntity entity) {
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
