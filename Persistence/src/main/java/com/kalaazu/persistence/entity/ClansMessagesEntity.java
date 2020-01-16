package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Clans messages entity.
 * ======================
 *
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
    private Timestamp date;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "clans_id", referencedColumnName = "id", nullable = false)
    private ClansEntity clansByClansId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "from_accounts_id", referencedColumnName = "id", nullable = false)
    private AccountsEntity accountsByFromAccountsId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "to_accounts_id", referencedColumnName = "id")
    private AccountsEntity accountsByToAccountsId;
}
