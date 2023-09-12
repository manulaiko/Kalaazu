package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.RanksEntity;
import com.kalaazu.persistence.repository.RanksRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Ranks service.
 * =================
 * <p>
 * Service for the Ranks entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
@RequiredArgsConstructor
public class RanksServiceImpl implements RanksService {
    private final RanksRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public RanksEntity create(RanksEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public RanksEntity find(Byte id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<RanksEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public RanksEntity update(RanksEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public boolean delete(Byte id) {
        this.repository.deleteById(id);

        return !this.repository.existsById(id);
    }
}
