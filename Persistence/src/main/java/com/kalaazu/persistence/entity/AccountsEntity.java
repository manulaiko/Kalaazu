package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Collection;

/**
 * Accounts entity.
 * ================
 *
 * Entity for the `accounts` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "accounts", schema = "kalaazu")
@Data
public class AccountsEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private int id;

    @Basic
    @Column(name = "session_id", nullable = false, length = 32)
    private String sessionId;
    @Basic
    @Column(name = "name", nullable = false)
    private String name;

    @Basic
    @Column(name = "ban_date")
    private Timestamp banDate;

    @Basic
    @Column(name = "premium_date")
    private Timestamp premiumDate;

    @Basic
    @Column(name = "date", nullable = false)
    private Timestamp date;

    @Basic
    @Column(name = "last_login")
    private Timestamp lastLogin;

    @Basic
    @Column(name = "skill_points_total", nullable = false)
    private short skillPointsTotal = 0;

    @Basic
    @Column(name = "skill_points_free", nullable = false)
    private short skillPointsFree = 0;

    @ManyToOne()
    @JoinColumn(name = "users_id", referencedColumnName = "id", nullable = false)
    private UsersEntity usersByUsersId;

    @ManyToOne()
    @JoinColumn(name = "levels_id", referencedColumnName = "id", nullable = false)
    private LevelsEntity levelsByLevelsId;

    @ManyToOne()
    @JoinColumn(name = "factions_id", referencedColumnName = "id")
    private FactionsEntity factionsByFactionsId;

    @ManyToOne()
    @JoinColumn(name = "accounts_hangars_id", referencedColumnName = "id")
    private AccountsHangarsEntity accountsHangarsByAccountsHangarsId;

    @ManyToOne()
    @JoinColumn(name = "clans_id", referencedColumnName = "id")
    private ClansEntity clansByClansId;

    @ManyToOne()
    @JoinColumn(name = "ranks_id", referencedColumnName = "id", nullable = false)
    private RanksEntity ranksByRanksId;

    @OneToMany(mappedBy = "accountsByAccountsId")
    private Collection<AccountsBanksEntity> accountsBanks;

    @OneToMany(mappedBy = "accountsByAccountsId")
    private Collection<AccountsDestroysEntity> accountsDestroys;

    @OneToMany(mappedBy = "accountsByAccountsId")
    private Collection<AccountsDronesEntity> accountsDrones;

    @OneToMany(mappedBy = "accountsByAccountsId")
    private Collection<AccountsGalaxygatesEntity> accountsGalaxygates;

    @OneToMany(mappedBy = "accountsByAccountsId")
    private Collection<AccountsHangarsEntity> accountsHangars;

    @OneToMany(mappedBy = "accountsByAccountsId")
    private Collection<AccountsHistoryEntity> accountsHistories;

    @OneToMany(mappedBy = "accountsByAccountsId")
    private Collection<AccountsItemsEntity> accountsItems;

    @OneToMany(mappedBy = "accountsByFromAccountsId")
    private Collection<AccountsMessagesEntity> fromAccountsMessages;

    @OneToMany(mappedBy = "accountsByToAccountsId")
    private Collection<AccountsMessagesEntity> toAccountsMessages;

    @OneToMany(mappedBy = "accountsByAccountsId")
    private Collection<AccountsPetsEntity> accountsPets;

    @OneToMany(mappedBy = "accountsByAccountsId")
    private Collection<AccountsQuestsEntity> accountsQuests;

    @OneToMany(mappedBy = "accountsByAccountsId")
    private Collection<AccountsRankingsEntity> accountsRankings;

    @OneToMany(mappedBy = "accountsByAccountsId")
    private Collection<AccountsShipsEntity> accountsShips;

    @OneToMany(mappedBy = "accountsByAccountsId")
    private Collection<AccountsSkillsEntity> accountsSkills;

    @OneToMany(mappedBy = "accountsByAccountsId")
    private Collection<AccountsSkylabsEntity> accountsSkylabs;

    @OneToMany(mappedBy = "accountsByAccountsId")
    private Collection<AccountsTechfactoriesEntity> accountsTechfactories;

    @OneToMany(mappedBy = "accountsByAccountsId")
    private Collection<AccountsTechfactoryItemsEntity> accountsTechfactoryItems;

    @OneToMany(mappedBy = "accountsByAccountsId")
    private Collection<ClansApplicationsEntity> clansApplications;

    @ManyToMany
    @JoinTable(
            name = "accounts_clans_roles",
            joinColumns = @JoinColumn(name = "accounts_id"),
            inverseJoinColumns = @JoinColumn(name = "clans_roles_id")
    )
    private Collection<ClansRolesEntity> clansRoles;
}
