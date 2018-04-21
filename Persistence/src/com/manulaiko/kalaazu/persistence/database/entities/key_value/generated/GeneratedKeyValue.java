package com.manulaiko.kalaazu.persistence.database.entities.key_value.generated;

import com.manulaiko.kalaazu.persistence.database.entities.key_value.KeyValue;
import com.speedment.common.annotation.GeneratedCode;
import com.speedment.runtime.config.identifier.ColumnIdentifier;
import com.speedment.runtime.config.identifier.TableIdentifier;
import com.speedment.runtime.field.StringField;
import com.speedment.runtime.typemapper.TypeMapper;

/**
 * The generated base for the {@link
 * com.manulaiko.kalaazu.persistence.database.entities.key_value.KeyValue}-interface
 * representing entities of the {@code key_value}-table in the database.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 * 
 * @author Speedment
 */
@GeneratedCode("Speedment")
public interface GeneratedKeyValue {
    
    /**
     * This Field corresponds to the {@link KeyValue} field that can be obtained
     * using the {@link KeyValue#getKey()} method.
     */
    StringField<KeyValue, String> KEY = StringField.create(
        Identifier.KEY,
        KeyValue::getKey,
        KeyValue::setKey,
        TypeMapper.identity(),
        true
    );
    /**
     * This Field corresponds to the {@link KeyValue} field that can be obtained
     * using the {@link KeyValue#getValue()} method.
     */
    StringField<KeyValue, String> VALUE = StringField.create(
        Identifier.VALUE,
        KeyValue::getValue,
        KeyValue::setValue,
        TypeMapper.identity(),
        false
    );
    
    /**
     * Returns the key of this KeyValue. The key field corresponds to the
     * database column kalaazu.kalaazu.key_value.key.
     * 
     * @return the key of this KeyValue
     */
    String getKey();
    
    /**
     * Returns the value of this KeyValue. The value field corresponds to the
     * database column kalaazu.kalaazu.key_value.value.
     * 
     * @return the value of this KeyValue
     */
    String getValue();
    
    /**
     * Sets the key of this KeyValue. The key field corresponds to the database
     * column kalaazu.kalaazu.key_value.key.
     * 
     * @param key to set of this KeyValue
     * @return    this KeyValue instance
     */
    KeyValue setKey(String key);
    
    /**
     * Sets the value of this KeyValue. The value field corresponds to the
     * database column kalaazu.kalaazu.key_value.value.
     * 
     * @param value to set of this KeyValue
     * @return      this KeyValue instance
     */
    KeyValue setValue(String value);
    
    enum Identifier implements ColumnIdentifier<KeyValue> {
        
        KEY   ("key"),
        VALUE ("value");
        
        private final String columnName;
        private final TableIdentifier<KeyValue> tableIdentifier;
        
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
            return "key_value";
        }
        
        @Override
        public String getColumnName() {
            return this.columnName;
        }
        
        @Override
        public TableIdentifier<KeyValue> asTableIdentifier() {
            return this.tableIdentifier;
        }
    }
}