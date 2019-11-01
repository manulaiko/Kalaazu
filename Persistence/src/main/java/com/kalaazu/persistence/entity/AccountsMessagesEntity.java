package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Accounts messages entity.
 * =========================
 *
 * Entity for the `accounts_messages` table.
 *
 * @author Manulaiko <manulaiko@gmial.com>
 */
@Entity
@Table(name = "accounts_messages", schema = "kalaazu")
@Data
public class AccountsMessagesEntity {
    @Id
    @Column(name = "id", nullable = false)
    private int id;

    @Basic
    @Column(name = "from_status", nullable = false)
    private byte fromStatus;

    @Basic
    @Column(name = "to_status", nullable = false)
    private byte toStatus;

    @Basic
    @Column(name = "date", nullable = false)
    private Timestamp date;

    @Basic
    @Column(name = "title", nullable = false)
    private String title;

    @Basic
    @Column(name = "text", nullable = false, length = -1)
    private String text;

    @ManyToOne
    @JoinColumn(name = "from_accounts_id", referencedColumnName = "id", nullable = false)
    private AccountsEntity accountsByFromAccountsId;

    @ManyToOne
    @JoinColumn(name = "to_accounts_id", referencedColumnName = "id", nullable = false)
    private AccountsEntity accountsByToAccountsId;
}
