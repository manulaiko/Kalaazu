package com.kalaazu.persistence.entity;

import jakarta.persistence.*;
import lombok.Data;

/**
 * Accounts skills entity.
 * =======================
 * <p>
 * Entity for the `accounts_skills` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "accounts_skills", schema = "kalaazu")
@Data
public class AccountsSkillsEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private int id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "accounts_id", referencedColumnName = "id", nullable = false)
    private AccountsEntity accountsByAccountsId;

    @Basic
    @Column(name= "accounts_id", nullable = false, insertable = false, updatable = false)
    private int accountsId = 0;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "skilltree_skills_id", referencedColumnName = "id", nullable = false)
    private SkilltreeSkillsEntity skilltreeSkillsBySkilltreeSkillsId;

    @Basic
    @Column(name= "skilltree_skills_id", nullable = false, insertable = false, updatable = false)
    private byte skilltreeSkillsId = 0;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "skilltree_levels_id", referencedColumnName = "id", nullable = false)
    private SkilltreeLevelsEntity skilltreeLevelsBySkilltreeLevelsId;

    @Basic
    @Column(name= "skilltree_levels_id", nullable = false, insertable = false, updatable = false)
    private short skilltreeLevelsId = 0;
}
