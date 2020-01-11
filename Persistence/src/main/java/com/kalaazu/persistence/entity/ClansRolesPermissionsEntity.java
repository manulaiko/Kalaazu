package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;

/**
 * Clans roles permissions entity.
 * ===============================
 *
 * Entity for the `clans_roles_permissions` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "clans_roles_permissions", schema = "kalaazu")
@Data
public class ClansRolesPermissionsEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private int id;

    @Basic
    @Column(name = "is_enabled")
    private boolean isEnabled;

    @ManyToOne
    @JoinColumn(name = "clans_roles_id", referencedColumnName = "id", nullable = false)
    private ClansRolesEntity clansRolesByClansRolesId;

    @ManyToOne
    @JoinColumn(name = "permissions_id", referencedColumnName = "id", nullable = false)
    private PermissionsEntity permissionsByPermissionsId;
}
