package com.kalaazu.persistence.entity;

import jakarta.persistence.*;
import lombok.Data;

/**
 * Trade items entity.
 * ===================
 * <p>
 * Entity for the `trade_items` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "trade_items", schema = "kalaazu")
@Data
public class TradeItemsEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private short id;

    @Basic
    @Column(name = "price", nullable = false)
    private int price = 0;

    @Basic
    @Column(name = "type", nullable = false)
    @Enumerated(EnumType.ORDINAL)
    private TradeType type = TradeType.HOURLY;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "items_id", referencedColumnName = "id", nullable = false)
    private ItemsEntity itemsByItemsId;

    @Basic
    @Column(name = "items_id", nullable = false, insertable = false, updatable = false)
    private short itemsId = 0;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "accounts_id", referencedColumnName = "id")
    private AccountsEntity accountsByAccountsId;

    @Basic
    @Column(name = "accounts_id", insertable = false, updatable = false)
    private Integer accountsId = 0;
}
