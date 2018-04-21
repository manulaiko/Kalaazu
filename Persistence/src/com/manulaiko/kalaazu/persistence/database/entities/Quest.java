package com.manulaiko.kalaazu.persistence.database.entities;


import java.util.Collection;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class Quest {
    private int id;

    private int levelsId;

    private Integer questsId;

    private Integer factionsId;

    private String name;

    private Collection<AccountsQuest> accountsQuestsById;

    private Level levelsByLevelsId;

    private Quest questsByQuestsId;

    private Collection<Quest> questsById;

    private Faction factionsByFactionsId;

    private Collection<QuestsCondition> questsConditionsById;

    private Collection<RewardsQuest> rewardsQuestsById;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getLevelsId() {
        return levelsId;
    }

    public void setLevelsId(int levelsId) {
        this.levelsId = levelsId;
    }

    public Integer getQuestsId() {
        return questsId;
    }

    public void setQuestsId(Integer questsId) {
        this.questsId = questsId;
    }

    public Integer getFactionsId() {
        return factionsId;
    }

    public void setFactionsId(Integer factionsId) {
        this.factionsId = factionsId;
    }

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
        Quest quest = (Quest) o;
        return id == quest.id &&
               levelsId == quest.levelsId &&
               Objects.equals(questsId, quest.questsId) &&
               Objects.equals(factionsId, quest.factionsId) &&
               Objects.equals(name, quest.name);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, levelsId, questsId, factionsId, name);
    }

    public Collection<AccountsQuest> getAccountsQuestsById() {
        return accountsQuestsById;
    }

    public void setAccountsQuestsById(
            Collection<AccountsQuest> accountsQuestsById
    ) {
        this.accountsQuestsById = accountsQuestsById;
    }

    public Level getLevelsByLevelsId() {
        return levelsByLevelsId;
    }

    public void setLevelsByLevelsId(Level levelsByLevelsId) {
        this.levelsByLevelsId = levelsByLevelsId;
    }

    public Quest getQuestsByQuestsId() {
        return questsByQuestsId;
    }

    public void setQuestsByQuestsId(Quest questsByQuestsId) {
        this.questsByQuestsId = questsByQuestsId;
    }

    public Collection<Quest> getQuestsById() {
        return questsById;
    }

    public void setQuestsById(Collection<Quest> questsById) {
        this.questsById = questsById;
    }

    public Faction getFactionsByFactionsId() {
        return factionsByFactionsId;
    }

    public void setFactionsByFactionsId(Faction factionsByFactionsId) {
        this.factionsByFactionsId = factionsByFactionsId;
    }

    public Collection<QuestsCondition> getQuestsConditionsById() {
        return questsConditionsById;
    }

    public void setQuestsConditionsById(
            Collection<QuestsCondition> questsConditionsById
    ) {
        this.questsConditionsById = questsConditionsById;
    }

    public Collection<RewardsQuest> getRewardsQuestsById() {
        return rewardsQuestsById;
    }

    public void setRewardsQuestsById(
            Collection<RewardsQuest> rewardsQuestsById
    ) {
        this.rewardsQuestsById = rewardsQuestsById;
    }
}
