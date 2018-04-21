package com.manulaiko.kalaazu.persistence.database.entities;

import com.manulaiko.kalaazu.math.Vector2;

import java.util.Date;
import java.util.Collection;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class ClansBattlestation {
    private int id;

    private Integer clansId;

    private int mapsId;

    private Vector2 position;

    private String name;

    private Date date;

    private Clan clansByClansId;

    private Map mapsByMapsId;

    private Collection<ClansBattlestationsItem> clansBattlestationsItemsById;

    private Collection<ClansBattlestationsLog> clansBattlestationsLogsById;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Integer getClansId() {
        return clansId;
    }

    public void setClansId(Integer clansId) {
        this.clansId = clansId;
    }

    public int getMapsId() {
        return mapsId;
    }

    public void setMapsId(int mapsId) {
        this.mapsId = mapsId;
    }

    public Vector2 getPosition() {
        return position;
    }

    public void setPosition(Vector2 position) {
        this.position = position;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

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

    public Clan getClansByClansId() {
        return clansByClansId;
    }

    public void setClansByClansId(Clan clansByClansId) {
        this.clansByClansId = clansByClansId;
    }

    public Map getMapsByMapsId() {
        return mapsByMapsId;
    }

    public void setMapsByMapsId(Map mapsByMapsId) {
        this.mapsByMapsId = mapsByMapsId;
    }

    public Collection<ClansBattlestationsItem> getClansBattlestationsItemsById() {
        return clansBattlestationsItemsById;
    }

    public void setClansBattlestationsItemsById(
            Collection<ClansBattlestationsItem> clansBattlestationsItemsById
    ) {
        this.clansBattlestationsItemsById = clansBattlestationsItemsById;
    }

    public Collection<ClansBattlestationsLog> getClansBattlestationsLogsById() {
        return clansBattlestationsLogsById;
    }

    public void setClansBattlestationsLogsById(
            Collection<ClansBattlestationsLog> clansBattlestationsLogsById
    ) {
        this.clansBattlestationsLogsById = clansBattlestationsLogsById;
    }
}
