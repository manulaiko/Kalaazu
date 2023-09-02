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

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "accounts_id", referencedColumnName = "id", nullable = false)
    private AccountsEntity accountsByAccountsId;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "techfactory_items_id", referencedColumnName = "id", nullable = false)
    private TechfactoryItemsEntity techfactoryItemsByTechfactoryItemsId;
}
