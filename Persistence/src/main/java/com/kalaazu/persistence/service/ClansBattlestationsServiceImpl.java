package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.ClansBattlestationsEntity;
import com.kalaazu.persistence.repository.ClansBattlestationsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * ClansBattlestations service.
 * ===============================
 * <p>
 * Service for the ClansBattlestations entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
public class ClansBattlestationsServiceImpl implements ClansBattlestationsService {
    @Autowired
    private ClansBattlestationsRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public ClansBattlestationsEntity create(ClansBattlestationsEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public ClansBattlestationsEntity find(Integer id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<ClansBattlestationsEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public ClansBattlestationsEntity update(ClansBattlestationsEntity entity) {
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
