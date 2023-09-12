package com.kalaazu.persistence.entity;

import com.kalaazu.math.Vector2;
import com.kalaazu.persistence.Vector2Type;
import jakarta.persistence.*;
import lombok.Data;
import org.hibernate.annotations.Type;

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
    @Type(value = Vector2Type.class)
    private Vector2 position = new Vector2(0L);

    @Basic
    @Column(name = "health", nullable = false)
    private int health = 0;

    @Basic
    @Column(name = "shield", nullable = false)
    private int shield = 0;

    @Basic
    @Column(name = "nanohull", nullable = false)
    private int nanohull = 0;

    @Basic
    @Column(name = "gfx", nullable = false)
    private byte gfx = 0;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "accounts_id", referencedColumnName = "id", nullable = false)
    private AccountsEntity accountsByAccountsId;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "ships_id", referencedColumnName = "id", nullable = false)
    private ShipsEntity shipsByShipsId;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "maps_id", referencedColumnName = "id", nullable = false)
    private MapsEntity mapsByMapsId;
}
