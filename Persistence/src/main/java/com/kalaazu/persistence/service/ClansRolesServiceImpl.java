package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.ClansRolesEntity;
import com.kalaazu.persistence.repository.ClansRolesRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * ClansRoles service.
 * ======================
 * <p>
 * Service for the ClansRoles entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
@RequiredArgsConstructor
public class ClansRolesServiceImpl implements ClansRolesService {
    private final ClansRolesRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public ClansRolesEntity create(ClansRolesEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public ClansRolesEntity find(Integer id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<ClansRolesEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public ClansRolesEntity update(ClansRolesEntity entity) {
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
