package com.kalaazu.persistence.entity;

import jakarta.persistence.*;
import lombok.Data;

/**
 * Accounts ships entity.
 * ======================
 * <p>
 * Entity for the `accounts_ships` entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "accounts_ships", schema = "kalaazu")
@Data
public class AccountsShipsEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private int id;

    @Basic
    @Column(name = "position", nullable = false)
    private long position = 0;

    @Basic
    @Column(name = "health", nullable = false)
    private int health = 0;

    @Basic
    @Column(name = "nanohull", nullable = false)
    private int nanohull = 0;

    @Basic
    @Column(name = "gfx", nullable = false)
    private byte gfx = 0;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "accounts_id", referencedColumnName = "id", nullable = false)
    private AccountsEntity accountsByAccountsId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ships_id", referencedColumnName = "id", nullable = false)
    private ShipsEntity shipsByShipsId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "maps_id", referencedColumnName = "id", nullable = false)
    private MapsEntity mapsByMapsId;
}
