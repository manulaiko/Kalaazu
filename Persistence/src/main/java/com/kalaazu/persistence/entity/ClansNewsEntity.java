package com.kalaazu.persistence.entity;

import jakarta.persistence.*;
import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;

import java.sql.Timestamp;

/**
 * Clans news entity.
 * ==================
 * <p>
 * Entity for the `clans_news` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "clans_news", schema = "kalaazu")
@Data
public class ClansNewsEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private int id;

    @Basic
    @Column(name = "date", nullable = false)
    @CreationTimestamp
    private Timestamp date;

    @Basic
    @Column(name = "text", nullable = false, length = -1, columnDefinition = "TEXT")
    private String text;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "accounts_id", referencedColumnName = "id", nullable = false)
    private AccountsEntity accountsByAccountsId;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "clans_id", referencedColumnName = "id", nullable = false)
    private ClansEntity clansByClansId;
}
