package com.kalaazu.persistence.entity;

import jakarta.persistence.*;
import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;

import java.sql.Timestamp;

/**
 * Accounts items entity.
 * ======================
 * <p>
 * Entity for the `accounts_items` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "accounts_items", schema = "kalaazu")
@Data
public class AccountsItemsEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private int id;

    @Basic
    @Column(name = "date", nullable = false)
    @CreationTimestamp
    private Timestamp date;

    @Basic
    @Column(name = "amount", nullable = false)
    private long amount = 1;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "accounts_id", referencedColumnName = "id", nullable = false)
    private AccountsEntity accountsByAccountsId;

    @Basic
    @Column(name= "accounts_id", nullable = false, insertable = false, updatable = false)
    private int accountsId = 0;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "items_id", referencedColumnName = "id", nullable = false)
    private ItemsEntity itemsByItemsId;

    @Basic
    @Column(name= "items_id", nullable = false, insertable = false, updatable = false)
    private short itemsId = 0;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "levels_id", referencedColumnName = "id", nullable = false)
    private LevelsEntity levelsByLevelsId;

    @Basic
    @Column(name= "levels_id", nullable = false, insertable = false, updatable = false)
    private byte levelsId = 0;
}
