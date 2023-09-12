package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.ItemCategory;
import com.kalaazu.persistence.entity.ItemType;
import com.kalaazu.persistence.entity.ItemsEntity;
import com.kalaazu.persistence.repository.ItemsRepository;
import lombok.RequiredArgsConstructor;
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
@RequiredArgsConstructor
public class ItemsServiceImpl implements ItemsService {
    private final ItemsRepository repository;

    @Override
    public List<ItemsEntity> findByCategoryAndType(ItemCategory category, ItemType type) {
        return this.repository.findAllByCategoryAndTypeAndSlotbarOrderNot(category, type, (short) -1);
    }

    @Override
    public ItemsEntity findByLootId(String lootId) {
        return this.repository.findByLootId(lootId);
    }

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
