package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "factions", schema = "kalaazu", catalog = "")
public class FactionsEntity {
    private byte   id;
    private String name;
    private String tag;
    private String description;
    private byte   isPublic;
    private long   lowMapsPosition;
    private long   highMapsPosition;

    @Id
    @Column(name = "id", nullable = false)
    public byte getId() {
        return id;
    }

    public void setId(byte id) {
        this.id = id;
    }

    @Basic
    @Column(name = "name", nullable = false, length = 255)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "tag", nullable = false, length = 3)
    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    @Basic
    @Column(name = "description", nullable = false, length = -1)
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Basic
    @Column(name = "is_public", nullable = false)
    public byte getIsPublic() {
        return isPublic;
    }

    public void setIsPublic(byte isPublic) {
        this.isPublic = isPublic;
    }

    @Basic
    @Column(name = "low_maps_position", nullable = false)
    public long getLowMapsPosition() {
        return lowMapsPosition;
    }

    public void setLowMapsPosition(long lowMapsPosition) {
        this.lowMapsPosition = lowMapsPosition;
    }

    @Basic
    @Column(name = "high_maps_position", nullable = false)
    public long getHighMapsPosition() {
        return highMapsPosition;
    }

    public void setHighMapsPosition(long highMapsPosition) {
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
        FactionsEntity that = (FactionsEntity) o;
        return id == that.id &&
               isPublic == that.isPublic &&
               lowMapsPosition == that.lowMapsPosition &&
               highMapsPosition == that.highMapsPosition &&
               Objects.equals(name, that.name) &&
               Objects.equals(tag, that.tag) &&
               Objects.equals(description, that.description);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, tag, description, isPublic, lowMapsPosition, highMapsPosition);
    }
}
