package com.manulaiko.kalaazu.persistence.database.entities;

import javax.persistence.*;
import java.util.Date;
import java.util.Collection;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "accounts", schema = "kalaazu")
public class Account {
    private int id;

    private int usersId;

    private String sessionId;

    private int levelsId;

    private Integer factionsId;

    private Integer accountsHangarsId;

    private Integer clansId;

    private int ranksId;

    private String name;

    private Date banDate;

    private Date premiumDate;

    private Date date;

    private Date lastLogin;

    private int skillPointsTotal;

    private int skillPointsFree;

    private User usersByUsersId;

    private Level levelsByLevelsId;

    private Faction factionsByFactionsId;

    private AccountsHangar accountsHangarsByAccountsHangarsId;

    private Clan clansByClansId;

    private Rank ranksByRanksId;

    private Collection<AccountsBank> accountsBanksById;

    private Collection<AccountsBanksLog> accountsBanksLogsById;

    private Collection<AccountsBanksLog> accountsBanksLogsById_0;

    private Collection<AccountsClansRole> accountsClansRolesById;

    private Collection<AccountsDestroy> accountsDestroysById;

    private Collection<AccountsDrone> accountsDronesById;

    private Collection<AccountsGalaxygate> accountsGalaxygatesById;

    private Collection<AccountsHangar> accountsHangarsById;

    private Collection<AccountsHistory> accountsHistoriesById;

    private Collection<AccountsItem> accountsItemsById;

    private Collection<AccountsMessage> accountsMessagesById;

    private Collection<AccountsMessage> accountsMessagesById_0;

    private Collection<AccountsPet> accountsPetsById;

    private Collection<AccountsQuest> accountsQuestsById;

    private Collection<AccountsRanking> accountsRankingsById;

    private Collection<AccountsShip> accountsShipsById;

    private Collection<AccountsSkill> accountsSkillsById;

    private Collection<AccountsSkylab> accountsSkylabsById;

    private Collection<AccountsTechfactorie> accountsTechfactoriesById;

    private Collection<AccountsTechfactoryItem> accountsTechfactoryItemsById;

    private Collection<Clan> clansById;

    private Collection<ClansApplication> clansApplicationsById;

    private Collection<ClansBanksLog> clansBanksLogsById;

    private Collection<ClansBanksLog> clansBanksLogsById_0;

    private Collection<ClansMessage> clansMessagesById;

    private Collection<ClansMessage> clansMessagesById_0;

    private Collection<ClansNew> clansNewsById;

    private Collection<Moderator> moderatorsById;

    private Collection<TradeItem> tradeItemsById;

