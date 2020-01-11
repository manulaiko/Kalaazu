package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.QuestsEntity;
import com.kalaazu.persistence.repository.QuestsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Quests service.
 * ==================
 *
 * Service for the Quests entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
public class QuestsServiceImpl implements QuestsService {
    @Autowired
    private QuestsRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public QuestsEntity create(QuestsEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public QuestsEntity find(Short id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<QuestsEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public QuestsEntity update(QuestsEntity entity) {
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