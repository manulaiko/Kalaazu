package com.kalaazu.persistence.entity;

import jakarta.persistence.*;
import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;

import java.sql.Timestamp;

/**
 * Clans battlestations items entity.
 * ==================================
 * <p>
 * Entity for the `clans_battlestations_items` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "clans_battlestations_items", schema = "kalaazu")
@Data
public class ClansBattlestationsItemsEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private int id;

    @Basic
    @Column(name = "slot", nullable = false)
    private byte slot = 1;

    @Basic
    @Column(name = "date", nullable = false)
    @CreationTimestamp
    private Timestamp date;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "clans_battlestations_id", referencedColumnName = "id", nullable = false)
    private ClansBattlestationsEntity clansBattlestationsByClansBattlestationsId;

    @Basic
    @Column(name= "clans_battlestations_id", nullable = false, insertable = false, updatable = false)
    private byte clansBattlestationsId = 0;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "accounts_items_id", referencedColumnName = "id", nullable = false)
    private AccountsItemsEntity accountsItemsByAccountsItemsId;

    @Basic
    @Column(name= "accounts_items_id", nullable = false, insertable = false, updatable = false)
    private int accountsItemsId = 0;
}
