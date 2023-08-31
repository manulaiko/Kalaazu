package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.EventsEntity;
import com.kalaazu.persistence.repository.EventsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Events service.
 * ==================
 * <p>
 * Service for the Events entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
public class EventsServiceImpl implements EventsService {
    @Autowired
    private EventsRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public EventsEntity create(EventsEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public EventsEntity find(Integer id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<EventsEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public EventsEntity update(EventsEntity entity) {
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
