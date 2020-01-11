package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.TradeItemsEntity;
import com.kalaazu.persistence.repository.TradeItemsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * TradeItems service.
 * ======================
 *
 * Service for the TradeItems entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
public class TradeItemsServiceImpl implements TradeItemsService {
    @Autowired
    private TradeItemsRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public TradeItemsEntity create(TradeItemsEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public TradeItemsEntity find(Short id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<TradeItemsEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public TradeItemsEntity update(TradeItemsEntity entity) {
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