package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.SkilltreeLevelsEntity;
import com.kalaazu.persistence.repository.SkilltreeLevelsRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * SkilltreeLevels service.
 * ===========================
 * <p>
 * Service for the SkilltreeLevels entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
@RequiredArgsConstructor
public class SkilltreeLevelsServiceImpl implements SkilltreeLevelsService {
    private final SkilltreeLevelsRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public SkilltreeLevelsEntity create(SkilltreeLevelsEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public SkilltreeLevelsEntity find(Short id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<SkilltreeLevelsEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public SkilltreeLevelsEntity update(SkilltreeLevelsEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public boolean delete(Short id) {
        this.repository.deleteById(id);

        return !this.repository.existsById(id);
    }
}
