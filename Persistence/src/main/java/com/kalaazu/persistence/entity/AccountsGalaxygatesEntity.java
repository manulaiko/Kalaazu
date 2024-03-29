package com.kalaazu.persistence.entity;

import jakarta.persistence.*;
import lombok.Data;

/**
 * Accounts galaxygates entity.
 * ============================
 * <p>
 * Entity for the `accounts_galaxygates` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "accounts_galaxygates", schema = "kalaazu")
@Data
public class AccountsGalaxygatesEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private int id;

    @Basic
    @Column(name = "parts", nullable = false)
    private byte parts = 0;

    @Basic
    @Column(name = "lifes", nullable = false)
    private byte lifes = -1;

    @Basic
    @Column(name = "wave", nullable = false)
    private byte wave = -1;

    @Basic
    @Column(name = "times", nullable = false)
    private short times = 0;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "accounts_id", referencedColumnName = "id", nullable = false)
    private AccountsEntity accountsByAccountsId;

    @Basic
    @Column(name= "accounts_id", nullable = false, insertable = false, updatable = false)
    private int accountsId = 0;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "galaxygates_id", referencedColumnName = "id", nullable = false)
    private GalaxygatesEntity galaxygatesByGalaxygatesId;

    @Basic
    @Column(name= "galaxygates_id", nullable = false, insertable = false, updatable = false)
    private byte galaxygatesId = 0;
}
