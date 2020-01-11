package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.NewsEntity;
import com.kalaazu.persistence.repository.NewsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * News service.
 * ================
 *
 * Service for the News entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
public class NewsServiceImpl implements NewsService {
    @Autowired
    private NewsRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public NewsEntity create(NewsEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public NewsEntity find(Short id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<NewsEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public NewsEntity update(NewsEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public boolean delete(Short id) {
        this.repository.deleteById(id);

        return !this.repository.existsById(id);
    }
}