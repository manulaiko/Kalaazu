/*
 * This file is generated by jOOQ.
 */
package com.kalaazu.persistence.database.records;


import com.kalaazu.persistence.database.tables.Accounts;
import org.jooq.Field;
import org.jooq.Record1;
import org.jooq.Record15;
import org.jooq.Row15;
import org.jooq.impl.UpdatableRecordImpl;

import javax.annotation.processing.Generated;
import java.sql.Timestamp;


/**
 * In game accounts.
 */
@Generated(
        value = {
                "http://www.jooq.org",
                "jOOQ version:3.12.1"
        },
        comments = "This class is generated by jOOQ"
)
@SuppressWarnings({"all", "unchecked", "rawtypes"})
public class AccountsRecord extends UpdatableRecordImpl<AccountsRecord> implements Record15<Integer, Integer, String, Byte, Byte, Integer, Integer, Byte, String, Timestamp, Timestamp, Timestamp, Timestamp, Short, Short> {

    private static final long serialVersionUID = -1445927484;

    /**
     * Create a detached AccountsRecord
     */
    public AccountsRecord() {
        super(Accounts.ACCOUNTS);
    }

    /**
     * Create a detached, initialised AccountsRecord
     */
    public AccountsRecord(
            Integer id, Integer usersId, String sessionId, Byte levelsId, Byte factionsId, Integer accountsHangarsId,
            Integer clansId, Byte ranksId, String name, Timestamp banDate, Timestamp premiumDate, Timestamp date,
            Timestamp lastLogin, Short skillPointsTotal, Short skillPointsFree
    ) {
        super(Accounts.ACCOUNTS);

        set(0, id);
        set(1, usersId);
        set(2, sessionId);
        set(3, levelsId);
        set(4, factionsId);
        set(5, accountsHangarsId);
        set(6, clansId);
        set(7, ranksId);
        set(8, name);
        set(9, banDate);
        set(10, premiumDate);
        set(11, date);
        set(12, lastLogin);
        set(13, skillPointsTotal);
        set(14, skillPointsFree);
    }

    /**
     * Getter for <code>kalaazu.accounts.id</code>. Primary Key.
     */
    public Integer getId() {
        return (Integer) get(0);
    }

    /**
     * Setter for <code>kalaazu.accounts.id</code>. Primary Key.
     */
    public void setId(Integer value) {
        set(0, value);
    }

    /**
     * Getter for <code>kalaazu.accounts.users_id</code>. Account's owner.
     */
    public Integer getUsersId() {
        return (Integer) get(1);
    }

    /**
     * Setter for <code>kalaazu.accounts.users_id</code>. Account's owner.
     */
    public void setUsersId(Integer value) {
        set(1, value);
    }

    /**
     * Getter for <code>kalaazu.accounts.session_id</code>. Session ID.
     */
    public String getSessionId() {
        return (String) get(2);
    }

    /**
     * Setter for <code>kalaazu.accounts.session_id</code>. Session ID.
     */
    public void setSessionId(String value) {
        set(2, value);
    }

    /**
     * Getter for <code>kalaazu.accounts.levels_id</code>. Current level.
     */
    public Byte getLevelsId() {
        return (Byte) get(3);
    }

    /**
     * Setter for <code>kalaazu.accounts.levels_id</code>. Current level.
     */
    public void setLevelsId(Byte value) {
        set(3, value);
    }

    /**
     * Getter for <code>kalaazu.accounts.factions_id</code>. Faction that the account belongs to.
     */
    public Byte getFactionsId() {
        return (Byte) get(4);
    }

    /**
     * Setter for <code>kalaazu.accounts.factions_id</code>. Faction that the account belongs to.
     */
    public void setFactionsId(Byte value) {
        set(4, value);
    }

    /**
     * Getter for <code>kalaazu.accounts.accounts_hangars_id</code>. Active hangar.
     */
    public Integer getAccountsHangarsId() {
        return (Integer) get(5);
    }

    /**
     * Setter for <code>kalaazu.accounts.accounts_hangars_id</code>. Active hangar.
     */
    public void setAccountsHangarsId(Integer value) {
        set(5, value);
    }

    /**
     * Getter for <code>kalaazu.accounts.clans_id</code>.
     */
    public Integer getClansId() {
        return (Integer) get(6);
    }

    /**
     * Setter for <code>kalaazu.accounts.clans_id</code>.
     */
    public void setClansId(Integer value) {
        set(6, value);
    }

    /**
     * Getter for <code>kalaazu.accounts.ranks_id</code>.
     */
    public Byte getRanksId() {
        return (Byte) get(7);
    }

    /**
     * Setter for <code>kalaazu.accounts.ranks_id</code>.
     */
    public void setRanksId(Byte value) {
        set(7, value);
    }