    private Collection<VouchersRedeemLog> vouchersRedeemLogsById;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "users_id")
    public int getUsersId() {
        return usersId;
    }

    public void setUsersId(int usersId) {
        this.usersId = usersId;
    }

    @Basic
    @Column(name = "session_id")
    public String getSessionId() {
        return sessionId;
    }

    public void setSessionId(String sessionId) {
        this.sessionId = sessionId;
    }

    @Basic
    @Column(name = "levels_id")
    public int getLevelsId() {
        return levelsId;
    }

    public void setLevelsId(int levelsId) {
        this.levelsId = levelsId;
    }

    @Basic
    @Column(name = "factions_id")
    public Integer getFactionsId() {
        return factionsId;
    }

    public void setFactionsId(Integer factionsId) {
        this.factionsId = factionsId;
    }

    @Basic
    @Column(name = "accounts_hangars_id")
    public Integer getAccountsHangarsId() {
        return accountsHangarsId;
    }

    public void setAccountsHangarsId(Integer accountsHangarsId) {
        this.accountsHangarsId = accountsHangarsId;
    }

    @Basic
    @Column(name = "clans_id")
    public Integer getClansId() {
        return clansId;
    }

    public void setClansId(Integer clansId) {
        this.clansId = clansId;
    }

    @Basic
    @Column(name = "ranks_id")
    public int getRanksId() {
        return ranksId;
    }

    public void setRanksId(int ranksId) {
        this.ranksId = ranksId;
    }

    @Basic
    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "ban_date")
    public Date getBanDate() {
        return banDate;
    }

    public void setBanDate(Date banDate) {
        this.banDate = banDate;
    }

    @Basic
    @Column(name = "premium_date")
    public Date getPremiumDate() {
        return premiumDate;
    }

    public void setPremiumDate(Date premiumDate) {
        this.premiumDate = premiumDate;
    }

    @Basic
    @Column(name = "date")
    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Basic
    @Column(name = "last_login")
    public Date getLastLogin() {
        return lastLogin;
    }

    public void setLastLogin(Date lastLogin) {
        this.lastLogin = lastLogin;
    }

    @Basic
    @Column(name = "skill_points_total")
    public int getSkillPointsTotal() {
        return skillPointsTotal;
    }

    public void setSkillPointsTotal(int skillPointsTotal) {
        this.skillPointsTotal = skillPointsTotal;
    }

    @Basic
    @Column(name = "skill_points_free")
    public int getSkillPointsFree() {
        return skillPointsFree;
    }

    public void setSkillPointsFree(int skillPointsFree) {
        this.skillPointsFree = skillPointsFree;
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

    @ManyToOne
    @JoinColumn(name = "users_id", referencedColumnName = "id", nullable = false)
    public User getUsersByUsersId() {
        return usersByUsersId;
    }

    public void setUsersByUsersId(User usersByUsersId) {
        this.usersByUsersId = usersByUsersId;
    }

    @ManyToOne
    @JoinColumn(name = "levels_id", referencedColumnName = "id", nullable = false)
    public Level getLevelsByLevelsId() {
        return levelsByLevelsId;
    }

    public void setLevelsByLevelsId(Level levelsByLevelsId) {
        this.levelsByLevelsId = levelsByLevelsId;
    }

    @ManyToOne
    @JoinColumn(name = "factions_id", referencedColumnName = "id")
    public Faction getFactionsByFactionsId() {
        return factionsByFactionsId;
    }

    public void setFactionsByFactionsId(Faction factionsByFactionsId) {
        this.factionsByFactionsId = factionsByFactionsId;
    }

    @ManyToOne
    @JoinColumn(name = "accounts_hangars_id", referencedColumnName = "id")
    public AccountsHangar getAccountsHangarsByAccountsHangarsId() {
        return accountsHangarsByAccountsHangarsId;
    }

    public void setAccountsHangarsByAccountsHangarsId(
            AccountsHangar accountsHangarsByAccountsHangarsId
    ) {
        this.accountsHangarsByAccountsHangarsId = accountsHangarsByAccountsHangarsId;
    }

    @ManyToOne
    @JoinColumn(name = "clans_id", referencedColumnName = "id")
    public Clan getClansByClansId() {
        return clansByClansId;
    }

    public void setClansByClansId(Clan clansByClansId) {
        this.clansByClansId = clansByClansId;
    }

    @ManyToOne
    @JoinColumn(name = "ranks_id", referencedColumnName = "id", nullable = false)
    public Rank getRanksByRanksId() {
        return ranksByRanksId;
    }

    public void setRanksByRanksId(Rank ranksByRanksId) {
        this.ranksByRanksId = ranksByRanksId;
    }

    @OneToMany(mappedBy = "accountsByAccountsId")
    public Collection<AccountsBank> getAccountsBanksById() {
        return accountsBanksById;
    }

    public void setAccountsBanksById(
            Collection<AccountsBank> accountsBanksById
    ) {
        this.accountsBanksById = accountsBanksById;
    }

    @OneToMany(mappedBy = "accountsByFromAccountsId")
    public Collection<AccountsBanksLog> getAccountsBanksLogsById() {
        return accountsBanksLogsById;
    }

    public void setAccountsBanksLogsById(
            Collection<AccountsBanksLog> accountsBanksLogsById
    ) {
        this.accountsBanksLogsById = accountsBanksLogsById;
    }

    @OneToMany(mappedBy = "accountsByToAccountsId")
    public Collection<AccountsBanksLog> getAccountsBanksLogsById_0() {
        return accountsBanksLogsById_0;
    }

    public void setAccountsBanksLogsById_0(
            Collection<AccountsBanksLog> accountsBanksLogsById_0
    ) {
        this.accountsBanksLogsById_0 = accountsBanksLogsById_0;
    }

    @OneToMany(mappedBy = "accountsByAccountsId")
    public Collection<AccountsClansRole> getAccountsClansRolesById() {
        return accountsClansRolesById;
    }

    public void setAccountsClansRolesById(
            Collection<AccountsClansRole> accountsClansRolesById
    ) {
        this.accountsClansRolesById = accountsClansRolesById;
    }

    @OneToMany(mappedBy = "accountsByAccountsId")
    public Collection<AccountsDestroy> getAccountsDestroysById() {
        return accountsDestroysById;
    }

    public void setAccountsDestroysById(
            Collection<AccountsDestroy> accountsDestroysById
    ) {
        this.accountsDestroysById = accountsDestroysById;
    }

    @OneToMany(mappedBy = "accountsByAccountsId")
    public Collection<AccountsDrone> getAccountsDronesById() {
        return accountsDronesById;
    }

    public void setAccountsDronesById(
            Collection<AccountsDrone> accountsDronesById
    ) {
        this.accountsDronesById = accountsDronesById;
    }

    @OneToMany(mappedBy = "accountsByAccountsId")
    public Collection<AccountsGalaxygate> getAccountsGalaxygatesById() {
        return accountsGalaxygatesById;
    }

    public void setAccountsGalaxygatesById(
            Collection<AccountsGalaxygate> accountsGalaxygatesById
    ) {
        this.accountsGalaxygatesById = accountsGalaxygatesById;
    }

    @OneToMany(mappedBy = "accountsByAccountsId")
    public Collection<AccountsHangar> getAccountsHangarsById() {
        return accountsHangarsById;
    }

    public void setAccountsHangarsById(
            Collection<AccountsHangar> accountsHangarsById
    ) {
        this.accountsHangarsById = accountsHangarsById;
    }

    @OneToMany(mappedBy = "accountsByAccountsId")
    public Collection<AccountsHistory> getAccountsHistoriesById() {
        return accountsHistoriesById;
    }

    public void setAccountsHistoriesById(
            Collection<AccountsHistory> accountsHistoriesById
    ) {
        this.accountsHistoriesById = accountsHistoriesById;
    }

    @OneToMany(mappedBy = "accountsByAccountsId")
    public Collection<AccountsItem> getAccountsItemsById() {
        return accountsItemsById;
    }

    public void setAccountsItemsById(
            Collection<AccountsItem> accountsItemsById
    ) {
        this.accountsItemsById = accountsItemsById;
    }

    @OneToMany(mappedBy = "accountsByFromAccountsId")
    public Collection<AccountsMessage> getAccountsMessagesById() {
        return accountsMessagesById;
    }

    public void setAccountsMessagesById(
            Collection<AccountsMessage> accountsMessagesById
    ) {
        this.accountsMessagesById = accountsMessagesById;
    }

    @OneToMany(mappedBy = "accountsByToAccountsId")
    public Collection<AccountsMessage> getAccountsMessagesById_0() {
        return accountsMessagesById_0;
    }

    public void setAccountsMessagesById_0(
            Collection<AccountsMessage> accountsMessagesById_0
    ) {
        this.accountsMessagesById_0 = accountsMessagesById_0;
    }

    @OneToMany(mappedBy = "accountsByAccountsId")
    public Collection<AccountsPet> getAccountsPetsById() {
        return accountsPetsById;
    }

    public void setAccountsPetsById(
            Collection<AccountsPet> accountsPetsById
    ) {
        this.accountsPetsById = accountsPetsById;
    }

    @OneToMany(mappedBy = "accountsByAccountsId")
    public Collection<AccountsQuest> getAccountsQuestsById() {
        return accountsQuestsById;
    }

    public void setAccountsQuestsById(
            Collection<AccountsQuest> accountsQuestsById
    ) {
        this.accountsQuestsById = accountsQuestsById;
    }

    @OneToMany(mappedBy = "accountsByAccountsId")
    public Collection<AccountsRanking> getAccountsRankingsById() {
        return accountsRankingsById;
    }

    public void setAccountsRankingsById(
            Collection<AccountsRanking> accountsRankingsById
    ) {
        this.accountsRankingsById = accountsRankingsById;
    }

    @OneToMany(mappedBy = "accountsByAccountsId")
    public Collection<AccountsShip> getAccountsShipsById() {
        return accountsShipsById;
    }

    public void setAccountsShipsById(
            Collection<AccountsShip> accountsShipsById
    ) {
        this.accountsShipsById = accountsShipsById;
    }

    @OneToMany(mappedBy = "accountsByAccountsId")
    public Collection<AccountsSkill> getAccountsSkillsById() {
        return accountsSkillsById;
    }

    public void setAccountsSkillsById(
            Collection<AccountsSkill> accountsSkillsById
    ) {
        this.accountsSkillsById = accountsSkillsById;
    }

    @OneToMany(mappedBy = "accountsByAccountsId")
    public Collection<AccountsSkylab> getAccountsSkylabsById() {
        return accountsSkylabsById;
    }

    public void setAccountsSkylabsById(
            Collection<AccountsSkylab> accountsSkylabsById
    ) {
        this.accountsSkylabsById = accountsSkylabsById;
    }

    @OneToMany(mappedBy = "accountsByAccountsId")
    public Collection<AccountsTechfactorie> getAccountsTechfactoriesById() {
        return accountsTechfactoriesById;
    }

    public void setAccountsTechfactoriesById(
            Collection<AccountsTechfactorie> accountsTechfactoriesById
    ) {
        this.accountsTechfactoriesById = accountsTechfactoriesById;
    }

    @OneToMany(mappedBy = "accountsByAccountsId")
    public Collection<AccountsTechfactoryItem> getAccountsTechfactoryItemsById() {
        return accountsTechfactoryItemsById;
    }

    public void setAccountsTechfactoryItemsById(
            Collection<AccountsTechfactoryItem> accountsTechfactoryItemsById
    ) {
        this.accountsTechfactoryItemsById = accountsTechfactoryItemsById;
    }

    @OneToMany(mappedBy = "accountsByAccountsId")
    public Collection<Clan> getClansById() {
        return clansById;
    }

    public void setClansById(Collection<Clan> clansById) {
        this.clansById = clansById;
    }

    @OneToMany(mappedBy = "accountsByAccountsId")
    public Collection<ClansApplication> getClansApplicationsById() {
        return clansApplicationsById;
    }

    public void setClansApplicationsById(
            Collection<ClansApplication> clansApplicationsById
    ) {
        this.clansApplicationsById = clansApplicationsById;
    }

    @OneToMany(mappedBy = "accountsByFromAccountsId")
    public Collection<ClansBanksLog> getClansBanksLogsById() {
        return clansBanksLogsById;
    }

    public void setClansBanksLogsById(
            Collection<ClansBanksLog> clansBanksLogsById
    ) {
        this.clansBanksLogsById = clansBanksLogsById;
    }

    @OneToMany(mappedBy = "accountsByToAccountsId")
    public Collection<ClansBanksLog> getClansBanksLogsById_0() {
        return clansBanksLogsById_0;
    }

    public void setClansBanksLogsById_0(
            Collection<ClansBanksLog> clansBanksLogsById_0
    ) {
        this.clansBanksLogsById_0 = clansBanksLogsById_0;
    }

    @OneToMany(mappedBy = "accountsByFromAccountsId")
    public Collection<ClansMessage> getClansMessagesById() {
        return clansMessagesById;
    }

    public void setClansMessagesById(
            Collection<ClansMessage> clansMessagesById
    ) {
        this.clansMessagesById = clansMessagesById;
    }

    @OneToMany(mappedBy = "accountsByToAccountsId")
    public Collection<ClansMessage> getClansMessagesById_0() {
        return clansMessagesById_0;
    }

    public void setClansMessagesById_0(
            Collection<ClansMessage> clansMessagesById_0
    ) {
        this.clansMessagesById_0 = clansMessagesById_0;
    }

    @OneToMany(mappedBy = "accountsByAccountsId")
    public Collection<ClansNew> getClansNewsById() {
        return clansNewsById;
    }

    public void setClansNewsById(
            Collection<ClansNew> clansNewsById
    ) {
        this.clansNewsById = clansNewsById;
    }

    @OneToMany(mappedBy = "accountsByAccountsId")
    public Collection<Moderator> getModeratorsById() {
        return moderatorsById;
    }

    public void setModeratorsById(
            Collection<Moderator> moderatorsById
    ) {
        this.moderatorsById = moderatorsById;
    }

    @OneToMany(mappedBy = "accountsByAccountsId")
    public Collection<TradeItem> getTradeItemsById() {
        return tradeItemsById;
    }

    public void setTradeItemsById(
            Collection<TradeItem> tradeItemsById
    ) {
        this.tradeItemsById = tradeItemsById;
    }

    @OneToMany(mappedBy = "accountsByAccountsId")
    public Collection<VouchersRedeemLog> getVouchersRedeemLogsById() {
        return vouchersRedeemLogsById;
    }

    public void setVouchersRedeemLogsById(
            Collection<VouchersRedeemLog> vouchersRedeemLogsById
    ) {
        this.vouchersRedeemLogsById = vouchersRedeemLogsById;
    }
}
