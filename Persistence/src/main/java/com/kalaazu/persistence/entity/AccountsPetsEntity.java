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
    private String name = "";

    @Basic
    @Column(name = "experience", nullable = false)
    private int experience = 0;

    @Basic
    @Column(name = "fuel", nullable = false)
    private int fuel = 0;

    @Basic
    @Column(name = "health", nullable = false)
    private int health = 0;

    @Basic
    @Column(name = "slots_lasers_total", nullable = false)
    private byte slotsLasersTotal = 1;

    @Basic
    @Column(name = "slots_lasers_available", nullable = false)
    private byte slotsLasersAvailable = 1;

    @Basic
    @Column(name = "slots_generators_total", nullable = false)
    private byte slotsGeneratorsTotal = 2;

    @Basic
    @Column(name = "slots_generators_available", nullable = false)
    private byte slotsGeneratorsAvailable = 2;

    @Basic
    @Column(name = "slots_protocols_total", nullable = false)
    private byte slotsProtocolsTotal = 2;

    @Basic
    @Column(name = "slots_protocols_available", nullable = false)
    private byte slotsProtocolsAvailable = 2;

    @Basic
    @Column(name = "slots_gears_total", nullable = false)
    private byte slotsGearsTotal = 1;

    @Basic
    @Column(name = "slots_gears_available", nullable = false)
    private byte slotsGearsAvailable = 1;

    @ManyToOne
    @JoinColumn(name = "accounts_id", referencedColumnName = "id", nullable = false)
    private AccountsEntity accountsByAccountsId;

    @ManyToOne
    @JoinColumn(name = "levels_id", referencedColumnName = "id", nullable = false)
    private LevelsEntity levelsByLevelsId;
}
