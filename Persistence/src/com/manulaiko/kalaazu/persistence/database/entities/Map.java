package com.manulaiko.kalaazu.persistence.database.entities;

import com.manulaiko.kalaazu.math.Vector2;

import java.util.Collection;
import java.util.Objects;

/**
 * Map entity.
 * ===========
 *
 * Represents a row from the `maps` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class Map implements Entity {
    private int     id;

    private String  name;

    private Integer factionsId;

    private Vector2 limits;

    private boolean isPvp;

    private boolean isStarter;

    private Collection<AccountsShip>       accountsShipsById;

    private Collection<ClansBattlestation> clansBattlestationsById;

    private Collection<Faction>            factionsById;

    private Collection<Faction>            factionsById_0;

    private Collection<GalaxygatesWave>    galaxygatesWavesById;

    private Faction                        factionsByFactionsId;

    private Collection<MapsNpc>            mapsNpcsById;

    private Collection<MapsPortal>         mapsPortalsById;

    private Collection<MapsPortal>         mapsPortalsById_0;

    private Collection<MapsStation>        mapsStationsById;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getFactionsId() {
        return factionsId;
    }

    public void setFactionsId(Integer factionsId) {
        this.factionsId = factionsId;
    }

    public Vector2 getLimits() {
        return limits;
    }

    public void setLimits(Vector2 limits) {
        this.limits = limits;
    }

    public boolean isPvp() {
        return isPvp;
    }

    public void setPvp(boolean pvp) {
        isPvp = pvp;
    }

    public boolean isStarter() {
        return isStarter;
    }

    public void setStarter(boolean starter) {
        isStarter = starter;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        Map map = (Map) o;
        return id == map.id &&
               isPvp == map.isPvp &&
               isStarter == map.isStarter &&
               Objects.equals(name, map.name) &&
               Objects.equals(factionsId, map.factionsId);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, name, factionsId, isPvp, isStarter);
    }

    public Collection<AccountsShip> getAccountsShipsById() {
        return accountsShipsById;
    }

    public void setAccountsShipsById(
            Collection<AccountsShip> accountsShipsById
    ) {
        this.accountsShipsById = accountsShipsById;
    }

    public Collection<ClansBattlestation> getClansBattlestationsById() {
        return clansBattlestationsById;
    }

    public void setClansBattlestationsById(
            Collection<ClansBattlestation> clansBattlestationsById
    ) {
        this.clansBattlestationsById = clansBattlestationsById;
    }

    public Collection<Faction> getFactionsById() {
        return factionsById;
    }

    public void setFactionsById(Collection<Faction> factionsById) {
        this.factionsById = factionsById;
    }

    public Collection<Faction> getFactionsById_0() {
        return factionsById_0;
    }

    public void setFactionsById_0(
            Collection<Faction> factionsById_0
    ) {
        this.factionsById_0 = factionsById_0;
    }

    public Collection<GalaxygatesWave> getGalaxygatesWavesById() {
        return galaxygatesWavesById;
    }

    public void setGalaxygatesWavesById(
            Collection<GalaxygatesWave> galaxygatesWavesById
    ) {
        this.galaxygatesWavesById = galaxygatesWavesById;
    }

    public Faction getFactionsByFactionsId() {
        return factionsByFactionsId;
    }

    public void setFactionsByFactionsId(Faction factionsByFactionsId) {
        this.factionsByFactionsId = factionsByFactionsId;
    }

    public Collection<MapsNpc> getMapsNpcsById() {
        return mapsNpcsById;
    }

    public void setMapsNpcsById(Collection<MapsNpc> mapsNpcsById) {
        this.mapsNpcsById = mapsNpcsById;
    }

    public Collection<MapsPortal> getMapsPortalsById() {
        return mapsPortalsById;
    }

    public void setMapsPortalsById(
            Collection<MapsPortal> mapsPortalsById
    ) {
        this.mapsPortalsById = mapsPortalsById;
    }

    public Collection<MapsPortal> getMapsPortalsById_0() {
        return mapsPortalsById_0;
    }

    public void setMapsPortalsById_0(
            Collection<MapsPortal> mapsPortalsById_0
    ) {
        this.mapsPortalsById_0 = mapsPortalsById_0;
    }

    public Collection<MapsStation> getMapsStationsById() {
        return mapsStationsById;
    }

    public void setMapsStationsById(
            Collection<MapsStation> mapsStationsById
    ) {
        this.mapsStationsById = mapsStationsById;
    }
}