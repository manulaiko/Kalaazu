package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.Collection;

/**
 * Skilltree levels entity.
 * ========================
 *
 * Entity for the `skilltree_levels` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "skilltree_levels", schema = "kalaazu")
@Data
public class SkilltreeLevelsEntity {
    @Id
    @Column(name = "id", nullable = false)
    private short id;

    @Basic
    @Column(name = "credits", nullable = false)
    private int credits;

    @Basic
    @Column(name = "seprom", nullable = false)
    private short seprom;

    @Basic
    @Column(name = "points", nullable = false)
    private byte points;

    @ManyToOne
    @JoinColumn(name = "skilltree_skills_id", referencedColumnName = "id", nullable = false)
    private SkilltreeSkillsEntity skilltreeSkillsBySkilltreeSkillsId;

    @ManyToOne
    @JoinColumn(name = "levels_id", referencedColumnName = "id", nullable = false)
    private LevelsEntity levelsByLevelsId;

    @OneToMany(mappedBy = "skilltreeLevelsByUpgradeSkilltreeLevelsId")
    private Collection<SkilltreeUnlocksEntity> skilltreeUnlocks;
}
