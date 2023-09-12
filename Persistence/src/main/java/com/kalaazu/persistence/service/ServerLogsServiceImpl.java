package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.ServerLogsEntity;
import com.kalaazu.persistence.repository.ServerLogsRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * ServerLogs service.
 * ======================
 * <p>
 * Service for the ServerLogs entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
@RequiredArgsConstructor
public class ServerLogsServiceImpl implements ServerLogsService {
    private final ServerLogsRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public ServerLogsEntity create(ServerLogsEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public ServerLogsEntity find(Integer id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<ServerLogsEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public ServerLogsEntity update(ServerLogsEntity entity) {
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
