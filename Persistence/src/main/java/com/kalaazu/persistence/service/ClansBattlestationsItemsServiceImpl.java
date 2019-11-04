package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.ClansBattlestationsItemsEntity;
import com.kalaazu.persistence.repository.ClansBattlestationsItemsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * ClansBattlestationsItems service.
 * ====================================
 *
 * Service for the ClansBattlestationsItems entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
public class ClansBattlestationsItemsServiceImpl implements ClansBattlestationsItemsService {
    @Autowired
    private ClansBattlestationsItemsRepository repository;

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