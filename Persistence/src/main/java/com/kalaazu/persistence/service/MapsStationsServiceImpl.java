package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.MapsStationsEntity;
import com.kalaazu.persistence.repository.MapsStationsRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * MapsStations service.
 * ========================
 * <p>
 * Service for the MapsStations entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
@RequiredArgsConstructor
public class MapsStationsServiceImpl implements MapsStationsService {
    private final MapsStationsRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public MapsStationsEntity create(MapsStationsEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public MapsStationsEntity find(Byte id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<MapsStationsEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public MapsStationsEntity update(MapsStationsEntity entity) {
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
