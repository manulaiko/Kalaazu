package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "quests", schema = "kalaazu", catalog = "")
public class QuestsEntity {
    private short          id;
    private String         name;
    private LevelsEntity   levelsByLevelsId;
    private QuestsEntity   questsByQuestsId;
    private FactionsEntity factionsByFactionsId;

    @Id
    @Column(name = "id", nullable = false)
    public short getId() {
        return id;
    }

    public void setId(short id) {
        this.id = id;
    }

    @Basic
    @Column(name = "name", nullable = false, length = 255)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        QuestsEntity that = (QuestsEntity) o;
        return id == that.id &&
               Objects.equals(name, that.name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name);
    }

    @ManyToOne
    @JoinColumn(name = "levels_id", referencedColumnName = "id", nullable = false)
    public LevelsEntity getLevelsByLevelsId() {
        return levelsByLevelsId;
    }

    public void setLevelsByLevelsId(LevelsEntity levelsByLevelsId) {
        this.levelsByLevelsId = levelsByLevelsId;
    }

    @ManyToOne
    @JoinColumn(name = "quests_id", referencedColumnName = "id")
    public QuestsEntity getQuestsByQuestsId() {
        return questsByQuestsId;
    }

    public void setQuestsByQuestsId(QuestsEntity questsByQuestsId) {
        this.questsByQuestsId = questsByQuestsId;
    }

    @ManyToOne
    @JoinColumn(name = "factions_id", referencedColumnName = "id")
    public FactionsEntity getFactionsByFactionsId() {
        return factionsByFactionsId;
    }

    public void setFactionsByFactionsId(FactionsEntity factionsByFactionsId) {
        this.factionsByFactionsId = factionsByFactionsId;
    }
}
