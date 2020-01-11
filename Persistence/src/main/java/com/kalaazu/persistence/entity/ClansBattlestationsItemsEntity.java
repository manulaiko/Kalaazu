package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Clans battlestations items entity.
 * ==================================
 *
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
    private Timestamp date;

    @ManyToOne
    @JoinColumn(name = "clans_battlestations_id", referencedColumnName = "id", nullable = false)
    private ClansBattlestationsEntity clansBattlestationsByClansBattlestationsId;

    @ManyToOne
    @JoinColumn(name = "accounts_items_id", referencedColumnName = "id", nullable = false)
    private AccountsItemsEntity accountsItemsByAccountsItemsId;
}
