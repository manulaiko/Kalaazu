package com.kalaazu.persistence.entity;

import jakarta.persistence.*;
import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;

import java.sql.Timestamp;

/**
 * Accounts messages entity.
 * =========================
 * <p>
 * Entity for the `accounts_messages` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "accounts_messages", schema = "kalaazu")
@Data
public class AccountsMessagesEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private int id;

    @Basic
    @Column(name = "from_status", nullable = false)
    @Enumerated(EnumType.ORDINAL)
    private MessageStatus fromStatus = MessageStatus.UNREAD;

    @Basic
    @Column(name = "to_status", nullable = false)
    @Enumerated(EnumType.ORDINAL)
    private MessageStatus toStatus = MessageStatus.UNREAD;

    @Basic
    @Column(name = "date", nullable = false)
    @CreationTimestamp
    private Timestamp date;

    @Basic
    @Column(name = "title", nullable = false)
    private String title;

    @Basic
    @Column(name = "text", nullable = false, length = -1, columnDefinition = "TEXT")
    private String text;

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
