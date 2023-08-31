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

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "skilltree_skills_id", referencedColumnName = "id", nullable = false)
    private SkilltreeSkillsEntity skilltreeSkillsBySkilltreeSkillsId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "skilltree_levels_id", referencedColumnName = "id", nullable = false)
    private SkilltreeLevelsEntity skilltreeLevelsBySkilltreeLevelsId;
}
