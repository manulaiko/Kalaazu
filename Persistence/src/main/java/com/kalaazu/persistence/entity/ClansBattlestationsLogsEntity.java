package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Table(name = "clans_battlestations_logs", schema = "kalaazu", catalog = "")
public class ClansBattlestationsLogsEntity {
    private int                       id;
    private String                    message;
    private Timestamp                 date;
    private ClansEntity               clansByClansId;
    private ClansBattlestationsEntity clansBattlestationsByClansBattlestationsId;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "message", nullable = false, length = -1)
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    @Basic
    @Column(name = "date", nullable = false)
    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
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
        ClansBattlestationsLogsEntity that = (ClansBattlestationsLogsEntity) o;
        return id == that.id &&
               Objects.equals(message, that.message) &&
               Objects.equals(date, that.date);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, message, date);
    }

    @ManyToOne
    @JoinColumn(name = "clans_id", referencedColumnName = "id", nullable = false)
    public ClansEntity getClansByClansId() {
        return clansByClansId;
    }

    public void setClansByClansId(ClansEntity clansByClansId) {
        this.clansByClansId = clansByClansId;
    }

    @ManyToOne
    @JoinColumn(name = "clans_battlestations_id", referencedColumnName = "id", nullable = false)
    public ClansBattlestationsEntity getClansBattlestationsByClansBattlestationsId() {
        return clansBattlestationsByClansBattlestationsId;
    }

    public void setClansBattlestationsByClansBattlestationsId(
            ClansBattlestationsEntity clansBattlestationsByClansBattlestationsId
    ) {
        this.clansBattlestationsByClansBattlestationsId = clansBattlestationsByClansBattlestationsId;
    }
}
