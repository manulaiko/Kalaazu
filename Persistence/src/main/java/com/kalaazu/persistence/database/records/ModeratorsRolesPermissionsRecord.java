/*
 * This file is generated by jOOQ.
 */
package com.kalaazu.persistence.database.records;


import com.kalaazu.persistence.database.tables.ModeratorsRolesPermissions;
import org.jooq.Field;
import org.jooq.Record1;
import org.jooq.Record4;
import org.jooq.Row4;
import org.jooq.impl.UpdatableRecordImpl;

import javax.annotation.processing.Generated;


/**
 * Moderator roles' permissions
 */
@Generated(
        value = {
                "http://www.jooq.org",
                "jOOQ version:3.12.1"
        },
        comments = "This class is generated by jOOQ"
)
@SuppressWarnings({"all", "unchecked", "rawtypes"})
public class ModeratorsRolesPermissionsRecord extends UpdatableRecordImpl<ModeratorsRolesPermissionsRecord> implements Record4<Byte, Byte, Byte, Byte> {

    private static final long serialVersionUID = -187806391;

    /**
     * Create a detached ModeratorsRolesPermissionsRecord
     */
    public ModeratorsRolesPermissionsRecord() {
        super(ModeratorsRolesPermissions.MODERATORS_ROLES_PERMISSIONS);
    }

    /**
     * Create a detached, initialised ModeratorsRolesPermissionsRecord
     */
    public ModeratorsRolesPermissionsRecord(Byte id, Byte moderatorsRolesId, Byte permissionsId, Byte isEnabled) {
        super(ModeratorsRolesPermissions.MODERATORS_ROLES_PERMISSIONS);

        set(0, id);
        set(1, moderatorsRolesId);
        set(2, permissionsId);
        set(3, isEnabled);
    }

    /**
     * Getter for <code>kalaazu.moderators_roles_permissions.id</code>. Primary Key.
     */
    public Byte getId() {
        return (Byte) get(0);
    }

    /**
     * Setter for <code>kalaazu.moderators_roles_permissions.id</code>. Primary Key.
     */
    public void setId(Byte value) {
        set(0, value);
    }

    /**
     * Getter for <code>kalaazu.moderators_roles_permissions.moderators_roles_id</code>.
     */
    public Byte getModeratorsRolesId() {
        return (Byte) get(1);
    }

    /**
     * Setter for <code>kalaazu.moderators_roles_permissions.moderators_roles_id</code>.
     */
    public void setModeratorsRolesId(Byte value) {
        set(1, value);
    }

    /**
     * Getter for <code>kalaazu.moderators_roles_permissions.permissions_id</code>.
     */
    public Byte getPermissionsId() {
        return (Byte) get(2);
    }

    /**
     * Setter for <code>kalaazu.moderators_roles_permissions.permissions_id</code>.
     */
    public void setPermissionsId(Byte value) {
        set(2, value);
    }

    // -------------------------------------------------------------------------
    // Primary key information
    // -------------------------------------------------------------------------

    /**
     * Getter for <code>kalaazu.moderators_roles_permissions.is_enabled</code>. Enabled value, null = inherited
     */
    public Byte getIsEnabled() {
        return (Byte) get(3);
    }

    // -------------------------------------------------------------------------
    // Record4 type implementation
    // -------------------------------------------------------------------------

    /**
     * Setter for <code>kalaazu.moderators_roles_permissions.is_enabled</code>. Enabled value, null = inherited
     */
    public void setIsEnabled(Byte value) {
        set(3, value);
    }

    @Override
    public Record1<Byte> key() {
        return (Record1) super.key();
    }

    @Override
    public Row4<Byte, Byte, Byte, Byte> fieldsRow() {
        return (Row4) super.fieldsRow();
    }

    @Override
    public Row4<Byte, Byte, Byte, Byte> valuesRow() {
        return (Row4) super.valuesRow();
    }

    @Override
    public Field<Byte> field1() {
        return ModeratorsRolesPermissions.MODERATORS_ROLES_PERMISSIONS.ID;
    }

    @Override
    public Field<Byte> field2() {
        return ModeratorsRolesPermissions.MODERATORS_ROLES_PERMISSIONS.MODERATORS_ROLES_ID;
    }

    @Override
    public Field<Byte> field3() {
        return ModeratorsRolesPermissions.MODERATORS_ROLES_PERMISSIONS.PERMISSIONS_ID;
    }

    @Override
    public Field<Byte> field4() {
        return ModeratorsRolesPermissions.MODERATORS_ROLES_PERMISSIONS.IS_ENABLED;
    }

    @Override
    public Byte component1() {
        return getId();
    }

    @Override
    public Byte component2() {
        return getModeratorsRolesId();
    }

    @Override
    public Byte component3() {
        return getPermissionsId();
    }

    @Override
    public Byte component4() {
        return getIsEnabled();
    }

    @Override
    public Byte value1() {
        return getId();
    }

    @Override
    public Byte value2() {
        return getModeratorsRolesId();
    }

    @Override
    public Byte value3() {
        return getPermissionsId();
    }

    @Override
    public Byte value4() {
        return getIsEnabled();
    }

    @Override
    public ModeratorsRolesPermissionsRecord value1(Byte value) {
        setId(value);
        return this;
    }

    @Override
    public ModeratorsRolesPermissionsRecord value2(Byte value) {
        setModeratorsRolesId(value);
        return this;
    }

    @Override
    public ModeratorsRolesPermissionsRecord value3(Byte value) {
        setPermissionsId(value);
        return this;
    }

    // -------------------------------------------------------------------------
    // Constructors
    // -------------------------------------------------------------------------

    @Override
    public ModeratorsRolesPermissionsRecord value4(Byte value) {
        setIsEnabled(value);
        return this;
    }

    @Override
    public ModeratorsRolesPermissionsRecord values(Byte value1, Byte value2, Byte value3, Byte value4) {
        value1(value1);
        value2(value2);
        value3(value3);
        value4(value4);
        return this;
    }
}
