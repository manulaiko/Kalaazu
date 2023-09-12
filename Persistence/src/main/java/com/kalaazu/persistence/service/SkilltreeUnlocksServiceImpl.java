package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.SkilltreeUnlocksEntity;
import com.kalaazu.persistence.repository.SkilltreeUnlocksRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * SkilltreeUnlocks service.
 * ============================
 * <p>
 * Service for the SkilltreeUnlocks entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
@RequiredArgsConstructor
public class SkilltreeUnlocksServiceImpl implements SkilltreeUnlocksService {
    private final SkilltreeUnlocksRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public SkilltreeUnlocksEntity create(SkilltreeUnlocksEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public SkilltreeUnlocksEntity find(Short id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<SkilltreeUnlocksEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public SkilltreeUnlocksEntity update(SkilltreeUnlocksEntity entity) {
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
