package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "maps_portals", schema = "kalaazu", catalog = "")
public class MapsPortalsEntity {
    private byte       id;
    private byte       levelsId;
    private long       position;
    private long       targetPosition;
    private byte       isVisible;
    private byte       isWorking;
    private byte       gfx;
    private MapsEntity mapsByMapsId;
    private MapsEntity mapsByTargetMapsId;

    @Id
    @Column(name = "id", nullable = false)
    public byte getId() {
        return id;
    }

    public void setId(byte id) {
        this.id = id;
    }

    @Basic
    @Column(name = "levels_id", nullable = false)
    public byte getLevelsId() {
        return levelsId;
    }

    public void setLevelsId(byte levelsId) {
        this.levelsId = levelsId;
    }

    @Basic
    @Column(name = "position", nullable = false)
    public long getPosition() {
        return position;
    }

    public void setPosition(long position) {
        this.position = position;
    }

    @Basic
    @Column(name = "target_position", nullable = false)
    public long getTargetPosition() {
        return targetPosition;
    }

    public void setTargetPosition(long targetPosition) {
        this.targetPosition = targetPosition;
    }

    @Basic
    @Column(name = "is_visible", nullable = false)
    public byte getIsVisible() {
        return isVisible;
    }

    public void setIsVisible(byte isVisible) {
        this.isVisible = isVisible;
    }

    @Basic
    @Column(name = "is_working", nullable = false)
    public byte getIsWorking() {
        return isWorking;
    }

    public void setIsWorking(byte isWorking) {
        this.isWorking = isWorking;
    }

    @Basic
    @Column(name = "gfx", nullable = false)
    public byte getGfx() {
        return gfx;
    }

    public void setGfx(byte gfx) {
        this.gfx = gfx;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        MapsPortalsEntity that = (MapsPortalsEntity) o;
        return id == that.id &&
               levelsId == that.levelsId &&
               position == that.position &&
               targetPosition == that.targetPosition &&
               isVisible == that.isVisible &&
               isWorking == that.isWorking &&
               gfx == that.gfx;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, levelsId, position, targetPosition, isVisible, isWorking, gfx);
    }

    @ManyToOne
    @JoinColumn(name = "maps_id", referencedColumnName = "id", nullable = false)
    public MapsEntity getMapsByMapsId() {
        return mapsByMapsId;
    }

    public void setMapsByMapsId(MapsEntity mapsByMapsId) {
        this.mapsByMapsId = mapsByMapsId;
    }

    @ManyToOne
    @JoinColumn(name = "target_maps_id", referencedColumnName = "id", nullable = false)
    public MapsEntity getMapsByTargetMapsId() {
        return mapsByTargetMapsId;
    }

    public void setMapsByTargetMapsId(MapsEntity mapsByTargetMapsId) {
        this.mapsByTargetMapsId = mapsByTargetMapsId;
    }
}
