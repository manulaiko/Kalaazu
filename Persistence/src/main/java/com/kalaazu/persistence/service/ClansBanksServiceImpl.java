package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.ClansBanksEntity;
import com.kalaazu.persistence.repository.ClansBanksRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * ClansBanks service.
 * ======================
 * <p>
 * Service for the ClansBanks entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
public class ClansBanksServiceImpl implements ClansBanksService {
    @Autowired
    private ClansBanksRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public ClansBanksEntity create(ClansBanksEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public ClansBanksEntity find(Integer id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<ClansBanksEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public ClansBanksEntity update(ClansBanksEntity entity) {
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
