package com.manulaiko.kalaazu.persistence.database.entities;


import java.util.Date;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class ClansDiplomacy {
    private int id;

    private int fromClansId;

    private int toClansId;

    private Date date;

    private Date expires;

    private int status;

    private int type;

    private Clan clansByFromClansId;

    private Clan clansByToClansId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getFromClansId() {
        return fromClansId;
    }

    public void setFromClansId(int fromClansId) {
        this.fromClansId = fromClansId;
    }

    public int getToClansId() {
        return toClansId;
    }

    public void setToClansId(int toClansId) {
        this.toClansId = toClansId;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Date getExpires() {
        return expires;
    }

    public void setExpires(Date expires) {
        this.expires = expires;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

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
        ClansDiplomacy that = (ClansDiplomacy) o;
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

    public Clan getClansByFromClansId() {
        return clansByFromClansId;
    }

    public void setClansByFromClansId(Clan clansByFromClansId) {
        this.clansByFromClansId = clansByFromClansId;
    }

    public Clan getClansByToClansId() {
        return clansByToClansId;
    }

    public void setClansByToClansId(Clan clansByToClansId) {
        this.clansByToClansId = clansByToClansId;
    }
}
