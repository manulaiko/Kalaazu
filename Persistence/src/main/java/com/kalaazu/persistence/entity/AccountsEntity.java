package com.kalaazu.persistence.entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;

import java.sql.Timestamp;
import java.time.Duration;
import java.time.Instant;
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
@Getter
@Setter
@NoArgsConstructor
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
    @Column(name = "users_id", nullable = false, insertable = false, updatable = false)
    private int usersId = 0;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "levels_id", referencedColumnName = "id", nullable = false)
    private LevelsEntity levelsByLevelsId;

    @Basic
    @Column(name = "levels_id", nullable = false, insertable = false, updatable = false)
    private byte levelsId = 0;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "factions_id", referencedColumnName = "id")
    private FactionsEntity factionsByFactionsId;

    @Basic
    @Column(name = "factions_id", insertable = false, updatable = false)
    private Byte factionsId = 0;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "accounts_hangars_id", referencedColumnName = "id")
    private AccountsHangarsEntity accountsHangarsByAccountsHangarsId;

    @Basic
    @Column(name = "accounts_hangars_id", insertable = false, updatable = false)
    private Integer accountsHangarsId = 0;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "clans_id", referencedColumnName = "id")
    private ClansEntity clansByClansId;

    @Basic
    @Column(name = "clans_id", insertable = false, updatable = false)
    private Integer clansId = 0;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ranks_id", referencedColumnName = "id", nullable = false)
    private RanksEntity ranksByRanksId;

    @Basic
    @Column(name = "ranks_id", nullable = false, insertable = false, updatable = false)
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

    @OneToMany(mappedBy = "accountsByAccountsId", fetch = FetchType.EAGER)
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

    @Transient
    private CalculatedItems calculatedItems;

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

    /**
     * Checks if the premium subscription is active.
     *
     * @return Whether the account is premium or not.
     */
    public boolean isPremium() {
        return this.getPremiumDate() != null && this.getPremiumDate().before(Timestamp.from(Instant.now()));
    }

    public CalculatedItems getCalculatedItems() {
        if (this.calculatedItems != null) {
            return this.calculatedItems;
        }

        // Stats
        var exp = 0L;
        var hon = 0L;
        var cre = 0L;
        var uri = 0L;
        var jpt = 0L;

        var cargo = 0L;
        var ammo = 0L;
        var rockets = 0L;
        var hellstorm = 0L;
        var mines = 0L;

        var lcb10 = 0L;
        var mcb25 = 0L;
        var mcb50 = 0L;
        var ucb100 = 0L;
        var sab50 = 0L;
        var rsb75 = 0L;

        var r310 = 0L;
        var plt2026 = 0L;
        var plt2021 = 0L;
        var plt3030 = 0L;
        var pld8 = 0L;
        var dcr_250 = 0L;
        var wiz = 0L;
        var mine = 0L;
        var smartbomb = 0L; // TODO add accounts.config.hasExtra()
        var instashield = 0L; // "
        var emp = 0L;
        var mine_emp = 0L;
        var mine_sab = 0L;
        var mine_ddm = 0L;

        var energyLeechArrayStatus = 0L;
        var energyLeechArrayAmount = 0L;
        var energyLeechArraySecondsLeft = 0L;

        var energyChainImpulseStatus = 0L;
        var energyChainImpulseAmount = 0L;
        var energyChainImpulseSecondsLeft = 0L;

        var rocketProbabilityMaximizerStatus = 0L;
        var rocketProbabilityMaximizerAmount = 0L;
        var rocketProbabilityMaximizerSecondsLeft = 0L;

        var shieldBackupStatus = 0L;
        var shieldBackupAmount = 0L;
        var shieldBackupSecondsLeft = 0L;

        var battleRepairBotStatus = 0L;
        var battleRepairBotAmount = 0L;
        var battleRepairBotSecondsLeft = 0L;

        var speedLeechStatus = 0L;
        var speedLeechAmount = 0L;
        var speedLeechSecondsLeft = 0L;

        var clingingImpulseDroneStatus = 0L;
        var clingingImpulseDroneAmount = 0L;
        var clingingImpulseDroneSecondsLeft = 0L;

        for (var item : this.getAccountsItems()) {
            var i = item.getItemsByItemsId();
            var amount = item.getAmount();

            switch (i.getLootId()) {
                case "currency_credits" -> cre = amount;
                case "currency_uridium" -> uri = amount;
                case "currency_jackpot" -> jpt = amount;
                case "stats_experience" -> exp = amount;
                case "stats_honor" -> hon = amount;

                case "ammunition_laser_lcb-10" -> lcb10 = amount;
                case "ammunition_laser_mcb-25" -> mcb25 = amount;
                case "ammunition_laser_mcb-50" -> mcb50 = amount;
                case "ammunition_laser_sab-50" -> sab50 = amount;
                case "ammunition_laser_ucb-100" -> ucb100 = amount;
                case "ammunition_laser_rsb-75" -> rsb75 = amount;

                case "ammunition_rocket_r-310" -> r310 = amount;
                case "ammunition_rocket_plt-2021" -> plt2021 = amount;
                case "ammunition_rocket_plt-2026" -> plt2026 = amount;
                case "ammunition_rocket_plt-3030" -> plt3030 = amount;
                case "ammunition_specialammo_dcr-250" -> dcr_250 = amount;
                case "ammunition_specialammo_pld-8" -> pld8 = amount;
                case "ammunition_specialammo_wiz-x" -> wiz = amount;
                case "ammunition_mine_acm-01" -> mine = amount;
                case "ammunition_mine_ddm-01" -> mine_ddm = amount;
                case "ammunition_mine_empm-01" -> mine_emp = amount;
                case "ammunition_mine_sabm-01" -> mine_sab = amount;
                case "ammunition_specialammo_emp-01" -> emp = amount;
            }

            switch (i.getType()) {
                case ItemType.RESOURCE:
                    if (i.getId() != 309) { // not xenomit
                        cargo += amount;
                    }
                case ItemType.LASER_AMMO:
                    ammo += amount;
                case ItemType.ROCKET:
                    rockets += amount;
                case ItemType.HELLSTORM_ROCKET:
                    hellstorm += amount;
                case ItemType.MINE:
                    mines += amount;
            }
        }

        for (var item : this.getAccountsTechfactoryItems()) {
            var a = item.getAmount();
            var s = item.getStatus();
            var t = getTechItemSecondsLeft(item);

            switch (item.getTechfactoryItemsId()) {
                case 1 -> {
                    energyLeechArrayAmount = a;
                    energyLeechArrayStatus = s;
                    energyLeechArraySecondsLeft = t;
                }
                case 2 -> {
                    energyChainImpulseAmount = a;
                    energyChainImpulseStatus = s;
                    energyChainImpulseSecondsLeft = t;
                }
                case 3 -> {
                    rocketProbabilityMaximizerAmount = a;
                    rocketProbabilityMaximizerStatus = s;
                    rocketProbabilityMaximizerSecondsLeft = t;
                }
                case 4 -> {
                    shieldBackupAmount = a;
                    shieldBackupStatus = s;
                    shieldBackupSecondsLeft = t;
                }
                case 5 -> {
                    battleRepairBotAmount = a;
                    battleRepairBotStatus = s;
                    battleRepairBotSecondsLeft = t;
                }
                case 6 -> {
                    speedLeechAmount = a;
                    speedLeechStatus = s;
                    speedLeechSecondsLeft = t;
                }
                case 7 -> {
                    clingingImpulseDroneAmount = a;
                    clingingImpulseDroneStatus = s;
                    clingingImpulseDroneSecondsLeft = t;
                }
            }
        }

        this.calculatedItems = new CalculatedItems(
                exp,
                hon,
                cre,
                uri,
                jpt,

                cargo,
                ammo,
                rockets,
                hellstorm,
                mines,

                lcb10,
                mcb25,
                mcb50,
                ucb100,
                sab50,
                rsb75,

                r310,
                plt2026,
                plt2021,
                plt3030,
                pld8,
                dcr_250,
                wiz,
                mine,
                smartbomb,
                instashield,
                emp,
                mine_emp,
                mine_sab,
                mine_ddm,

                energyLeechArrayStatus,
                energyLeechArrayAmount,
                energyLeechArraySecondsLeft,

                energyChainImpulseStatus,
                energyChainImpulseAmount,
                energyChainImpulseSecondsLeft,

                rocketProbabilityMaximizerStatus,
                rocketProbabilityMaximizerAmount,
                rocketProbabilityMaximizerSecondsLeft,

                shieldBackupStatus,
                shieldBackupAmount,
                shieldBackupSecondsLeft,

                battleRepairBotStatus,
                battleRepairBotAmount,
                battleRepairBotSecondsLeft,

                speedLeechStatus,
                speedLeechAmount,
                speedLeechSecondsLeft,

                clingingImpulseDroneStatus,
                clingingImpulseDroneAmount,
                clingingImpulseDroneSecondsLeft
        );

        return this.calculatedItems;
    }

    public CalculatedItems recalculateItems() {
        this.calculatedItems = null;

        return this.getCalculatedItems();
    }

    private long getTechItemSecondsLeft(AccountsTechfactoryItemsEntity item) {
        var now = Instant.now();
        var timerEnd = item.getDate().toInstant().plusSeconds(item.getTechfactoryItemsByTechfactoryItemsId().getCooldown());

        var remaining = Duration.between(now, timerEnd).getSeconds();

        return Math.max(remaining, 0);
    }

    public record CalculatedItems(
            long exp,
            long hon,
            long cre,
            long uri,
            long jpt,

            long cargo,
            long ammo,
            long rockets,
            long hellstorm,
            long mines,

            long lcb10,
            long mcb25,
            long mcb50,
            long ucb100,
            long sab50,
            long rsb75,


            long r310,
            long plt2026,
            long plt2021,
            long plt3030,
            long pld8,
            long dcr_250,
            long wiz,
            long mine,
            long smartbomb,
            long instashield,
            long emp,
            long mine_emp,
            long mine_sab,
            long mine_ddm,

            long energyLeechArrayStatus,
            long energyLeechArrayAmount,
            long energyLeechArraySecondsLeft,

            long energyChainImpulseStatus,
            long energyChainImpulseAmount,
            long energyChainImpulseSecondsLeft,

            long rocketProbabilityMaximizerStatus,
            long rocketProbabilityMaximizerAmount,
            long rocketProbabilityMaximizerSecondsLeft,

            long shieldBackupStatus,
            long shieldBackupAmount,
            long shieldBackupSecondsLeft,

            long battleRepairBotStatus,
            long battleRepairBotAmount,
            long battleRepairBotSecondsLeft,

            long speedLeechStatus,
            long speedLeechAmount,
            long speedLeechSecondsLeft,

            long clingingImpulseDroneStatus,
            long clingingImpulseDroneAmount,
            long clingingImpulseDroneSecondsLeft
    ) {
    }
}
