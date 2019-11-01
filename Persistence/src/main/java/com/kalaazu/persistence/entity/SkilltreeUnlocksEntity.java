package com.kalaazu.persistence.entity;

import javax.persistence.*;

/**
 * Skilltree unlocks entity.
 * =========================
 *
 * Entity for the `skilltree_unlocks` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "skilltree_unlocks", schema = "kalaazu")
public class SkilltreeUnlocksEntity {
    @Id
    @Column(name = "id", nullable = false)
    private short id;

    @ManyToOne
    @JoinColumn(name = "upgrade_skilltree_levels_id", referencedColumnName = "id", nullable = false)
    private SkilltreeLevelsEntity skilltreeLevelsByUpgradeSkilltreeLevelsId;

    @ManyToOne
    @JoinColumn(name = "required_skilltree_levels_id", referencedColumnName = "id", nullable = false)
    private SkilltreeLevelsEntity skilltreeLevelsByRequiredSkilltreeLevelsId;
}
