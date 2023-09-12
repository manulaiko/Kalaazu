package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.ModeratorsLogsEntity;
import com.kalaazu.persistence.repository.ModeratorsLogsRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * ModeratorsLogs service.
 * ==========================
 * <p>
 * Service for the ModeratorsLogs entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
@RequiredArgsConstructor
public class ModeratorsLogsServiceImpl implements ModeratorsLogsService {
    private final ModeratorsLogsRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public ModeratorsLogsEntity create(ModeratorsLogsEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public ModeratorsLogsEntity find(Integer id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<ModeratorsLogsEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public ModeratorsLogsEntity update(ModeratorsLogsEntity entity) {
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
