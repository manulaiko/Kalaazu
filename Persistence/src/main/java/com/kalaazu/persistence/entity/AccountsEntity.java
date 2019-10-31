package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Table(name = "accounts", schema = "kalaazu", catalog = "")
public class AccountsEntity {
    private int       id;
    private String    sessionId;
    private String    name;
    private Timestamp banDate;
    private Timestamp premiumDate;
    private Timestamp date;
    private Timestamp lastLogin;
    private short     skillPointsTotal;
    private short     skillPointsFree;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "session_id", nullable = false, length = 32)
    public String getSessionId() {
        return sessionId;
    }

    public void setSessionId(String sessionId) {
        this.sessionId = sessionId;
    }

    @Basic
    @Column(name = "name", nullable = false, length = 255)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "ban_date", nullable = true)
    public Timestamp getBanDate() {
        return banDate;
    }

    public void setBanDate(Timestamp banDate) {
        this.banDate = banDate;
    }

    @Basic
    @Column(name = "premium_date", nullable = true)
    public Timestamp getPremiumDate() {
        return premiumDate;
    }

    public void setPremiumDate(Timestamp premiumDate) {
        this.premiumDate = premiumDate;
    }

    @Basic
    @Column(name = "date", nullable = false)
    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    @Basic
    @Column(name = "last_login", nullable = true)
    public Timestamp getLastLogin() {
        return lastLogin;
    }

    public void setLastLogin(Timestamp lastLogin) {
        this.lastLogin = lastLogin;
    }

    @Basic
    @Column(name = "skill_points_total", nullable = false)
    public short getSkillPointsTotal() {
        return skillPointsTotal;
    }

    public void setSkillPointsTotal(short skillPointsTotal) {
        this.skillPointsTotal = skillPointsTotal;
    }

    @Basic
    @Column(name = "skill_points_free", nullable = false)
    public short getSkillPointsFree() {
        return skillPointsFree;
    }

    public void setSkillPointsFree(short skillPointsFree) {
        this.skillPointsFree = skillPointsFree;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        AccountsEntity that = (AccountsEntity) o;
        return id == that.id &&
               skillPointsTotal == that.skillPointsTotal &&
               skillPointsFree == that.skillPointsFree &&
               Objects.equals(sessionId, that.sessionId) &&
               Objects.equals(name, that.name) &&
               Objects.equals(banDate, that.banDate) &&
               Objects.equals(premiumDate, that.premiumDate) &&
               Objects.equals(date, that.date) &&
               Objects.equals(lastLogin, that.lastLogin);
    }

    @Override
    public int hashCode() {
        return Objects.hash(
                id,
                sessionId,
                name,
                banDate,
                premiumDate,
                date,
                lastLogin,
                skillPointsTotal,
                skillPointsFree
        );
    }
}
