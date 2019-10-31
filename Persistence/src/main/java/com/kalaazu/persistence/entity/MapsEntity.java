package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "maps", schema = "kalaazu", catalog = "")
public class MapsEntity {
    private byte           id;
    private String         name;
    private byte           isPvp;
    private byte           isStarter;
    private long           limits;
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
    @Column(name = "name", nullable = false, length = 255)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "is_pvp", nullable = false)
    public byte getIsPvp() {
        return isPvp;
    }

    public void setIsPvp(byte isPvp) {
        this.isPvp = isPvp;
    }

    @Basic
    @Column(name = "is_starter", nullable = false)
    public byte getIsStarter() {
        return isStarter;
    }

    public void setIsStarter(byte isStarter) {
        this.isStarter = isStarter;
    }

    @Basic
    @Column(name = "limits", nullable = false)
    public long getLimits() {
        return limits;
    }

    public void setLimits(long limits) {
        this.limits = limits;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        MapsEntity that = (MapsEntity) o;
        return id == that.id &&
               isPvp == that.isPvp &&
               isStarter == that.isStarter &&
               limits == that.limits &&
               Objects.equals(name, that.name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, isPvp, isStarter, limits);
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
