package com.manulaiko.kalaazu.persistence.database.entities.news.generated;

import com.manulaiko.kalaazu.persistence.database.entities.news.News;
import com.manulaiko.kalaazu.persistence.database.entities.news.NewsManager;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.runtime.config.identifier.TableIdentifier;
import com.speedment.runtime.core.manager.AbstractManager;
import com.speedment.runtime.field.Field;
import java.util.stream.Stream;

/**
 * The generated base implementation for the manager of every {@link
 * com.manulaiko.kalaazu.persistence.database.entities.news.News} entity.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 * 
 * @author Speedment
 */
@GeneratedCode("Speedment")
public abstract class GeneratedNewsManagerImpl 
extends AbstractManager<News> 
implements GeneratedNewsManager {
    
    private final TableIdentifier<News> tableIdentifier;
    
    protected GeneratedNewsManagerImpl() {
        this.tableIdentifier = TableIdentifier.of("kalaazu", "kalaazu", "news");
    }
    
    @Override
    public TableIdentifier<News> getTableIdentifier() {
        return tableIdentifier;
    }
    
    @Override
    public Stream<Field<News>> fields() {
        return NewsManager.FIELDS.stream();
    }
    
    @Override
    public Stream<Field<News>> primaryKeyFields() {
        return Stream.of(
            News.ID
        );
    }
}