package com.kalaazu.persistence.entity;

import jakarta.persistence.*;
import lombok.Data;

/**
 * Clans roles permissions entity.
 * ===============================
 * <p>
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

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "clans_roles_id", referencedColumnName = "id", nullable = false)
    private ClansRolesEntity clansRolesByClansRolesId;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "permissions_id", referencedColumnName = "id", nullable = false)
    private PermissionsEntity permissionsByPermissionsId;
}
