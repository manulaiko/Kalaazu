package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.Collection;

/**
 * Skilltree skills entity.
 * ========================
 *
 * Entity for the `skilltree_skills` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "skilltree_skills", schema = "kalaazu")
@Data
public class SkilltreeSkillsEntity {
    @Id
    @Column(name = "id", nullable = false)
    private byte id;

    @Basic
    @Column(name = "name", nullable = false)
    private String name = "";

    @Basic
    @Column(name = "description", nullable = false, length = -1, columnDefinition = "TEXT")
    private String description;

    @Basic
    @Column(name = "type", nullable = false)
    @Enumerated(EnumType.ORDINAL)
    private SkillType type = SkillType.BLUE;

    @Basic
    @Column(name = "is_advanced", nullable = false)
    private boolean isAdvanced = false;

    @Basic
    @Column(name = "bonus_type", nullable = false)
    private String bonusType = "health";

    @Basic
    @Column(name = "bonus_amount", nullable = false)
    private int bonusAmount = 0;

    @Basic
    @Column(name = "bonus_factor", nullable = false)
    private byte bonusFactor = 2;

    @OneToMany(mappedBy = "skilltreeSkillsBySkilltreeSkillsId")
    private Collection<SkilltreeLevelsEntity> skilltreeLevels;
}
