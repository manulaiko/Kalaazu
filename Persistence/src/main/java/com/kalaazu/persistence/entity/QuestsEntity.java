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

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "levels_id", referencedColumnName = "id", nullable = false)
    private LevelsEntity levelsByLevelsId;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "quests_id", referencedColumnName = "id")
    private QuestsEntity questsByQuestsId;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "factions_id", referencedColumnName = "id")
    private FactionsEntity factionsByFactionsId;

    @OneToMany(mappedBy = "questsByQuestsId", fetch = FetchType.EAGER)
    private Collection<QuestsConditionsEntity> questsConditions;

    @ManyToMany
    @JoinTable(
            name = "rewards_quests",
            joinColumns = @JoinColumn(name = "quests_id"),
            inverseJoinColumns = @JoinColumn(name = "rewards_id")
    )
    private Collection<RewardsEntity> rewards;
}
