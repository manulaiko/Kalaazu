package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.Collection;

/**
 * Account bank entity.
 * ====================
 *
 * Represents an entity from the `accounts_banks` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "accounts_banks", schema = "kalaazu")
@Data
public class AccountsBanksEntity {
    @Id
    @Column(name = "id", nullable = false)
    private int id;

    @Basic
    @Column(name = "credits", nullable = false)
    private long credits = 0;

    @Basic
    @Column(name = "uridium", nullable = false)
    private long uridium = 0;

    @Basic
    @Column(name = "tax_credits", nullable = false)
    private byte taxCredits = 5;

    @Basic
    @Column(name = "tax_uridium", nullable = false)
    private byte taxUridium = 0;

    @ManyToOne
    @JoinColumn(name = "accounts_id", referencedColumnName = "id", nullable = false)
    private AccountsEntity accountsByAccountsId;

    @OneToMany(mappedBy = "accountsBanksByAccountsBanksId")
    private Collection<AccountsBanksLogsEntity> accountsBanksLogs;
}
