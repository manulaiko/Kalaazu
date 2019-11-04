package com.kalaazu.persistence.service;

import com.kalaazu.persistence.entity.UsersEntity;
import com.kalaazu.persistence.repository.UsersRepository;
import com.kalaazu.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Users service.
 * =================
 *
 * Service for the Users entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Service
public class UsersServiceImpl implements UsersService {
    @Autowired
    private UsersRepository repository;

    /**
     * @inheritDoc
     */
    @Override
    public UsersEntity create(UsersEntity entity) {
        return this.repository.save(entity);
    }

    /**
     * @inheritDoc
     */
    @Override
    public UsersEntity find(Integer id) {
        return this.repository.findById(id).orElse(null);
    }

    /**
     * @inheritDoc
     */
    @Override
    public List<UsersEntity> findAll() {
        return this.repository.findAll();
    }

    /**
     * @inheritDoc
     */
    @Override
    public UsersEntity update(UsersEntity entity) {
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

    /**
     * @inheritDoc
     */
    @Override
    public UsersEntity login(String username, String password) {
        return this.repository.findByNameAndPassword(username, StringUtils.hash(password));
    }
}