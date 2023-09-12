package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.ClansApplicationsEntity;
import com.kalaazu.persistence.repository.ClansApplicationsRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * ClansApplications service.
 * =============================
 * <p>
 * Service for the ClansApplications entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
@RequiredArgsConstructor
public class ClansApplicationsServiceImpl implements ClansApplicationsService {
    private final ClansApplicationsRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public ClansApplicationsEntity create(ClansApplicationsEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public ClansApplicationsEntity find(Integer id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<ClansApplicationsEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public ClansApplicationsEntity update(ClansApplicationsEntity entity) {
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