    /**
     * Getter for <code>kalaazu.accounts.name</code>. In game name.
     */
    public String getName() {
        return (String) get(8);
    }

    /**
     * Setter for <code>kalaazu.accounts.name</code>. In game name.
     */
    public void setName(String value) {
        set(8, value);
    }

    /**
     * Getter for <code>kalaazu.accounts.ban_date</code>. Ban expiration date.
     */
    public Timestamp getBanDate() {
        return (Timestamp) get(9);
    }

    /**
     * Setter for <code>kalaazu.accounts.ban_date</code>. Ban expiration date.
     */
    public void setBanDate(Timestamp value) {
        set(9, value);
    }

    /**
     * Getter for <code>kalaazu.accounts.premium_date</code>. Premium expiration date.
     */
    public Timestamp getPremiumDate() {
        return (Timestamp) get(10);
    }

    /**
     * Setter for <code>kalaazu.accounts.premium_date</code>. Premium expiration date.
     */
    public void setPremiumDate(Timestamp value) {
        set(10, value);
    }

    /**
     * Getter for <code>kalaazu.accounts.date</code>.
     */
    public Timestamp getDate() {
        return (Timestamp) get(11);
    }

    /**
     * Setter for <code>kalaazu.accounts.date</code>.
     */
    public void setDate(Timestamp value) {
        set(11, value);
    }

    /**
     * Getter for <code>kalaazu.accounts.last_login</code>. Last login date.
     */
    public Timestamp getLastLogin() {
        return (Timestamp) get(12);
    }

    /**
     * Setter for <code>kalaazu.accounts.last_login</code>. Last login date.
     */
    public void setLastLogin(Timestamp value) {
        set(12, value);
    }

    /**
     * Getter for <code>kalaazu.accounts.skill_points_total</code>. Total skill points available.
     */
    public Short getSkillPointsTotal() {
        return (Short) get(13);
    }

    /**
     * Setter for <code>kalaazu.accounts.skill_points_total</code>. Total skill points available.
     */
    public void setSkillPointsTotal(Short value) {
        set(13, value);
    }

    // -------------------------------------------------------------------------
    // Primary key information
    // -------------------------------------------------------------------------

    /**
     * Getter for <code>kalaazu.accounts.skill_points_free</code>. Free skill points available.
     */
    public Short getSkillPointsFree() {
        return (Short) get(14);
    }

    // -------------------------------------------------------------------------
    // Record15 type implementation
    // -------------------------------------------------------------------------

    /**
     * Setter for <code>kalaazu.accounts.skill_points_free</code>. Free skill points available.
     */
    public void setSkillPointsFree(Short value) {
        set(14, value);
    }

    @Override
    public Record1<Integer> key() {
        return (Record1) super.key();
    }

    @Override
    public Row15<Integer, Integer, String, Byte, Byte, Integer, Integer, Byte, String, Timestamp, Timestamp, Timestamp, Timestamp, Short, Short> fieldsRow() {
        return (Row15) super.fieldsRow();
    }

    @Override
    public Row15<Integer, Integer, String, Byte, Byte, Integer, Integer, Byte, String, Timestamp, Timestamp, Timestamp, Timestamp, Short, Short> valuesRow() {
        return (Row15) super.valuesRow();
    }

    @Override
    public Field<Integer> field1() {
        return Accounts.ACCOUNTS.ID;
    }

    @Override
    public Field<Integer> field2() {
        return Accounts.ACCOUNTS.USERS_ID;
    }

    @Override
    public Field<String> field3() {
        return Accounts.ACCOUNTS.SESSION_ID;
    }

    @Override
    public Field<Byte> field4() {
        return Accounts.ACCOUNTS.LEVELS_ID;
    }

    @Override
    public Field<Byte> field5() {
        return Accounts.ACCOUNTS.FACTIONS_ID;
    }

    @Override
    public Field<Integer> field6() {
        return Accounts.ACCOUNTS.ACCOUNTS_HANGARS_ID;
    }

    @Override
    public Field<Integer> field7() {
        return Accounts.ACCOUNTS.CLANS_ID;
    }

    @Override
    public Field<Byte> field8() {
        return Accounts.ACCOUNTS.RANKS_ID;
    }

    @Override
    public Field<String> field9() {
        return Accounts.ACCOUNTS.NAME;
    }

    @Override
    public Field<Timestamp> field10() {
        return Accounts.ACCOUNTS.BAN_DATE;
    }

    @Override
    public Field<Timestamp> field11() {
        return Accounts.ACCOUNTS.PREMIUM_DATE;
    }

    @Override
    public Field<Timestamp> field12() {
        return Accounts.ACCOUNTS.DATE;
    }

    @Override
    public Field<Timestamp> field13() {
        return Accounts.ACCOUNTS.LAST_LOGIN;
    }

