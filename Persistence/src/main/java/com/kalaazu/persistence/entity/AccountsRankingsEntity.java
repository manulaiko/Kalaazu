package com.kalaazu.persistence.entity;

import jakarta.persistence.*;
import lombok.Data;

/**
 * Accounts rankings entity.
 * =========================
 * <p>
 * Entity for the `accounts_rankings` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "accounts_rankings", schema = "kalaazu")
@Data
public class AccountsRankingsEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private int id;

    @Basic
    @Column(name = "points", nullable = false)
    private int points = 0;

    @Basic
    @Column(name = "best_points", nullable = false)
    private int bestPoints = 0;

    @Basic
    @Column(name = "destroyed_allies", nullable = false)
    private short destroyedAllies = 0;

    @Basic
    @Column(name = "destroyed_phoenix", nullable = false)
    private short destroyedPhoenix = 0;

    @Basic
    @Column(name = "destroyed_times", nullable = false)
    private short destroyedTimes = 0;

    @Basic
    @Column(name = "destroyed_radiation", nullable = false)
    private short destroyedRadiation = 0;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "accounts_id", referencedColumnName = "id", nullable = false)
    private AccountsEntity accountsByAccountsId;
}
