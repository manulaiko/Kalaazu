package com.kalaazu.persistence.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.util.Collection;

/**
 * Skilltree levels entity.
 * ========================
 * <p>
 * Entity for the `skilltree_levels` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "skilltree_levels", schema = "kalaazu")
@Data
public class SkilltreeLevelsEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private short id;

    @Basic
    @Column(name = "credits", nullable = false)
    private int credits = 10000;

    @Basic
    @Column(name = "seprom", nullable = false)
    private short seprom = 0;

    @Basic
    @Column(name = "points", nullable = false)
    private byte points = 1;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "skilltree_skills_id", referencedColumnName = "id", nullable = false)
    private SkilltreeSkillsEntity skilltreeSkillsBySkilltreeSkillsId;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "levels_id", referencedColumnName = "id", nullable = false)
    private LevelsEntity levelsByLevelsId;

    @OneToMany(mappedBy = "skilltreeLevelsByUpgradeSkilltreeLevelsId", fetch = FetchType.EAGER)
    private Collection<SkilltreeUnlocksEntity> skilltreeUnlocks;
}
