package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "maps_stations", schema = "kalaazu", catalog = "")
public class MapsStationsEntity {
    private byte           id;
    private long           position;
    private MapsEntity     mapsByMapsId;
    private FactionsEntity factionsByFactionsId;

    @Id
    @Column(name = "id", nullable = false)
    public byte getId() {
        return id;
    }

    public void setId(byte id) {
        this.id = id;
    }

    @Basic
    @Column(name = "position", nullable = false)
    public long getPosition() {
        return position;
    }

    public void setPosition(long position) {
        this.position = position;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        MapsStationsEntity that = (MapsStationsEntity) o;
        return id == that.id &&
               position == that.position;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, position);
    }

    @ManyToOne
    @JoinColumn(name = "maps_id", referencedColumnName = "id")
    public MapsEntity getMapsByMapsId() {
        return mapsByMapsId;
    }

    public void setMapsByMapsId(MapsEntity mapsByMapsId) {
        this.mapsByMapsId = mapsByMapsId;
    }

    @ManyToOne
    @JoinColumn(name = "factions_id", referencedColumnName = "id")
    public FactionsEntity getFactionsByFactionsId() {
        return factionsByFactionsId;
    }

    public void setFactionsByFactionsId(FactionsEntity factionsByFactionsId) {
        this.factionsByFactionsId = factionsByFactionsId;
    }
}
