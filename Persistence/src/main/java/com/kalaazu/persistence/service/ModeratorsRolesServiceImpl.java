package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.ModeratorsRolesEntity;
import com.kalaazu.persistence.repository.ModeratorsRolesRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * ModeratorsRoles service.
 * ===========================
 * <p>
 * Service for the ModeratorsRoles entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
@RequiredArgsConstructor
public class ModeratorsRolesServiceImpl implements ModeratorsRolesService {
    private final ModeratorsRolesRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public ModeratorsRolesEntity create(ModeratorsRolesEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public ModeratorsRolesEntity find(Byte id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<ModeratorsRolesEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public ModeratorsRolesEntity update(ModeratorsRolesEntity entity) {
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
