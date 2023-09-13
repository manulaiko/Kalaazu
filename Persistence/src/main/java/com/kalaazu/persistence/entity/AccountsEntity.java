package com.kalaazu.persistence.entity;

import jakarta.persistence.*;
import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;

import java.sql.Timestamp;
import java.util.Collection;
import java.util.HashSet;

/**
 * Accounts entity.
 * ================
 * <p>
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
    @CreationTimestamp
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

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "users_id", referencedColumnName = "id", nullable = false)
    private UsersEntity usersByUsersId;

    @Basic
    @Column(name= "users_id", nullable = false, insertable = false, updatable = false)
    private int usersId = 0;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "levels_id", referencedColumnName = "id", nullable = false)
    private LevelsEntity levelsByLevelsId;

    @Basic
    @Column(name= "levels_id", nullable = false, insertable = false, updatable = false)
    private byte levelsId = 0;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "factions_id", referencedColumnName = "id")
    private FactionsEntity factionsByFactionsId;

    @Basic
    @Column(name= "factions_id", insertable = false, updatable = false)
    private Byte factionsId = 0;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "accounts_hangars_id", referencedColumnName = "id")
    private AccountsHangarsEntity accountsHangarsByAccountsHangarsId;

    @Basic
    @Column(name= "accounts_hangars_id", insertable = false, updatable = false)
    private Integer accountsHangarsId = 0;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "clans_id", referencedColumnName = "id")
    private ClansEntity clansByClansId;

    @Basic
    @Column(name= "clans_id", insertable = false, updatable = false)
    private Integer clansId = 0;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ranks_id", referencedColumnName = "id", nullable = false)
    private RanksEntity ranksByRanksId;

    @Basic
    @Column(name= "ranks_id", nullable = false, insertable = false, updatable = false)
    private byte ranksId = 0;

    @OneToMany(mappedBy = "accountsByAccountsId", fetch = FetchType.LAZY)
    private Collection<AccountsBanksEntity> accountsBanks = new HashSet<>();

    @OneToMany(mappedBy = "accountsByAccountsId", fetch = FetchType.LAZY)
    private Collection<AccountsDestroysEntity> accountsDestroys = new HashSet<>();

    @OneToMany(mappedBy = "accountsByAccountsId", fetch = FetchType.LAZY)
    private Collection<AccountsDronesEntity> accountsDrones = new HashSet<>();

    @OneToMany(mappedBy = "accountsByAccountsId", fetch = FetchType.LAZY)
    private Collection<AccountsGalaxygatesEntity> accountsGalaxygates = new HashSet<>();

    @OneToMany(mappedBy = "accountsByAccountsId", fetch = FetchType.LAZY)
    private Collection<AccountsHangarsEntity> accountsHangars = new HashSet<>();

    @OneToMany(mappedBy = "accountsByAccountsId", fetch = FetchType.LAZY)
    private Collection<AccountsHistoryEntity> accountsHistories = new HashSet<>();

    @OneToMany(mappedBy = "accountsByAccountsId", fetch = FetchType.EAGER)
    private Collection<AccountsItemsEntity> accountsItems = new HashSet<>();

    @OneToMany(mappedBy = "accountsByFromAccountsId", fetch = FetchType.LAZY)
    private Collection<AccountsMessagesEntity> fromAccountsMessages = new HashSet<>();

    @OneToMany(mappedBy = "accountsByToAccountsId", fetch = FetchType.LAZY)
    private Collection<AccountsMessagesEntity> toAccountsMessages = new HashSet<>();

    @OneToMany(mappedBy = "accountsByAccountsId", fetch = FetchType.LAZY)
    private Collection<AccountsPetsEntity> accountsPets = new HashSet<>();

    @OneToMany(mappedBy = "accountsByAccountsId", fetch = FetchType.LAZY)
    private Collection<AccountsQuestsEntity> accountsQuests = new HashSet<>();

    @OneToMany(mappedBy = "accountsByAccountsId", fetch = FetchType.LAZY)
    private Collection<AccountsRankingsEntity> accountsRankings = new HashSet<>();

    @OneToMany(mappedBy = "accountsByAccountsId", fetch = FetchType.EAGER)
    private Collection<AccountsSettingsEntity> accountsSettings = new HashSet<>();

    @OneToMany(mappedBy = "accountsByAccountsId", fetch = FetchType.LAZY)
    private Collection<AccountsShipsEntity> accountsShips = new HashSet<>();

    @OneToMany(mappedBy = "accountsByAccountsId", fetch = FetchType.LAZY)
    private Collection<AccountsSkillsEntity> accountsSkills = new HashSet<>();

    @OneToMany(mappedBy = "accountsByAccountsId", fetch = FetchType.LAZY)
    private Collection<AccountsSkylabsEntity> accountsSkylabs = new HashSet<>();

    @OneToMany(mappedBy = "accountsByAccountsId", fetch = FetchType.LAZY)
    private Collection<AccountsTechfactoriesEntity> accountsTechfactories = new HashSet<>();

    @OneToMany(mappedBy = "accountsByAccountsId", fetch = FetchType.LAZY)
    private Collection<AccountsTechfactoryItemsEntity> accountsTechfactoryItems = new HashSet<>();

    @OneToMany(mappedBy = "accountsByAccountsId", fetch = FetchType.LAZY)
    private Collection<ClansApplicationsEntity> clansApplications = new HashSet<>();

    @ManyToMany
    @JoinTable(
            name = "accounts_clans_roles",
            joinColumns = @JoinColumn(name = "accounts_id"),
            inverseJoinColumns = @JoinColumn(name = "clans_roles_id")
    )
    private Collection<ClansRolesEntity> clansRoles = new HashSet<>();

    /**
     * Adds an item to the account.
     *
     * @param item Item to add.
     */
    public void addItem(AccountsItemsEntity item) {
        this.accountsItems.add(item);
        item.setAccountsByAccountsId(this);
    }

    /**
     * Adds a ship to the account.
     *
     * @param ship Ship to add.
     */
    public void addShip(AccountsShipsEntity ship) {
        this.accountsShips.add(ship);
        ship.setAccountsByAccountsId(this);
    }

    /**
     * Adds an hangar to the account.
     *
     * @param hangar Hangar to add.
     */
    public void addHangar(AccountsHangarsEntity hangar) {
        this.accountsHangars.add(hangar);
        hangar.setAccountsByAccountsId(this);
    }

    /**
     * Adds a setting to the account.
     *
     * @param setting Setting to add.
     */
    public void addSetting(AccountsSettingsEntity setting) {
        this.accountsSettings.add(setting);
        setting.setAccountsByAccountsId(this);
    }
}
