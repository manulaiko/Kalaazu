package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.ServerLogsEntity;
import com.kalaazu.persistence.repository.ServerLogsRepository;
import org.springframework.beans.factory.annotation.Autowired;
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
public class ServerLogsServiceImpl implements ServerLogsService {
    @Autowired
    private ServerLogsRepository repository;

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
