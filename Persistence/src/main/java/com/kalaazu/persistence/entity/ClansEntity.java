package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.Collection;

/**
 * Clans entity.
 * =============
 *
 * Entity for the `clans` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "clans", schema = "kalaazu")
@Data
public class ClansEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private int id;

    @Basic
    @Column(name = "tag", nullable = false, length = 4)
    private String tag = "";

    @Basic
    @Column(name = "name", nullable = false)
    private String name = "";

    @Basic
    @Column(name = "description", nullable = false, length = -1, columnDefinition = "TEXT")
    private String description;

    @Basic
    @Column(name = "logo", nullable = false)
    private String logo = "";

    @Basic
    @Column(name = "status", nullable = false)
    @Enumerated(EnumType.ORDINAL)
    private ClanStatus status = ClanStatus.RECRUITING;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "accounts_id", referencedColumnName = "id", nullable = false)
    private AccountsEntity accountsByAccountsId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "factions_id", referencedColumnName = "id")
    private FactionsEntity factionsByFactionsId;

    @OneToMany(mappedBy = "clansByClansId", fetch = FetchType.LAZY)
    private Collection<AccountsEntity> accounts;

    @OneToMany(mappedBy = "clansByClansId", fetch = FetchType.LAZY)
    private Collection<ClansBanksEntity> clansBanks;

    @OneToMany(mappedBy = "clansByClansId", fetch = FetchType.LAZY)
    private Collection<ClansBattlestationsEntity> clansBattlestations;

    @OneToMany(mappedBy = "clansByClansId", fetch = FetchType.LAZY)
    private Collection<ClansMessagesEntity> clansMessages;

    @OneToMany(mappedBy = "clansByClansId", fetch = FetchType.LAZY)
    private Collection<ClansNewsEntity> clansNews;

    @OneToMany(mappedBy = "clansByClansId", fetch = FetchType.LAZY)
    private Collection<ClansRankingEntity> clansRankings;

    @OneToMany(mappedBy = "clansByClansId", fetch = FetchType.LAZY)
    private Collection<ClansRankingEntity> clansRanking;
}
