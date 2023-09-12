package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.ModeratorsRolesPermissionsEntity;
import com.kalaazu.persistence.repository.ModeratorsRolesPermissionsRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * ModeratorsRolesPermissions service.
 * ======================================
 * <p>
 * Service for the ModeratorsRolesPermissions entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
@RequiredArgsConstructor
public class ModeratorsRolesPermissionsServiceImpl implements ModeratorsRolesPermissionsService {
    private final ModeratorsRolesPermissionsRepository repository;

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
