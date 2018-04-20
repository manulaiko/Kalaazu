package com.manulaiko.kalaazu.persistence.database.entities;

import javax.persistence.*;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "maps_npcs", schema = "kalaazu")
public class MapsNpc {
    private int id;

    private int mapsId;

    private int npcsId;

    private int amount;

    private Map mapsByMapsId;

    private Npc npcsByNpcsId;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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
    @Column(name = "npcs_id")
    public int getNpcsId() {
        return npcsId;
    }

    public void setNpcsId(int npcsId) {
        this.npcsId = npcsId;
    }

    @Basic
    @Column(name = "amount")
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

    @ManyToOne
    @JoinColumn(name = "maps_id", referencedColumnName = "id", nullable = false)
    public Map getMapsByMapsId() {
        return mapsByMapsId;
    }

    public void setMapsByMapsId(Map mapsByMapsId) {
        this.mapsByMapsId = mapsByMapsId;
    }

    @ManyToOne
    @JoinColumn(name = "npcs_id", referencedColumnName = "id", nullable = false)
    public Npc getNpcsByNpcsId() {
        return npcsByNpcsId;
    }

    public void setNpcsByNpcsId(Npc npcsByNpcsId) {
        this.npcsByNpcsId = npcsByNpcsId;
    }
}
