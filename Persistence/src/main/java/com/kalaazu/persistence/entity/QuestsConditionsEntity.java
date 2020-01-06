package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;

/**
 * Quests conditions entity.
 * =========================
 *
 * Entity for the `quests_conditions` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "quests_conditions", schema = "kalaazu")
@Data
public class QuestsConditionsEntity {
    @Id
    @Column(name = "id", nullable = false)
    private int id;

    @Basic
    @Column(name = "type", nullable = false)
    private byte type;

    @Basic
    @Column(name = "value", nullable = false)
    private String value;

    @ManyToOne
    @JoinColumn(name = "quests_conditions_id", referencedColumnName = "id")
    private QuestsConditionsEntity questsConditionsByQuestsConditionsId;

    @ManyToOne
    @JoinColumn(name = "quests_id", referencedColumnName = "id", nullable = false)
    private QuestsEntity questsByQuestsId;
}
