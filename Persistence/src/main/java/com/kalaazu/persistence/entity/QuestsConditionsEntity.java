package com.kalaazu.persistence.entity;

import jakarta.persistence.*;
import lombok.Data;

/**
 * Quests conditions entity.
 * =========================
 * <p>
 * Entity for the `quests_conditions` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "quests_conditions", schema = "kalaazu")
@Data
public class QuestsConditionsEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private int id;

    @Basic
    @Column(name = "type", nullable = false)
    @Enumerated(EnumType.ORDINAL)
    private ConditionType type = ConditionType.COLLECT;

    @Basic
    @Column(name = "value", nullable = false)
    private String value = "";

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "quests_conditions_id", referencedColumnName = "id")
    private QuestsConditionsEntity questsConditionsByQuestsConditionsId;

    @Basic
    @Column(name= "quests_conditions_id", insertable = false, updatable = false)
    private Integer questsConditionsId = 0;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "quests_id", referencedColumnName = "id", nullable = false)
    private QuestsEntity questsByQuestsId;

    @Basic
    @Column(name= "quests_id", nullable = false, insertable = false, updatable = false)
    private short questsId = 0;
}
