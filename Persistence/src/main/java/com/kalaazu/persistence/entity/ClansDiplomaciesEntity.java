package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Table(name = "clans_diplomacies", schema = "kalaazu", catalog = "")
public class ClansDiplomaciesEntity {
    private int         id;
    private Timestamp   date;
    private Timestamp   expires;
    private byte        status;
    private byte        type;
    private ClansEntity clansByFromClansId;
    private ClansEntity clansByToClansId;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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
    @Column(name = "expires", nullable = true)
    public Timestamp getExpires() {
        return expires;
    }

    public void setExpires(Timestamp expires) {
        this.expires = expires;
    }

    @Basic
    @Column(name = "status", nullable = false)
    public byte getStatus() {
        return status;
    }

    public void setStatus(byte status) {
        this.status = status;
    }

    @Basic
    @Column(name = "type", nullable = false)
    public byte getType() {
        return type;
    }

    public void setType(byte type) {
        this.type = type;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        ClansDiplomaciesEntity that = (ClansDiplomaciesEntity) o;
        return id == that.id &&
               status == that.status &&
               type == that.type &&
               Objects.equals(date, that.date) &&
               Objects.equals(expires, that.expires);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, date, expires, status, type);
    }

    @ManyToOne
    @JoinColumn(name = "from_clans_id", referencedColumnName = "id", nullable = false)
    public ClansEntity getClansByFromClansId() {
        return clansByFromClansId;
    }

    public void setClansByFromClansId(ClansEntity clansByFromClansId) {
        this.clansByFromClansId = clansByFromClansId;
    }

    @ManyToOne
    @JoinColumn(name = "to_clans_id", referencedColumnName = "id", nullable = false)
    public ClansEntity getClansByToClansId() {
        return clansByToClansId;
    }

    public void setClansByToClansId(ClansEntity clansByToClansId) {
        this.clansByToClansId = clansByToClansId;
    }
}
