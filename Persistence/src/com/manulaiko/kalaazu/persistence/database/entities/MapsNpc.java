package com.manulaiko.kalaazu.persistence.database.entities;


import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class MapsNpc {
    private int id;

    private int mapsId;

    private int npcsId;

    private int amount;

    private Map mapsByMapsId;

    private Npc npcsByNpcsId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMapsId() {
        return mapsId;
    }

    public void setMapsId(int mapsId) {
        this.mapsId = mapsId;
    }

    public int getNpcsId() {
        return npcsId;
    }

    public void setNpcsId(int npcsId) {
        this.npcsId = npcsId;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        MapsNpc mapsNpc = (MapsNpc) o;
        return id == mapsNpc.id &&
               mapsId == mapsNpc.mapsId &&
               npcsId == mapsNpc.npcsId &&
               amount == mapsNpc.amount;
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, mapsId, npcsId, amount);
    }

    public Map getMapsByMapsId() {
        return mapsByMapsId;
    }

    public void setMapsByMapsId(Map mapsByMapsId) {
        this.mapsByMapsId = mapsByMapsId;
    }

    public Npc getNpcsByNpcsId() {
        return npcsByNpcsId;
    }

    public void setNpcsByNpcsId(Npc npcsByNpcsId) {
        this.npcsByNpcsId = npcsByNpcsId;
    }
}
