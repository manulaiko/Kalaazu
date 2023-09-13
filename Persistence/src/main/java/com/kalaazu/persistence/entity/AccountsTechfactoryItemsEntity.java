package com.kalaazu.persistence.entity;

import jakarta.persistence.*;
import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;

import java.sql.Timestamp;

/**
 * Accounts techfactory items entity.
 * ==================================
 * <p>
 * Entity for the `accounts_techfactory_items` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "accounts_techfactory_items", schema = "kalaazu")
@Data
public class AccountsTechfactoryItemsEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private int id;

    @Basic
    @Column(name = "amount", nullable = false)
    private short amount = 1;

    @Basic
    @Column(name = "date")
    @CreationTimestamp
    private Timestamp date;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "accounts_id", referencedColumnName = "id", nullable = false)
    private AccountsEntity accountsByAccountsId;

    @Basic
    @Column(name= "accounts_id", nullable = false, insertable = false, updatable = false)
    private int accountsId = 0;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "techfactory_items_id", referencedColumnName = "id", nullable = false)
    private TechfactoryItemsEntity techfactoryItemsByTechfactoryItemsId;

    @Basic
    @Column(name= "techfactory_items_id", nullable = false, insertable = false, updatable = false)
    private byte rechfactoryItemsId = 0;
}
