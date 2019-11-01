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
 * @author Manulaiko <manulaiko@gmial.com>
 */
@Entity
@Table(name = "clans_messages", schema = "kalaazu")
@Data
public class ClansMessagesEntity {
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
    @Column(name = "title", nullable = false)
    private String title;

    @Basic
    @Column(name = "text", nullable = false, length = -1)
    private String text;

    @Basic
    @Column(name = "date", nullable = false)
    private Timestamp date;

    @ManyToOne
    @JoinColumn(name = "clans_id", referencedColumnName = "id", nullable = false)
    private ClansEntity clansByClansId;

    @ManyToOne
    @JoinColumn(name = "from_accounts_id", referencedColumnName = "id", nullable = false)
    private AccountsEntity accountsByFromAccountsId;

    @ManyToOne
    @JoinColumn(name = "to_accounts_id", referencedColumnName = "id")
    private AccountsEntity accountsByToAccountsId;
}
