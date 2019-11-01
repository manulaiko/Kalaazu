package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.Collection;

/**
 * Quests entity.
 * ==============
 *
 * Entity for the `quests` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "quests", schema = "kalaazu")
@Data
public class QuestsEntity {
    @Id
    @Column(name = "id", nullable = false)
    private short id;

    @Basic
    @Column(name = "name", nullable = false)
    private String name;

    @ManyToOne
    @JoinColumn(name = "levels_id", referencedColumnName = "id", nullable = false)
    private LevelsEntity levelsByLevelsId;

    @ManyToOne
    @JoinColumn(name = "quests_id", referencedColumnName = "id")
    private QuestsEntity questsByQuestsId;

    @ManyToOne
    @JoinColumn(name = "factions_id", referencedColumnName = "id")
    private FactionsEntity factionsByFactionsId;

    @OneToMany(mappedBy = "questsByQuestsId")
    private Collection<QuestsConditionsEntity> questsConditions;

    @OneToMany(mappedBy = "questsByQuestsId")
    private Collection<RewardsQuestsEntity> rewardsQuests;
}
