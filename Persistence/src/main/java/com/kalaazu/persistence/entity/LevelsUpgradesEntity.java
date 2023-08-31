package com.kalaazu.persistence.entity;

import jakarta.persistence.*;
import lombok.Data;

/**
 * Levels upgrades entity.
 * =======================
 * <p>
 * Entity for the `levels_upgrades` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "levels_upgrades", schema = "kalaazu")
@Data
public class LevelsUpgradesEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private int id;

    @Basic
    @Column(name = "probability", nullable = false)
    private byte probability = 5;

    @Basic
    @Column(name = "credits", nullable = false)
    private int credits = 0;

    @Basic
    @Column(name = "uridium", nullable = false)
    private short uridium = 0;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "levels_id", referencedColumnName = "id", nullable = false)
    private LevelsEntity levelsByLevelsId;
}
