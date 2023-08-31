package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.ModeratorsEntity;
import com.kalaazu.persistence.repository.ModeratorsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Moderators service.
 * ======================
 * <p>
 * Service for the Moderators entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
public class ModeratorsServiceImpl implements ModeratorsService {
    @Autowired
    private ModeratorsRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public ModeratorsEntity create(ModeratorsEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public ModeratorsEntity find(Byte id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<ModeratorsEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public ModeratorsEntity update(ModeratorsEntity entity) {
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
