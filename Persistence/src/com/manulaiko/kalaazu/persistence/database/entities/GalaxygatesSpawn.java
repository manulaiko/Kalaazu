package com.manulaiko.kalaazu.persistence.database.entities;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "galaxygates_spawns", schema = "kalaazu")
public class GalaxygatesSpawn {
    private int id;

    private int npcsId;

    private int amount;

    private Npc npcsByNpcsId;

    private Collection<GalaxygatesStagesSpawn> galaxygatesStagesSpawnsById;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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
        GalaxygatesSpawn that = (GalaxygatesSpawn) o;
        return id == that.id &&
               npcsId == that.npcsId &&
               amount == that.amount;
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, npcsId, amount);
    }

    @ManyToOne
    @JoinColumn(name = "npcs_id", referencedColumnName = "id", nullable = false)
    public Npc getNpcsByNpcsId() {
        return npcsByNpcsId;
    }

    public void setNpcsByNpcsId(Npc npcsByNpcsId) {
        this.npcsByNpcsId = npcsByNpcsId;
    }

    @OneToMany(mappedBy = "galaxygatesSpawnsByGalaxygatesSpawnsId")
    public Collection<GalaxygatesStagesSpawn> getGalaxygatesStagesSpawnsById() {
        return galaxygatesStagesSpawnsById;
    }

    public void setGalaxygatesStagesSpawnsById(
            Collection<GalaxygatesStagesSpawn> galaxygatesStagesSpawnsById
    ) {
        this.galaxygatesStagesSpawnsById = galaxygatesStagesSpawnsById;
    }
}
