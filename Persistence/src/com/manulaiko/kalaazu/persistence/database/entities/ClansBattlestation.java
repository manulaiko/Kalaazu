package com.manulaiko.kalaazu.persistence.database.entities;

import javax.persistence.*;
import java.util.Date;
import java.util.Collection;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "clans_battlestations", schema = "kalaazu")
public class ClansBattlestation {
    private int id;

    private Integer clansId;

    private int mapsId;

    private String name;

    private Date date;

    private Clan clansByClansId;

    private Map mapsByMapsId;

    private Collection<ClansBattlestationsItem> clansBattlestationsItemsById;

    private Collection<ClansBattlestationsLog> clansBattlestationsLogsById;

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
    public Integer getClansId() {
        return clansId;
    }

    public void setClansId(Integer clansId) {
        this.clansId = clansId;
    }

    @Basic
    @Column(name = "maps_id")
    public int getMapsId() {
        return mapsId;
    }

    public void setMapsId(int mapsId) {
        this.mapsId = mapsId;
    }

    @Basic
    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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
        ClansBattlestation that = (ClansBattlestation) o;
        return id == that.id &&
               mapsId == that.mapsId &&
               Objects.equals(clansId, that.clansId) &&
               Objects.equals(name, that.name) &&
               Objects.equals(date, that.date);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, clansId, mapsId, name, date);
    }

    @ManyToOne
    @JoinColumn(name = "clans_id", referencedColumnName = "id")
    public Clan getClansByClansId() {
        return clansByClansId;
    }

    public void setClansByClansId(Clan clansByClansId) {
        this.clansByClansId = clansByClansId;
    }

    @ManyToOne
    @JoinColumn(name = "maps_id", referencedColumnName = "id", nullable = false)
    public Map getMapsByMapsId() {
        return mapsByMapsId;
    }

    public void setMapsByMapsId(Map mapsByMapsId) {
        this.mapsByMapsId = mapsByMapsId;
    }

    @OneToMany(mappedBy = "clansBattlestationsByClansBattlestationsId")
    public Collection<ClansBattlestationsItem> getClansBattlestationsItemsById() {
        return clansBattlestationsItemsById;
    }

    public void setClansBattlestationsItemsById(
            Collection<ClansBattlestationsItem> clansBattlestationsItemsById
    ) {
        this.clansBattlestationsItemsById = clansBattlestationsItemsById;
    }

    @OneToMany(mappedBy = "clansBattlestationsByClansBattlestationsId")
    public Collection<ClansBattlestationsLog> getClansBattlestationsLogsById() {
        return clansBattlestationsLogsById;
    }

    public void setClansBattlestationsLogsById(
            Collection<ClansBattlestationsLog> clansBattlestationsLogsById
    ) {
        this.clansBattlestationsLogsById = clansBattlestationsLogsById;
    }
}
