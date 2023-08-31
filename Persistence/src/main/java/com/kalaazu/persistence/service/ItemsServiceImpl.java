package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.ItemsEntity;
import com.kalaazu.persistence.repository.ItemsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Items service.
 * =================
 * <p>
 * Service for the Items entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
public class ItemsServiceImpl implements ItemsService {
    @Autowired
    private ItemsRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public ItemsEntity create(ItemsEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public ItemsEntity find(Short id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<ItemsEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public ItemsEntity update(ItemsEntity entity) {
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
