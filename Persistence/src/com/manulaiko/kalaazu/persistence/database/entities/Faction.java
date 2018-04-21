package com.manulaiko.kalaazu.persistence.database.entities;

import com.manulaiko.kalaazu.math.Vector2;

import java.util.Collection;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class Faction {
    private int id;

    private String name;

    private String tag;

    private String description;

    private boolean isPublic;

    private int lowMapsId;

    private Vector2 lowMapsPosition;

    private int highMapsId;

    private Vector2 highMapsPosition;

    private Collection<Account> accountsById;

    private Map mapsByLowMapsId;

    private Map mapsByHighMapsId;

    private Collection<Map> mapsById;

    private Collection<MapsStation> mapsStationsById;

    private Collection<Quest> questsById;

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

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isPublic() {
        return isPublic;
    }

    public void setPublic(boolean aPublic) {
        isPublic = aPublic;
    }

    public int getLowMapsId() {
        return lowMapsId;
    }

    public void setLowMapsId(int lowMapsId) {
        this.lowMapsId = lowMapsId;
    }

    public Vector2 getLowMapsPosition() {
        return lowMapsPosition;
    }

    public void setLowMapsPosition(Vector2 lowMapsPosition) {
        this.lowMapsPosition = lowMapsPosition;
    }

    public int getHighMapsId() {
        return highMapsId;
    }

    public void setHighMapsId(int highMapsId) {
        this.highMapsId = highMapsId;
    }

    public Vector2 getHighMapsPosition() {
        return highMapsPosition;
    }

    public void setHighMapsPosition(Vector2 highMapsPosition) {
        this.highMapsPosition = highMapsPosition;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        Faction faction = (Faction) o;
        return id == faction.id &&
               isPublic == faction.isPublic &&
               lowMapsId == faction.lowMapsId &&
               highMapsId == faction.highMapsId &&
               Objects.equals(name, faction.name) &&
               Objects.equals(tag, faction.tag) &&
               Objects.equals(description, faction.description);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, name, tag, description, isPublic, lowMapsId, highMapsId);
    }

    public Collection<Account> getAccountsById() {
        return accountsById;
    }

    public void setAccountsById(Collection<Account> accountsById) {
        this.accountsById = accountsById;
    }

    public Map getMapsByLowMapsId() {
        return mapsByLowMapsId;
    }

    public void setMapsByLowMapsId(Map mapsByLowMapsId) {
        this.mapsByLowMapsId = mapsByLowMapsId;
    }

    public Map getMapsByHighMapsId() {
        return mapsByHighMapsId;
    }

    public void setMapsByHighMapsId(Map mapsByHighMapsId) {
        this.mapsByHighMapsId = mapsByHighMapsId;
    }

    public Collection<Map> getMapsById() {
        return mapsById;
    }

    public void setMapsById(Collection<Map> mapsById) {
        this.mapsById = mapsById;
    }

    public Collection<MapsStation> getMapsStationsById() {
        return mapsStationsById;
    }

    public void setMapsStationsById(
            Collection<MapsStation> mapsStationsById
    ) {
        this.mapsStationsById = mapsStationsById;
    }

    public Collection<Quest> getQuestsById() {
        return questsById;
    }

    public void setQuestsById(Collection<Quest> questsById) {
        this.questsById = questsById;
    }
}
