package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.ClansBanksLogsEntity;
import com.kalaazu.persistence.repository.ClansBanksLogsRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * ClansBanksLogs service.
 * ==========================
 * <p>
 * Service for the ClansBanksLogs entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
@RequiredArgsConstructor
public class ClansBanksLogsServiceImpl implements ClansBanksLogsService {
    private final ClansBanksLogsRepository repository;

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
