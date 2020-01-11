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
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private byte id;

    @Basic
    @Column(name = "gfx", nullable = false)
    private byte gfx = 0;

    @Basic
    @Column(name = "type", nullable = false)
    @Enumerated(EnumType.ORDINAL)
    private CollectableType type = CollectableType.BOX;

    @Basic
    @Column(name = "name", nullable = false)
    private String name;

    @ManyToMany
    @JoinTable(
            name = "rewards_collectables",
            joinColumns = @JoinColumn(name = "collectables_id"),
            inverseJoinColumns = @JoinColumn(name = "rewards_id")
    )
    private Collection<RewardsEntity> rewards;
}
