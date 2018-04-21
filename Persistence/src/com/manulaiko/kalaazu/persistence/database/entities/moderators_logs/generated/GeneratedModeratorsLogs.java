package com.manulaiko.kalaazu.persistence.database.entities.moderators_logs.generated;

import com.manulaiko.kalaazu.persistence.database.entities.moderators.Moderators;
import com.manulaiko.kalaazu.persistence.database.entities.moderators_logs.ModeratorsLogs;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.runtime.config.identifier.ColumnIdentifier;
import com.speedment.runtime.config.identifier.TableIdentifier;
import com.speedment.runtime.core.manager.Manager;
import com.speedment.runtime.field.ComparableField;
import com.speedment.runtime.field.IntField;
import com.speedment.runtime.field.IntForeignKeyField;
import com.speedment.runtime.field.StringField;
import com.speedment.runtime.typemapper.TypeMapper;
import java.sql.Timestamp;

/**
 * The generated base for the {@link
 * com.manulaiko.kalaazu.persistence.database.entities.moderators_logs.ModeratorsLogs}-interface
 * representing entities of the {@code moderators_logs}-table in the database.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 * 
 * @author Speedment
 */
@GeneratedCode("Speedment")
public interface GeneratedModeratorsLogs {
    
    /**
     * This Field corresponds to the {@link ModeratorsLogs} field that can be
     * obtained using the {@link ModeratorsLogs#getId()} method.
     */
    IntField<ModeratorsLogs, Integer> ID = IntField.create(
        Identifier.ID,
        ModeratorsLogs::getId,
        ModeratorsLogs::setId,
        TypeMapper.primitive(),
        true
    );
    /**
     * This Field corresponds to the {@link ModeratorsLogs} field that can be
     * obtained using the {@link ModeratorsLogs#getModeratorsId()} method.
     */
    IntForeignKeyField<ModeratorsLogs, Integer, Moderators> MODERATORS_ID = IntForeignKeyField.create(
        Identifier.MODERATORS_ID,
        ModeratorsLogs::getModeratorsId,
        ModeratorsLogs::setModeratorsId,
        Moderators.ID,
        TypeMapper.primitive(),
        false
    );
    /**
     * This Field corresponds to the {@link ModeratorsLogs} field that can be
     * obtained using the {@link ModeratorsLogs#getDate()} method.
     */
    ComparableField<ModeratorsLogs, Timestamp, Timestamp> DATE = ComparableField.create(
        Identifier.DATE,
        ModeratorsLogs::getDate,
        ModeratorsLogs::setDate,
        TypeMapper.identity(),
        false
    );
    /**
     * This Field corresponds to the {@link ModeratorsLogs} field that can be
     * obtained using the {@link ModeratorsLogs#getType()} method.
     */
    StringField<ModeratorsLogs, String> TYPE = StringField.create(
        Identifier.TYPE,
        ModeratorsLogs::getType,
        ModeratorsLogs::setType,
        TypeMapper.identity(),
        false
    );
    /**
     * This Field corresponds to the {@link ModeratorsLogs} field that can be
     * obtained using the {@link ModeratorsLogs#getText()} method.
     */
    StringField<ModeratorsLogs, String> TEXT = StringField.create(
        Identifier.TEXT,
        ModeratorsLogs::getText,
        ModeratorsLogs::setText,
        TypeMapper.identity(),
        false
    );
    
    /**
     * Returns the id of this ModeratorsLogs. The id field corresponds to the
     * database column kalaazu.kalaazu.moderators_logs.id.
     * 
     * @return the id of this ModeratorsLogs
     */
    int getId();
    
    /**
     * Returns the moderatorsId of this ModeratorsLogs. The moderatorsId field
     * corresponds to the database column
     * kalaazu.kalaazu.moderators_logs.moderators_id.
     * 
     * @return the moderatorsId of this ModeratorsLogs
     */
    int getModeratorsId();
    
    /**
     * Returns the date of this ModeratorsLogs. The date field corresponds to
     * the database column kalaazu.kalaazu.moderators_logs.date.
     * 
     * @return the date of this ModeratorsLogs
     */
    Timestamp getDate();
    
    /**
     * Returns the type of this ModeratorsLogs. The type field corresponds to
     * the database column kalaazu.kalaazu.moderators_logs.type.
     * 
     * @return the type of this ModeratorsLogs
     */
    String getType();
    
    /**
     * Returns the text of this ModeratorsLogs. The text field corresponds to
     * the database column kalaazu.kalaazu.moderators_logs.text.
     * 
     * @return the text of this ModeratorsLogs
     */
    String getText();
    
    /**
     * Sets the id of this ModeratorsLogs. The id field corresponds to the
     * database column kalaazu.kalaazu.moderators_logs.id.
     * 
     * @param id to set of this ModeratorsLogs
     * @return   this ModeratorsLogs instance
     */
    ModeratorsLogs setId(int id);
    
    /**
     * Sets the moderatorsId of this ModeratorsLogs. The moderatorsId field
     * corresponds to the database column
     * kalaazu.kalaazu.moderators_logs.moderators_id.
     * 
     * @param moderatorsId to set of this ModeratorsLogs
     * @return             this ModeratorsLogs instance
     */
    ModeratorsLogs setModeratorsId(int moderatorsId);
    
    /**
     * Sets the date of this ModeratorsLogs. The date field corresponds to the
     * database column kalaazu.kalaazu.moderators_logs.date.
     * 
     * @param date to set of this ModeratorsLogs
     * @return     this ModeratorsLogs instance
     */
    ModeratorsLogs setDate(Timestamp date);
    
    /**
     * Sets the type of this ModeratorsLogs. The type field corresponds to the
     * database column kalaazu.kalaazu.moderators_logs.type.
     * 
     * @param type to set of this ModeratorsLogs
     * @return     this ModeratorsLogs instance
     */
    ModeratorsLogs setType(String type);
    
    /**
     * Sets the text of this ModeratorsLogs. The text field corresponds to the
     * database column kalaazu.kalaazu.moderators_logs.text.
     * 
     * @param text to set of this ModeratorsLogs
     * @return     this ModeratorsLogs instance
     */
    ModeratorsLogs setText(String text);
    
    /**
     * Queries the specified manager for the referenced Moderators. If no such
     * Moderators exists, an {@code NullPointerException} will be thrown.
     * 
     * @param foreignManager the manager to query for the entity
     * @return               the foreign entity referenced
     */
    Moderators findModeratorsId(Manager<Moderators> foreignManager);
    
    enum Identifier implements ColumnIdentifier<ModeratorsLogs> {
        
        ID            ("id"),
        MODERATORS_ID ("moderators_id"),
        DATE          ("date"),
        TYPE          ("type"),
        TEXT          ("text");
        
        private final String columnName;
        private final TableIdentifier<ModeratorsLogs> tableIdentifier;
        
        Identifier(String columnName) {
            this.columnName      = columnName;
            this.tableIdentifier = TableIdentifier.of(    getDbmsName(), 
                getSchemaName(), 
                getTableName());
        }
        
        @Override
        public String getDbmsName() {
            return "kalaazu";
        }
        
        @Override
        public String getSchemaName() {
            return "kalaazu";
        }
        
        @Override
        public String getTableName() {
            return "moderators_logs";
        }
        
        @Override
        public String getColumnName() {
            return this.columnName;
        }
        
        @Override
        public TableIdentifier<ModeratorsLogs> asTableIdentifier() {
            return this.tableIdentifier;
        }
    }
}