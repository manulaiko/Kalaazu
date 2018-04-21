package com.manulaiko.kalaazu.persistence.database.entities;


import java.util.Collection;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class QuestsCondition {
    private int id;

    private Integer questsConditionsId;

    private int questsId;

    private int type;

    private String value;

    private QuestsCondition questsConditionsByQuestsConditionsId;

    private Collection<QuestsCondition> questsConditionsById;

    private Quest questsByQuestsId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Integer getQuestsConditionsId() {
        return questsConditionsId;
    }

    public void setQuestsConditionsId(Integer questsConditionsId) {
        this.questsConditionsId = questsConditionsId;
    }

    public int getQuestsId() {
        return questsId;
    }

    public void setQuestsId(int questsId) {
        this.questsId = questsId;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

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

    public QuestsCondition getQuestsConditionsByQuestsConditionsId() {
        return questsConditionsByQuestsConditionsId;
    }

    public void setQuestsConditionsByQuestsConditionsId(
            QuestsCondition questsConditionsByQuestsConditionsId
    ) {
        this.questsConditionsByQuestsConditionsId = questsConditionsByQuestsConditionsId;
    }

    public Collection<QuestsCondition> getQuestsConditionsById() {
        return questsConditionsById;
    }

    public void setQuestsConditionsById(
            Collection<QuestsCondition> questsConditionsById
    ) {
        this.questsConditionsById = questsConditionsById;
    }

    public Quest getQuestsByQuestsId() {
        return questsByQuestsId;
    }

    public void setQuestsByQuestsId(Quest questsByQuestsId) {
        this.questsByQuestsId = questsByQuestsId;
    }
}
