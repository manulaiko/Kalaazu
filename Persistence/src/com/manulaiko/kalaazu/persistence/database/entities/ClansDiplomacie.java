package com.manulaiko.kalaazu.persistence.database.entities;

import javax.persistence.*;
import java.util.Date;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "clans_diplomacies", schema = "kalaazu")
public class ClansDiplomacie {
    private int id;

    private int fromClansId;

    private int toClansId;

    private Date date;

    private Date expires;

    private int status;

    private int type;

    private Clan clansByFromClansId;

    private Clan clansByToClansId;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "from_clans_id")
    public int getFromClansId() {
        return fromClansId;
    }

    public void setFromClansId(int fromClansId) {
        this.fromClansId = fromClansId;
    }

    @Basic
    @Column(name = "to_clans_id")
    public int getToClansId() {
        return toClansId;
    }

    public void setToClansId(int toClansId) {
        this.toClansId = toClansId;
    }

    @Basic
    @Column(name = "date")
    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Basic
    @Column(name = "expires")
    public Date getExpires() {
        return expires;
    }

    public void setExpires(Date expires) {
        this.expires = expires;
    }

    @Basic
    @Column(name = "status")
    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Basic
    @Column(name = "type")
    public int getType() {
        return type;
    }

    public void setType(int type) {
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
        ClansDiplomacie that = (ClansDiplomacie) o;
        return id == that.id &&
               fromClansId == that.fromClansId &&
               toClansId == that.toClansId &&
               status == that.status &&
               type == that.type &&
               Objects.equals(date, that.date) &&
               Objects.equals(expires, that.expires);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, fromClansId, toClansId, date, expires, status, type);
    }

    @ManyToOne
    @JoinColumn(name = "from_clans_id", referencedColumnName = "id", nullable = false)
    public Clan getClansByFromClansId() {
        return clansByFromClansId;
    }

    public void setClansByFromClansId(Clan clansByFromClansId) {
        this.clansByFromClansId = clansByFromClansId;
    }

    @ManyToOne
    @JoinColumn(name = "to_clans_id", referencedColumnName = "id", nullable = false)
    public Clan getClansByToClansId() {
        return clansByToClansId;
    }

    public void setClansByToClansId(Clan clansByToClansId) {
        this.clansByToClansId = clansByToClansId;
    }
}
