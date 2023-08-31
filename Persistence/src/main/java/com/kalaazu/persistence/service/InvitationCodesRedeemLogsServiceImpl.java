package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.InvitationCodesRedeemLogsEntity;
import com.kalaazu.persistence.repository.InvitationCodesRedeemLogsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * InvitationCodesRedeemLogs service.
 * =====================================
 * <p>
 * Service for the InvitationCodesRedeemLogs entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
public class InvitationCodesRedeemLogsServiceImpl implements InvitationCodesRedeemLogsService {
    @Autowired
    private InvitationCodesRedeemLogsRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public InvitationCodesRedeemLogsEntity create(InvitationCodesRedeemLogsEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public InvitationCodesRedeemLogsEntity find(Integer id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<InvitationCodesRedeemLogsEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public InvitationCodesRedeemLogsEntity update(InvitationCodesRedeemLogsEntity entity) {
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
