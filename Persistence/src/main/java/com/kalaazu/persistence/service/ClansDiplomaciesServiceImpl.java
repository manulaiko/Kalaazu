package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.ClansDiplomaciesEntity;
import com.kalaazu.persistence.repository.ClansDiplomaciesRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * ClansDiplomacies service.
 * ============================
 * <p>
 * Service for the ClansDiplomacies entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
@RequiredArgsConstructor
public class ClansDiplomaciesServiceImpl implements ClansDiplomaciesService {
    private final ClansDiplomaciesRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public ClansDiplomaciesEntity create(ClansDiplomaciesEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public ClansDiplomaciesEntity find(Integer id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<ClansDiplomaciesEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public ClansDiplomaciesEntity update(ClansDiplomaciesEntity entity) {
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
