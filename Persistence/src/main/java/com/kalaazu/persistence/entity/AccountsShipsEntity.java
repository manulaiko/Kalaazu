package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;

/**
 * Accounts ships entity.
 * ======================
 *
 * Entity for the `accounts_ships` entity.
 *
 * @author Manulaiko <manulaiko@gmial.com>
 */
@Entity
@Table(name = "accounts_ships", schema = "kalaazu")
@Data
public class AccountsShipsEntity {
    @Id
    @Column(name = "id", nullable = false)
    private int id;

    @Basic
    @Column(name = "position", nullable = false)
    private long position;

    @Basic
    @Column(name = "health", nullable = false)
    private int health;

    @Basic
    @Column(name = "nanohull", nullable = false)
    private int nanohull;

    @Basic
    @Column(name = "gfx", nullable = false)
    private byte gfx;

    @ManyToOne
    @JoinColumn(name = "accounts_id", referencedColumnName = "id", nullable = false)
    private AccountsEntity accountsByAccountsId;

    @ManyToOne
    @JoinColumn(name = "ships_id", referencedColumnName = "id", nullable = false)
    private ShipsEntity shipsByShipsId;

    @ManyToOne
    @JoinColumn(name = "maps_id", referencedColumnName = "id", nullable = false)
    private MapsEntity mapsByMapsId;
}
