package com.kalaazu.persistence.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.util.Collection;

/**
 * Moderators roles entity.
 * ========================
 * <p>
 * Entity for the `moderators_roles` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "moderators_roles", schema = "kalaazu")
@Data
public class ModeratorsRolesEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private byte id;

    @Basic
    @Column(name = "name", nullable = false)
    private String name;

    @Basic
    @Column(name = "priority", nullable = false)
    private byte priority = 1;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "moderators_roles_id", referencedColumnName = "id")
    private ModeratorsRolesEntity moderatorsRolesByModeratorsRolesId;

    @Basic
    @Column(name= "moderators_roles_id", insertable = false, updatable = false)
    private Byte moderatorsRolesId = 0;

    @OneToMany(mappedBy = "moderatorsRolesByModeratorsRolesId", fetch = FetchType.LAZY)
    private Collection<ModeratorsRolesPermissionsEntity> moderatorsRolesPermissions;
}
