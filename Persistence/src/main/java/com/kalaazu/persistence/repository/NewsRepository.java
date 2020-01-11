package com.kalaazu.persistence.repository;

import com.kalaazu.persistence.entity.NewsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * News repository.
 * ================
 *
 * Repository for the News entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Repository
public interface NewsRepository extends JpaRepository<NewsEntity, Short> {
}
