package com.manulaiko.kalaazu.persistence.database.entities;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "quests_conditions", schema = "kalaazu")
public class QuestsCondition {
    private int id;

    private Integer questsConditionsId;

    private int questsId;

    private int type;

    private String value;

    private QuestsCondition questsConditionsByQuestsConditionsId;

    private Collection<QuestsCondition> questsConditionsById;

    private Quest questsByQuestsId;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "quests_conditions_id")
    public Integer getQuestsConditionsId() {
        return questsConditionsId;
    }

    public void setQuestsConditionsId(Integer questsConditionsId) {
        this.questsConditionsId = questsConditionsId;
    }

    @Basic
    @Column(name = "quests_id")
    public int getQuestsId() {
        return questsId;
    }

    public void setQuestsId(int questsId) {
        this.questsId = questsId;
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
    @Column(name = "value")
    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        QuestsCondition that = (QuestsCondition) o;
        return id == that.id &&
               questsId == that.questsId &&
               type == that.type &&
               Objects.equals(questsConditionsId, that.questsConditionsId) &&
               Objects.equals(value, that.value);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, questsConditionsId, questsId, type, value);
    }

    @ManyToOne
    @JoinColumn(name = "quests_conditions_id", referencedColumnName = "id")
    public QuestsCondition getQuestsConditionsByQuestsConditionsId() {
        return questsConditionsByQuestsConditionsId;
    }

    public void setQuestsConditionsByQuestsConditionsId(
            QuestsCondition questsConditionsByQuestsConditionsId
    ) {
        this.questsConditionsByQuestsConditionsId = questsConditionsByQuestsConditionsId;
    }

    @OneToMany(mappedBy = "questsConditionsByQuestsConditionsId")
    public Collection<QuestsCondition> getQuestsConditionsById() {
        return questsConditionsById;
    }

    public void setQuestsConditionsById(
            Collection<QuestsCondition> questsConditionsById
    ) {
        this.questsConditionsById = questsConditionsById;
    }

    @ManyToOne
    @JoinColumn(name = "quests_id", referencedColumnName = "id", nullable = false)
    public Quest getQuestsByQuestsId() {
        return questsByQuestsId;
    }

    public void setQuestsByQuestsId(Quest questsByQuestsId) {
        this.questsByQuestsId = questsByQuestsId;
    }
}
