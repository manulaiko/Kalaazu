package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.ClansMessagesEntity;
import com.kalaazu.persistence.repository.ClansMessagesRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * ClansMessages service.
 * =========================
 * <p>
 * Service for the ClansMessages entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
@RequiredArgsConstructor
public class ClansMessagesServiceImpl implements ClansMessagesService {
    private final ClansMessagesRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public ClansMessagesEntity create(ClansMessagesEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public ClansMessagesEntity find(Integer id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<ClansMessagesEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public ClansMessagesEntity update(ClansMessagesEntity entity) {
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
