package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.ModeratorsRolesEntity;
import com.kalaazu.persistence.repository.ModeratorsRolesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * ModeratorsRoles service.
 * ===========================
 *
 * Service for the ModeratorsRoles entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
public class ModeratorsRolesServiceImpl implements ModeratorsRolesService {
    @Autowired
    private ModeratorsRolesRepository repository;

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
    public ModeratorsRolesEntity find(Integer id) {
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
    public boolean delete(Integer id) {
        this.repository.deleteById(id);

        return !this.repository.existsById(id);
    }
}