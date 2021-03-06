package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.ModeratorsRolesPermissionsEntity;
import com.kalaazu.persistence.repository.ModeratorsRolesPermissionsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * ModeratorsRolesPermissions service.
 * ======================================
 *
 * Service for the ModeratorsRolesPermissions entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
public class ModeratorsRolesPermissionsServiceImpl implements ModeratorsRolesPermissionsService {
    @Autowired
    private ModeratorsRolesPermissionsRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public ModeratorsRolesPermissionsEntity create(ModeratorsRolesPermissionsEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public ModeratorsRolesPermissionsEntity find(Byte id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<ModeratorsRolesPermissionsEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public ModeratorsRolesPermissionsEntity update(ModeratorsRolesPermissionsEntity entity) {
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