    @Override
    public Field<Short> field14() {
        return Accounts.ACCOUNTS.SKILL_POINTS_TOTAL;
    }

    @Override
    public Field<Short> field15() {
        return Accounts.ACCOUNTS.SKILL_POINTS_FREE;
    }

    @Override
    public Integer component1() {
        return getId();
    }

    @Override
    public Integer component2() {
        return getUsersId();
    }

    @Override
    public String component3() {
        return getSessionId();
    }

    @Override
    public Byte component4() {
        return getLevelsId();
    }

    @Override
    public Byte component5() {
        return getFactionsId();
    }

    @Override
    public Integer component6() {
        return getAccountsHangarsId();
    }

    @Override
    public Integer component7() {
        return getClansId();
    }

    @Override
    public Byte component8() {
        return getRanksId();
    }

    @Override
    public String component9() {
        return getName();
    }

    @Override
    public Timestamp component10() {
        return getBanDate();
    }

    @Override
    public Timestamp component11() {
        return getPremiumDate();
    }

    @Override
    public Timestamp component12() {
        return getDate();
    }

    @Override
    public Timestamp component13() {
        return getLastLogin();
    }

    @Override
    public Short component14() {
        return getSkillPointsTotal();
    }

    @Override
    public Short component15() {
        return getSkillPointsFree();
    }

    @Override
    public Integer value1() {
        return getId();
    }

    @Override
    public Integer value2() {
        return getUsersId();
    }

    @Override
    public String value3() {
        return getSessionId();
    }

    @Override
    public Byte value4() {
        return getLevelsId();
    }

    @Override
    public Byte value5() {
        return getFactionsId();
    }

    @Override
    public Integer value6() {
        return getAccountsHangarsId();
    }

    @Override
    public Integer value7() {
        return getClansId();
    }

    @Override
    public Byte value8() {
        return getRanksId();
    }

    @Override
    public String value9() {
        return getName();
    }

    @Override
    public Timestamp value10() {
        return getBanDate();
    }

    @Override
    public Timestamp value11() {
        return getPremiumDate();
    }

    @Override
    public Timestamp value12() {
        return getDate();
    }

    @Override
    public Timestamp value13() {
        return getLastLogin();
    }

    @Override
    public Short value14() {
        return getSkillPointsTotal();
    }

    @Override
    public Short value15() {
        return getSkillPointsFree();
    }

    @Override
    public AccountsRecord value1(Integer value) {
        setId(value);
        return this;
    }

    @Override
    public AccountsRecord value2(Integer value) {
        setUsersId(value);
        return this;
    }

    @Override
    public AccountsRecord value3(String value) {
        setSessionId(value);
        return this;
    }

    @Override
    public AccountsRecord value4(Byte value) {
        setLevelsId(value);
        return this;
    }

    @Override
    public AccountsRecord value5(Byte value) {
        setFactionsId(value);
        return this;
    }

    @Override
    public AccountsRecord value6(Integer value) {
        setAccountsHangarsId(value);
        return this;
    }

    @Override
    public AccountsRecord value7(Integer value) {
        setClansId(value);
        return this;
    }

    @Override
    public AccountsRecord value8(Byte value) {
        setRanksId(value);
        return this;
    }

    @Override
    public AccountsRecord value9(String value) {
        setName(value);
        return this;
    }

    @Override
    public AccountsRecord value10(Timestamp value) {
        setBanDate(value);
        return this;
    }

    @Override
    public AccountsRecord value11(Timestamp value) {
        setPremiumDate(value);
        return this;
    }

    @Override
    public AccountsRecord value12(Timestamp value) {
        setDate(value);
        return this;
    }

    @Override
    public AccountsRecord value13(Timestamp value) {
        setLastLogin(value);
        return this;
    }

    @Override
    public AccountsRecord value14(Short value) {
        setSkillPointsTotal(value);
        return this;
    }

    // -------------------------------------------------------------------------
    // Constructors
    // -------------------------------------------------------------------------

    @Override
    public AccountsRecord value15(Short value) {
        setSkillPointsFree(value);
        return this;
    }

    @Override
    public AccountsRecord values(
            Integer value1, Integer value2, String value3, Byte value4, Byte value5, Integer value6, Integer value7,
            Byte value8, String value9, Timestamp value10, Timestamp value11, Timestamp value12, Timestamp value13,
            Short value14, Short value15
    ) {
        value1(value1);
        value2(value2);
        value3(value3);
        value4(value4);
        value5(value5);
        value6(value6);
        value7(value7);
        value8(value8);
        value9(value9);
        value10(value10);
        value11(value11);
        value12(value12);
        value13(value13);
        value14(value14);
        value15(value15);
        return this;
    }
}
