package com.manulaiko.kalaazu.persistence.database.entities;

import javax.persistence.*;
import java.util.Date;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "clans_battlestations_logs", schema = "kalaazu")
public class ClansBattlestationsLog {
    private int id;

    private int clansId;

    private int clansBattlestationsId;

    private String message;

    private Date date;

    private Clan clansByClansId;

    private ClansBattlestation clansBattlestationsByClansBattlestationsId;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "clans_id")
    public int getClansId() {
        return clansId;
    }

    public void setClansId(int clansId) {
        this.clansId = clansId;
    }

    @Basic
    @Column(name = "clans_battlestations_id")
    public int getClansBattlestationsId() {
        return clansBattlestationsId;
    }

    public void setClansBattlestationsId(int clansBattlestationsId) {
        this.clansBattlestationsId = clansBattlestationsId;
    }

    @Basic
    @Column(name = "message")
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    @Basic
    @Column(name = "date")
    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        ClansBattlestationsLog that = (ClansBattlestationsLog) o;
        return id == that.id &&
               clansId == that.clansId &&
               clansBattlestationsId == that.clansBattlestationsId &&
               Objects.equals(message, that.message) &&
               Objects.equals(date, that.date);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, clansId, clansBattlestationsId, message, date);
    }

    @ManyToOne
    @JoinColumn(name = "clans_id", referencedColumnName = "id", nullable = false)
    public Clan getClansByClansId() {
        return clansByClansId;
    }

    public void setClansByClansId(Clan clansByClansId) {
        this.clansByClansId = clansByClansId;
    }

    @ManyToOne
    @JoinColumn(name = "clans_battlestations_id", referencedColumnName = "id", nullable = false)
    public ClansBattlestation getClansBattlestationsByClansBattlestationsId() {
        return clansBattlestationsByClansBattlestationsId;
    }

    public void setClansBattlestationsByClansBattlestationsId(
            ClansBattlestation clansBattlestationsByClansBattlestationsId
    ) {
        this.clansBattlestationsByClansBattlestationsId = clansBattlestationsByClansBattlestationsId;
    }
}
