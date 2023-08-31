package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.InvitationCodesEntity;
import com.kalaazu.persistence.repository.InvitationCodesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * InvitationCodes service.
 * ===========================
 * <p>
 * Service for the InvitationCodes entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
public class InvitationCodesServiceImpl implements InvitationCodesService {
    @Autowired
    private InvitationCodesRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public InvitationCodesEntity create(InvitationCodesEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public InvitationCodesEntity find(Short id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<InvitationCodesEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public InvitationCodesEntity update(InvitationCodesEntity entity) {
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
