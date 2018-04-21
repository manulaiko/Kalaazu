package com.manulaiko.kalaazu.persistence.database.entities;

import java.util.Date;
import java.util.Collection;
import java.util.Objects;

/**
 * Account entity.
 * ===============
 *
 * Represents a row from the `accounts` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class Account implements Entity {
    private int    id;
    private int    usersId;
    private String sessionId;
    private int    levelsId;
    private int    factionsId;
    private int    accountsHangarsId;
    private int    clansId;
    private int    ranksId;
    private String name;
    private Date   banDate;
    private Date   premiumDate;
    private Date   date;
    private Date   lastLogin;
    private int    skillPointsTotal;
    private int    skillPointsFree;

    private User            user;
    private Level           level;
    private Faction         faction;
    private AccountsHangar  activeHangar;
    private Clan            clan;
    private Rank            rank;
    private AccountsRanking ranking;

    private Collection<AccountsBank>            banks;
    private Collection<AccountsClansRole>       clanRoles;
    private Collection<AccountsDestroy>         destroys;
    private Collection<AccountsDrone>           drones;
    private Collection<AccountsGalaxygate>      galaxyGates;
    private Collection<AccountsHangar>          hangars;
    private Collection<AccountsHistory>         history;
    private Collection<AccountsItem>            accountsItemsById;
    private Collection<AccountsMessage>         messagesReceived;
    private Collection<AccountsMessage>         messagesSent;
    private Collection<AccountsPet>             pets;
    private Collection<AccountsQuest>           quests;
    private Collection<AccountsSkill>           skills;
    private Collection<AccountsSkylab>          skylabs;
    private Collection<AccountsTechfactory>     techfactories;
    private Collection<AccountsTechfactoryItem> techfactoryItems;
    private Collection<ClansApplication>        clanApplications;
    private Collection<ClansMessage>            clanMessagesReceived;
    private Collection<ClansMessage>            clanMessagesSent;

    //<editor-fold desc="Getters and Setters">
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUsersId() {
        return usersId;
    }

    public void setUsersId(int usersId) {
        this.usersId = usersId;
    }

    public String getSessionId() {
        return sessionId;
    }

    public void setSessionId(String sessionId) {
        this.sessionId = sessionId;
    }

    public int getLevelsId() {
        return levelsId;
    }

    public void setLevelsId(int levelsId) {
        this.levelsId = levelsId;
    }

    public int getFactionsId() {
        return factionsId;
    }

    public void setFactionsId(int factionsId) {
        this.factionsId = factionsId;
    }

    public int getAccountsHangarsId() {
        return accountsHangarsId;
    }

    public void setAccountsHangarsId(int accountsHangarsId) {
        this.accountsHangarsId = accountsHangarsId;
    }

    public int getClansId() {
        return clansId;
    }

    public void setClansId(int clansId) {
        this.clansId = clansId;
    }

    public int getRanksId() {
        return ranksId;
    }

    public void setRanksId(int ranksId) {
        this.ranksId = ranksId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getBanDate() {
        return banDate;
    }

    public void setBanDate(Date banDate) {
        this.banDate = banDate;
    }

    public Date getPremiumDate() {
        return premiumDate;
    }

    public void setPremiumDate(Date premiumDate) {
        this.premiumDate = premiumDate;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Date getLastLogin() {
        return lastLogin;
    }

    public void setLastLogin(Date lastLogin) {
        this.lastLogin = lastLogin;
    }

    public int getSkillPointsTotal() {
        return skillPointsTotal;
    }

    public void setSkillPointsTotal(int skillPointsTotal) {
        this.skillPointsTotal = skillPointsTotal;
    }

    public int getSkillPointsFree() {
        return skillPointsFree;
    }

    public void setSkillPointsFree(int skillPointsFree) {
        this.skillPointsFree = skillPointsFree;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Level getLevel() {
        return level;
    }

    public void setLevel(Level level) {
        this.level = level;
    }

    public Faction getFaction() {
        return faction;
    }

    public void setFaction(Faction faction) {
        this.faction = faction;
    }

    public AccountsHangar getActiveHangar() {
        return activeHangar;
    }

    public void setActiveHangar(AccountsHangar activeHangar) {
        this.activeHangar = activeHangar;
    }

    public Clan getClan() {
        return clan;
    }

    public void setClan(Clan clan) {
        this.clan = clan;
    }

    public Rank getRank() {
        return rank;
    }

    public void setRank(Rank rank) {
        this.rank = rank;
    }

    public Collection<AccountsBank> getBanks() {
        return banks;
    }

    public void setBanks(Collection<AccountsBank> banks) {
        this.banks = banks;
    }

    public Collection<AccountsClansRole> getClanRoles() {
        return clanRoles;
    }

    public void setClanRoles(Collection<AccountsClansRole> clanRoles) {
        this.clanRoles = clanRoles;
    }

    public Collection<AccountsDestroy> getDestroys() {
        return destroys;
    }

    public void setDestroys(Collection<AccountsDestroy> destroys) {
        this.destroys = destroys;
    }

    public Collection<AccountsDrone> getDrones() {
        return drones;
    }

    public void setDrones(Collection<AccountsDrone> drones) {
        this.drones = drones;
    }

    public Collection<AccountsGalaxygate> getGalaxyGates() {
        return galaxyGates;
    }

    public void setGalaxyGates(Collection<AccountsGalaxygate> galaxyGates) {
        this.galaxyGates = galaxyGates;
    }

    public Collection<AccountsHangar> getHangars() {
        return hangars;
    }

    public void setHangars(Collection<AccountsHangar> hangars) {
        this.hangars = hangars;
    }

    public Collection<AccountsHistory> getHistory() {
        return history;
    }

    public void setHistory(Collection<AccountsHistory> history) {
        this.history = history;
    }

    public Collection<AccountsItem> getAccountsItemsById() {
        return accountsItemsById;
    }

    public void setAccountsItemsById(Collection<AccountsItem> accountsItemsById) {
        this.accountsItemsById = accountsItemsById;
    }

    public Collection<AccountsMessage> getMessagesReceived() {
        return messagesReceived;
    }

    public void setMessagesReceived(Collection<AccountsMessage> messagesReceived) {
        this.messagesReceived = messagesReceived;
    }

    public Collection<AccountsMessage> getMessagesSent() {
        return messagesSent;
    }

    public void setMessagesSent(Collection<AccountsMessage> messagesSent) {
        this.messagesSent = messagesSent;
    }

    public Collection<AccountsPet> getPets() {
        return pets;
    }

    public void setPets(Collection<AccountsPet> pets) {
        this.pets = pets;
    }

    public Collection<AccountsQuest> getQuests() {
        return quests;
    }

    public void setQuests(Collection<AccountsQuest> quests) {
        this.quests = quests;
    }

    public AccountsRanking getRanking() {
        return ranking;
    }

    public void setRanking(AccountsRanking ranking) {
        this.ranking = ranking;
    }

    public Collection<AccountsSkill> getSkills() {
        return skills;
    }

    public void setSkills(Collection<AccountsSkill> skills) {
        this.skills = skills;
    }

    public Collection<AccountsSkylab> getSkylabs() {
        return skylabs;
    }

    public void setSkylabs(Collection<AccountsSkylab> skylabs) {
        this.skylabs = skylabs;
    }

    public Collection<AccountsTechfactory> getTechfactories() {
        return techfactories;
    }

    public void setTechfactories(Collection<AccountsTechfactory> techfactories) {
        this.techfactories = techfactories;
    }

    public Collection<AccountsTechfactoryItem> getTechfactoryItems() {
        return techfactoryItems;
    }

    public void setTechfactoryItems(Collection<AccountsTechfactoryItem> techfactoryItems) {
        this.techfactoryItems = techfactoryItems;
    }

    public Collection<ClansApplication> getClanApplications() {
        return clanApplications;
    }

    public void setClanApplications(Collection<ClansApplication> clanApplications) {
        this.clanApplications = clanApplications;
    }

    public Collection<ClansMessage> getClanMessagesReceived() {
        return clanMessagesReceived;
    }

    public void setClanMessagesReceived(Collection<ClansMessage> clanMessagesReceived) {
        this.clanMessagesReceived = clanMessagesReceived;
    }

    public Collection<ClansMessage> getClanMessagesSent() {
        return clanMessagesSent;
    }

    public void setClanMessagesSent(Collection<ClansMessage> clanMessagesSent) {
        this.clanMessagesSent = clanMessagesSent;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        Account account = (Account) o;
        return id == account.id &&
               usersId == account.usersId &&
               levelsId == account.levelsId &&
               ranksId == account.ranksId &&
               skillPointsTotal == account.skillPointsTotal &&
               skillPointsFree == account.skillPointsFree &&
               Objects.equals(sessionId, account.sessionId) &&
               Objects.equals(factionsId, account.factionsId) &&
               Objects.equals(accountsHangarsId, account.accountsHangarsId) &&
               Objects.equals(clansId, account.clansId) &&
               Objects.equals(name, account.name) &&
               Objects.equals(banDate, account.banDate) &&
               Objects.equals(premiumDate, account.premiumDate) &&
               Objects.equals(date, account.date) &&
               Objects.equals(lastLogin, account.lastLogin);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, usersId, sessionId, levelsId, factionsId, accountsHangarsId, clansId, ranksId, name,
                            banDate, premiumDate, date, lastLogin, skillPointsTotal, skillPointsFree
        );
    }
    //</editor-fold>
}
