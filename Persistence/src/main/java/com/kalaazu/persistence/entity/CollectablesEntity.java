package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.Collection;

/**
 * Collectables entity.
 * ====================
 *
 * Entity for the `collectables` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "collectables", schema = "kalaazu")
@Data
public class CollectablesEntity {
    @Id
    @Column(name = "id", nullable = false)
    private byte id;

    @Basic
    @Column(name = "gfx", nullable = false)
    private byte gfx;

    @Basic
    @Column(name = "type", nullable = false)
    private byte type;

    @Basic
    @Column(name = "name", nullable = false)
    private String name;

    @OneToMany(mappedBy = "collectablesByCollectablesId")
    private Collection<RewardsCollectablesEntity> rewardsCollectables;
}
