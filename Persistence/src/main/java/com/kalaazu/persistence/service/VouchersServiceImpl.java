package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.VouchersEntity;
import com.kalaazu.persistence.repository.VouchersRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Vouchers service.
 * ====================
 * <p>
 * Service for the Vouchers entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
@RequiredArgsConstructor
public class VouchersServiceImpl implements VouchersService {
    private final VouchersRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public VouchersEntity create(VouchersEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public VouchersEntity find(Short id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<VouchersEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public VouchersEntity update(VouchersEntity entity) {
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
