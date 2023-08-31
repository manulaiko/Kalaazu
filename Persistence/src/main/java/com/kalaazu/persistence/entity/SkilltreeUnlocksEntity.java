package com.kalaazu.persistence.entity;

import jakarta.persistence.*;
import lombok.Data;

/**
 * Skilltree unlocks entity.
 * =========================
 * <p>
 * Entity for the `skilltree_unlocks` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "skilltree_unlocks", schema = "kalaazu")
@Data
public class SkilltreeUnlocksEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private short id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "upgrade_skilltree_levels_id", referencedColumnName = "id", nullable = false)
    private SkilltreeLevelsEntity skilltreeLevelsByUpgradeSkilltreeLevelsId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "required_skilltree_levels_id", referencedColumnName = "id", nullable = false)
    private SkilltreeLevelsEntity skilltreeLevelsByRequiredSkilltreeLevelsId;
}
