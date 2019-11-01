package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;

/**
 * Accounts clans roles entity.
 * ============================
 *
 * Entity for the `accounts_clans_roles` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "accounts_clans_roles", schema = "kalaazu")
@Data
public class AccountsClansRolesEntity {
    @Id
    @Column(name = "id", nullable = false)
    private int id;

    @ManyToOne
    @JoinColumn(name = "accounts_id", referencedColumnName = "id", nullable = false)
    private AccountsEntity accountsByAccountsId;

    @ManyToOne
    @JoinColumn(name = "clans_roles_id", referencedColumnName = "id", nullable = false)
    private ClansRolesEntity clansRolesByClansRolesId;
}
