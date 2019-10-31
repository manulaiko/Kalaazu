package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "galaxygates_waves", schema = "kalaazu", catalog = "")
public class GalaxygatesWavesEntity {
    private byte id;
    private byte seconds;
    private byte npcs;

    @Id
    @Column(name = "id", nullable = false)
    public byte getId() {
        return id;
    }

    public void setId(byte id) {
        this.id = id;
    }

    @Basic
    @Column(name = "seconds", nullable = false)
    public byte getSeconds() {
        return seconds;
    }

    public void setSeconds(byte seconds) {
        this.seconds = seconds;
    }

    @Basic
    @Column(name = "npcs", nullable = false)
    public byte getNpcs() {
        return npcs;
    }

    public void setNpcs(byte npcs) {
        this.npcs = npcs;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        GalaxygatesWavesEntity that = (GalaxygatesWavesEntity) o;
        return id == that.id &&
               seconds == that.seconds &&
               npcs == that.npcs;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, seconds, npcs);
    }
}
