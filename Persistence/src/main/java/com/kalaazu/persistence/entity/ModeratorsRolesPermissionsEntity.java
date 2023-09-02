package com.kalaazu.persistence.entity;

import jakarta.persistence.*;
import lombok.Data;

/**
 * Moderators roles permissions.
 * =============================
 * <p>
 * Entity for the `moderators_roles_permissions` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "moderators_roles_permissions", schema = "kalaazu")
@Data
public class ModeratorsRolesPermissionsEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private byte id;

    @Basic
    @Column(name = "is_enabled")
    private boolean isEnabled;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "moderators_roles_id", referencedColumnName = "id", nullable = false)
    private ModeratorsRolesEntity moderatorsRolesByModeratorsRolesId;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "permissions_id", referencedColumnName = "id", nullable = false)
    private PermissionsEntity permissions;
}
