package com.kalaazu.persistence.entity;

import jakarta.persistence.*;
import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;

import java.sql.Timestamp;

/**
 * Clans messages entity.
 * ======================
 * <p>
 * Entity for the `clans_messages` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "clans_messages", schema = "kalaazu")
@Data
public class ClansMessagesEntity {
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
    @Column(name = "title", nullable = false)
    private String title = "";

    @Basic
    @Column(name = "text", nullable = false, length = -1, columnDefinition = "TEXT")
    private String text;

    @Basic
    @Column(name = "date", nullable = false)
    @CreationTimestamp
    private Timestamp date;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "clans_id", referencedColumnName = "id", nullable = false)
    private ClansEntity clansByClansId;

    @Basic
    @Column(name= "clans_id", nullable = false, insertable = false, updatable = false)
    private int clansId = 0;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "from_accounts_id", referencedColumnName = "id", nullable = false)
    private AccountsEntity accountsByFromAccountsId;

    @Basic
    @Column(name= "from_accounts_id", nullable = false, insertable = false, updatable = false)
    private int fromAccountsId = 0;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "to_accounts_id", referencedColumnName = "id")
    private AccountsEntity accountsByToAccountsId;

    @Basic
    @Column(name= "to_accounts_id", insertable = false, updatable = false)
    private Integer toAccountsId = 0;
}
