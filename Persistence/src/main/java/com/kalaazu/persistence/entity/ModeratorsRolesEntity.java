package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.Collection;

/**
 * Moderators roles entity.
 * ========================
 *
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

    @ManyToOne()
    @JoinColumn(name = "moderators_roles_id", referencedColumnName = "id")
    private ModeratorsRolesEntity moderatorsRolesByModeratorsRolesId;

    @OneToMany(mappedBy = "moderatorsRolesByModeratorsRolesId")
    private Collection<ModeratorsRolesPermissionsEntity> moderatorsRolesPermissions;
}
