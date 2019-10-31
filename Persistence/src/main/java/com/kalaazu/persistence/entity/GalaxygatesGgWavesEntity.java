package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "galaxygates_gg_waves", schema = "kalaazu", catalog = "")
public class GalaxygatesGgWavesEntity {
    private short             id;
    private GalaxygatesEntity galaxygatesByGalaxygatesId;

    @Id
    @Column(name = "id", nullable = false)
    public short getId() {
        return id;
    }

    public void setId(short id) {
        this.id = id;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        GalaxygatesGgWavesEntity that = (GalaxygatesGgWavesEntity) o;
        return id == that.id;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

    @ManyToOne
    @JoinColumn(name = "galaxygates_id", referencedColumnName = "id", nullable = false)
    public GalaxygatesEntity getGalaxygatesByGalaxygatesId() {
        return galaxygatesByGalaxygatesId;
    }

    public void setGalaxygatesByGalaxygatesId(GalaxygatesEntity galaxygatesByGalaxygatesId) {
        this.galaxygatesByGalaxygatesId = galaxygatesByGalaxygatesId;
    }
}
