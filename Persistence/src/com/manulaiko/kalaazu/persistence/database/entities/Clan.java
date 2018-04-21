package com.manulaiko.kalaazu.persistence.database.entities;


import java.util.Collection;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class Clan {
    private int id;

    private int accountsId;

    private Integer factionsId;

    private String tag;

    private String name;

    private String description;

    private String logo;

    private int status;

    private Collection<Account> accountsById;

    private Account accountsByAccountsId;

    private Collection<ClansApplication> clansApplicationsById;

    private Collection<ClansBank> clansBanksById;

    private Collection<ClansBattlestation> clansBattlestationsById;

    private Collection<ClansBattlestationsLog> clansBattlestationsLogsById;

    private Collection<ClansDiplomacy> clansDiplomaciesById;

    private Collection<ClansDiplomacy> clansDiplomaciesById_0;

    private Collection<ClansMessage> clansMessagesById;

    private Collection<ClansNew> clansNewsById;

    private Collection<ClansRanking> clansRankingsById;

    private Collection<ClansRole> clansRolesById;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAccountsId() {
        return accountsId;
    }

    public void setAccountsId(int accountsId) {
        this.accountsId = accountsId;
    }

    public Integer getFactionsId() {
        return factionsId;
    }

    public void setFactionsId(Integer factionsId) {
        this.factionsId = factionsId;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        Clan clan = (Clan) o;
        return id == clan.id &&
               accountsId == clan.accountsId &&
               status == clan.status &&
               Objects.equals(factionsId, clan.factionsId) &&
               Objects.equals(tag, clan.tag) &&
               Objects.equals(name, clan.name) &&
               Objects.equals(description, clan.description) &&
               Objects.equals(logo, clan.logo);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, accountsId, factionsId, tag, name, description, logo, status);
    }

    public Collection<Account> getAccountsById() {
        return accountsById;
    }

    public void setAccountsById(Collection<Account> accountsById) {
        this.accountsById = accountsById;
    }

    public Account getAccountsByAccountsId() {
        return accountsByAccountsId;
    }

    public void setAccountsByAccountsId(Account accountsByAccountsId) {
        this.accountsByAccountsId = accountsByAccountsId;
    }

    public Collection<ClansApplication> getClansApplicationsById() {
        return clansApplicationsById;
    }

    public void setClansApplicationsById(
            Collection<ClansApplication> clansApplicationsById
    ) {
        this.clansApplicationsById = clansApplicationsById;
    }

    public Collection<ClansBank> getClansBanksById() {
        return clansBanksById;
    }

    public void setClansBanksById(
            Collection<ClansBank> clansBanksById
    ) {
        this.clansBanksById = clansBanksById;
    }

    public Collection<ClansBattlestation> getClansBattlestationsById() {
        return clansBattlestationsById;
    }

    public void setClansBattlestationsById(
            Collection<ClansBattlestation> clansBattlestationsById
    ) {
        this.clansBattlestationsById = clansBattlestationsById;
    }

    public Collection<ClansBattlestationsLog> getClansBattlestationsLogsById() {
        return clansBattlestationsLogsById;
    }

    public void setClansBattlestationsLogsById(
            Collection<ClansBattlestationsLog> clansBattlestationsLogsById
    ) {
        this.clansBattlestationsLogsById = clansBattlestationsLogsById;
    }

    public Collection<ClansDiplomacy> getClansDiplomaciesById() {
        return clansDiplomaciesById;
    }

    public void setClansDiplomaciesById(
            Collection<ClansDiplomacy> clansDiplomaciesById
    ) {
        this.clansDiplomaciesById = clansDiplomaciesById;
    }

    public Collection<ClansDiplomacy> getClansDiplomaciesById_0() {
        return clansDiplomaciesById_0;
    }

    public void setClansDiplomaciesById_0(
            Collection<ClansDiplomacy> clansDiplomaciesById_0
    ) {
        this.clansDiplomaciesById_0 = clansDiplomaciesById_0;
    }

    public Collection<ClansMessage> getClansMessagesById() {
        return clansMessagesById;
    }

    public void setClansMessagesById(
            Collection<ClansMessage> clansMessagesById
    ) {
        this.clansMessagesById = clansMessagesById;
    }

    public Collection<ClansNew> getClansNewsById() {
        return clansNewsById;
    }

    public void setClansNewsById(
            Collection<ClansNew> clansNewsById
    ) {
        this.clansNewsById = clansNewsById;
    }

    public Collection<ClansRanking> getClansRankingsById() {
        return clansRankingsById;
    }

    public void setClansRankingsById(
            Collection<ClansRanking> clansRankingsById
    ) {
        this.clansRankingsById = clansRankingsById;
    }

    public Collection<ClansRole> getClansRolesById() {
        return clansRolesById;
    }

    public void setClansRolesById(
            Collection<ClansRole> clansRolesById
    ) {
        this.clansRolesById = clansRolesById;
    }
}
