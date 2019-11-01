package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;

/**
 * Accounts pets entity.
 * =====================
 *
 * Entity for the `accounts_pets` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "accounts_pets", schema = "kalaazu")
@Data
public class AccountsPetsEntity {
    @Id
    @Column(name = "id", nullable = false)
    private int id;

    @Basic
    @Column(name = "name", nullable = false)
    private String name;

    @Basic
    @Column(name = "experience", nullable = false)
    private int experience;

    @Basic
    @Column(name = "fuel", nullable = false)
    private int fuel;

    @Basic
    @Column(name = "health", nullable = false)
    private int health;

    @Basic
    @Column(name = "slots_lasers_total", nullable = false)
    private byte slotsLasersTotal;

    @Basic
    @Column(name = "slots_lasers_available", nullable = false)
    private byte slotsLasersAvailable;

    @Basic
    @Column(name = "slots_generators_total", nullable = false)
    private byte slotsGeneratorsTotal;

    @Basic
    @Column(name = "slots_generators_available", nullable = false)
    private byte slotsGeneratorsAvailable;

    @Basic
    @Column(name = "slots_protocols_total", nullable = false)
    private byte slotsProtocolsTotal;

    @Basic
    @Column(name = "slots_protocols_available", nullable = false)
    private byte slotsProtocolsAvailable;

    @Basic
    @Column(name = "slots_gears_total", nullable = false)
    private byte slotsGearsTotal;

    @Basic
    @Column(name = "slots_gears_available", nullable = false)
    private byte slotsGearsAvailable;

    @ManyToOne
    @JoinColumn(name = "accounts_id", referencedColumnName = "id", nullable = false)
    private AccountsEntity accountsByAccountsId;

    @ManyToOne
    @JoinColumn(name = "levels_id", referencedColumnName = "id", nullable = false)
    private LevelsEntity levelsByLevelsId;
}
