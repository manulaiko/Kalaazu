package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.SkilltreeSkillsEntity;
import com.kalaazu.persistence.repository.SkilltreeSkillsRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * SkilltreeSkills service.
 * ===========================
 * <p>
 * Service for the SkilltreeSkills entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
@RequiredArgsConstructor
public class SkilltreeSkillsServiceImpl implements SkilltreeSkillsService {
    private final SkilltreeSkillsRepository repository;

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
    public SkilltreeSkillsEntity find(Byte id) {
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
    public boolean delete(Byte id) {
        this.repository.deleteById(id);

        return !this.repository.existsById(id);
    }
}
