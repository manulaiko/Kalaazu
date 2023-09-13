package com.kalaazu.persistence.entity;

import jakarta.persistence.*;
import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;

import java.sql.Timestamp;

/**
 * Clans banks logs entity.
 * =========================
 * <p>
 * Entity for the `clans_banks_logs` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "clans_banks_logs", schema = "kalaazu")
@Data
public class ClansBanksLogsEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private int id;

    @Basic
    @Column(name = "date", nullable = false)
    @CreationTimestamp
    private Timestamp date;

    @Basic
    @Column(name = "type", nullable = false)
    @Enumerated(EnumType.ORDINAL)
    private BanksLogType type = BanksLogType.WITHDRAW;

    @Basic
    @Column(name = "amount", nullable = false)
    private int amount = 0;

    @Basic
    @Column(name = "currency", nullable = false)
    @Enumerated(EnumType.ORDINAL)
    private CurrencyType currency = CurrencyType.CREDITS;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "clans_banks_id", referencedColumnName = "id", nullable = false)
    private ClansBanksEntity clansBanksByClansBanksId;

    @Basic
    @Column(name= "clans_banks_id", nullable = false, insertable = false, updatable = false)
    private int clansBanksId = 0;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "from_accounts_id", referencedColumnName = "id", nullable = false)
    private AccountsEntity accountsByFromAccountsId;

    @Basic
    @Column(name= "from_accounts_id", nullable = false, insertable = false, updatable = false)
    private int fromAccountsId = 0;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "to_accounts_id", referencedColumnName = "id", nullable = false)
    private AccountsEntity accountsByToAccountsId;

    @Basic
    @Column(name= "to_accounts_id", nullable = false, insertable = false, updatable = false)
    private int toAccountsId = 0;
}
