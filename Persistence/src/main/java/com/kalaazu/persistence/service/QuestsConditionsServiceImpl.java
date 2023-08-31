package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.QuestsConditionsEntity;
import com.kalaazu.persistence.repository.QuestsConditionsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * QuestsConditions service.
 * ============================
 * <p>
 * Service for the QuestsConditions entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
public class QuestsConditionsServiceImpl implements QuestsConditionsService {
    @Autowired
    private QuestsConditionsRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public QuestsConditionsEntity create(QuestsConditionsEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public QuestsConditionsEntity find(Integer id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<QuestsConditionsEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public QuestsConditionsEntity update(QuestsConditionsEntity entity) {
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
