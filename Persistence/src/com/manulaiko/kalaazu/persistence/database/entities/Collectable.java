package com.manulaiko.kalaazu.persistence.database.entities;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "collectables", schema = "kalaazu")
public class Collectable {
    private int id;

    private int gfx;

    private int type;

    private String name;

    private Collection<RewardsCollectable> rewardsCollectablesById;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "gfx")
    public int getGfx() {
        return gfx;
    }

    public void setGfx(int gfx) {
        this.gfx = gfx;
    }

    @Basic
    @Column(name = "type")
    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    @Basic
    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        Collectable that = (Collectable) o;
        return id == that.id &&
               gfx == that.gfx &&
               type == that.type &&
               Objects.equals(name, that.name);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, gfx, type, name);
    }

    @OneToMany(mappedBy = "collectablesByCollectablesId")
    public Collection<RewardsCollectable> getRewardsCollectablesById() {
        return rewardsCollectablesById;
    }

    public void setRewardsCollectablesById(
            Collection<RewardsCollectable> rewardsCollectablesById
    ) {
        this.rewardsCollectablesById = rewardsCollectablesById;
    }
}
