package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;

/**
 * Accounts rankings entity.
 * =========================
 *
 * Entity for the `accounts_rankings` table.
 *
 * @author Manulaiko <manulaiko@gmial.com>
 */
@Entity
@Table(name = "accounts_rankings", schema = "kalaazu")
@Data
public class AccountsRankingsEntity {
    @Id
    @Column(name = "id", nullable = false)
    private int id;

    @Basic
    @Column(name = "points", nullable = false)
    private int points;

    @Basic
    @Column(name = "best_points", nullable = false)
    private int bestPoints;

    @Basic
    @Column(name = "destroyed_allies", nullable = false)
    private short destroyedAllies;

    @Basic
    @Column(name = "destroyed_phoenix", nullable = false)
    private short destroyedPhoenix;

    @Basic
    @Column(name = "destroyed_times", nullable = false)
    private short destroyedTimes;

    @Basic
    @Column(name = "destroyed_radiation", nullable = false)
    private short destroyedRadiation;

    @ManyToOne
    @JoinColumn(name = "accounts_id", referencedColumnName = "id", nullable = false)
    private AccountsEntity accountsByAccountsId;
}
