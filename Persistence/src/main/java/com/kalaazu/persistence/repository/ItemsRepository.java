package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.ItemCategory;
import com.kalaazu.persistence.entity.ItemType;
import com.kalaazu.persistence.entity.ItemsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Items repository.
 * =================
 * <p>
 * Repository for the Items entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface ItemsRepository extends JpaRepository<ItemsEntity, Short> {
    List<ItemsEntity> findAllByCategoryAndTypeAndSlotbarOrderNot(ItemCategory category, ItemType type, short slotbarOrder);
    ItemsEntity findByLootId(String lootId);
}
