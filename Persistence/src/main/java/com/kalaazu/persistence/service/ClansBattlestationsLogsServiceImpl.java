package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.ClansBattlestationsLogsEntity;
import com.kalaazu.persistence.repository.ClansBattlestationsLogsRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * ClansBattlestationsLogs service.
 * ===================================
 * <p>
 * Service for the ClansBattlestationsLogs entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
@RequiredArgsConstructor
public class ClansBattlestationsLogsServiceImpl implements ClansBattlestationsLogsService {

    private final ClansBattlestationsLogsRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public ClansBattlestationsLogsEntity create(ClansBattlestationsLogsEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public ClansBattlestationsLogsEntity find(Integer id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<ClansBattlestationsLogsEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public ClansBattlestationsLogsEntity update(ClansBattlestationsLogsEntity entity) {
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
