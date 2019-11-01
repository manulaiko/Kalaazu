package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;

/**
 * Trade items entity.
 * ===================
 *
 * Entity for the `trade_items` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "trade_items", schema = "kalaazu")
@Data
public class TradeItemsEntity {
    @Id
    @Column(name = "id", nullable = false)
    private short id;

    @Basic
    @Column(name = "price", nullable = false)
    private int price;

    @Basic
    @Column(name = "type", nullable = false)
    private byte type;

    @ManyToOne
    @JoinColumn(name = "items_id", referencedColumnName = "id", nullable = false)
    private ItemsEntity itemsByItemsId;

    @ManyToOne
    @JoinColumn(name = "accounts_id", referencedColumnName = "id")
    private AccountsEntity accountsByAccountsId;
}
