package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.ClansBattlestationsItemsEntity;
import com.kalaazu.persistence.repository.ClansBattlestationsItemsRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * ClansBattlestationsItems service.
 * ====================================
 * <p>
 * Service for the ClansBattlestationsItems entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
@RequiredArgsConstructor
public class ClansBattlestationsItemsServiceImpl implements ClansBattlestationsItemsService {
    private final ClansBattlestationsItemsRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public ClansBattlestationsItemsEntity create(ClansBattlestationsItemsEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public ClansBattlestationsItemsEntity find(Integer id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<ClansBattlestationsItemsEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public ClansBattlestationsItemsEntity update(ClansBattlestationsItemsEntity entity) {
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
