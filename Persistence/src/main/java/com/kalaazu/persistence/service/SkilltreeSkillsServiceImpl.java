package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.SkilltreeSkillsEntity;
import com.kalaazu.persistence.repository.SkilltreeSkillsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * SkilltreeSkills service.
 * ===========================
 *
 * Service for the SkilltreeSkills entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
public class SkilltreeSkillsServiceImpl implements SkilltreeSkillsService {
    @Autowired
    private SkilltreeSkillsRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public SkilltreeSkillsEntity create(SkilltreeSkillsEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public SkilltreeSkillsEntity find(Integer id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<SkilltreeSkillsEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public SkilltreeSkillsEntity update(SkilltreeSkillsEntity entity) {
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