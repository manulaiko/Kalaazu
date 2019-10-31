package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "quests_conditions", schema = "kalaazu", catalog = "")
public class QuestsConditionsEntity {
    private int                    id;
    private byte                   type;
    private String                 value;
    private QuestsConditionsEntity questsConditionsByQuestsConditionsId;
    private QuestsEntity           questsByQuestsId;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "type", nullable = false)
    public byte getType() {
        return type;
    }

    public void setType(byte type) {
        this.type = type;
    }

    @Basic
    @Column(name = "value", nullable = false, length = 255)
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
        QuestsConditionsEntity that = (QuestsConditionsEntity) o;
        return id == that.id &&
               type == that.type &&
               Objects.equals(value, that.value);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, type, value);
    }

    @ManyToOne
    @JoinColumn(name = "quests_conditions_id", referencedColumnName = "id")
    public QuestsConditionsEntity getQuestsConditionsByQuestsConditionsId() {
        return questsConditionsByQuestsConditionsId;
    }

    public void setQuestsConditionsByQuestsConditionsId(
            QuestsConditionsEntity questsConditionsByQuestsConditionsId
    ) {
        this.questsConditionsByQuestsConditionsId = questsConditionsByQuestsConditionsId;
    }

    @ManyToOne
    @JoinColumn(name = "quests_id", referencedColumnName = "id", nullable = false)
    public QuestsEntity getQuestsByQuestsId() {
        return questsByQuestsId;
    }

    public void setQuestsByQuestsId(QuestsEntity questsByQuestsId) {
        this.questsByQuestsId = questsByQuestsId;
    }
}
