package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.VouchersRedeemLogsEntity;
import com.kalaazu.persistence.repository.VouchersRedeemLogsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * VouchersRedeemLogs service.
 * ==============================
 *
 * Service for the VouchersRedeemLogs entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
public class VouchersRedeemLogsServiceImpl implements VouchersRedeemLogsService {
    @Autowired
    private VouchersRedeemLogsRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public VouchersRedeemLogsEntity create(VouchersRedeemLogsEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public VouchersRedeemLogsEntity find(Integer id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<VouchersRedeemLogsEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public VouchersRedeemLogsEntity update(VouchersRedeemLogsEntity entity) {
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