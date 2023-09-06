package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.ItemCategory;
import com.kalaazu.persistence.entity.ItemType;
import com.kalaazu.persistence.entity.ItemsEntity;

import java.util.List;

/**
 * Items service.
 * =================
 * <p>
 * Service for the Items entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface ItemsService extends IService<ItemsEntity, Short> {
    List<ItemsEntity> findByCategoryAndType(ItemCategory category, ItemType type);
}
