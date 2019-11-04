package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.ClansBanksLogsEntity;
import com.kalaazu.persistence.repository.ClansBanksLogsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * ClansBanksLogs service.
 * ==========================
 *
 * Service for the ClansBanksLogs entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
public class ClansBanksLogsServiceImpl implements ClansBanksLogsService {
    @Autowired
    private ClansBanksLogsRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public ClansBanksLogsEntity create(ClansBanksLogsEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public ClansBanksLogsEntity find(Integer id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<ClansBanksLogsEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public ClansBanksLogsEntity update(ClansBanksLogsEntity entity) {
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