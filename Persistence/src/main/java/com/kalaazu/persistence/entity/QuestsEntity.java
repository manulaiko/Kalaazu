package com.kalaazu.persistence.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.util.Collection;

/**
 * Quests entity.
 * ==============
 * <p>
 * Entity for the `quests` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "quests", schema = "kalaazu")
@Data
public class QuestsEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private short id;

    @Basic
    @Column(name = "name", nullable = false)
    private String name;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "levels_id", referencedColumnName = "id", nullable = false)
    private LevelsEntity levelsByLevelsId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "quests_id", referencedColumnName = "id")
    private QuestsEntity questsByQuestsId;

    @Basic
    @Column(name= "quests_id", insertable = false, updatable = false)
    private Short questsId = 0;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "factions_id", referencedColumnName = "id")
    private FactionsEntity factionsByFactionsId;

    @Basic
    @Column(name= "factions_id", insertable = false, updatable = false)
    private Byte factionsId = 0;

    @OneToMany(mappedBy = "questsByQuestsId", fetch = FetchType.LAZY)
    private Collection<QuestsConditionsEntity> questsConditions;

    @ManyToMany
    @JoinTable(
            name = "rewards_quests",
            joinColumns = @JoinColumn(name = "quests_id"),
            inverseJoinColumns = @JoinColumn(name = "rewards_id")
    )
    private Collection<RewardsEntity> rewards;
}
