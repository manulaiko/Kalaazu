package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.Collection;

/**
 * Clans roles entity.
 * ===================
 *
 * Entity for the `clans_roles` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "clans_roles", schema = "kalaazu")
@Data
public class ClansRolesEntity {
    @Id
    @Column(name = "id", nullable = false)
    private int id;

    @Basic
    @Column(name = "name", nullable = false)
    private String name;

    @Basic
    @Column(name = "clans_roles_id")
    private Integer clansRolesId;

    @Basic
    @Column(name = "priority", nullable = false)
    private byte priority;

    @ManyToOne
    @JoinColumn(name = "clans_id", referencedColumnName = "id", nullable = false)
    private ClansEntity clansByClansId;

    @OneToMany(mappedBy = "clansRolesByClansRolesId")
    private Collection<ClansRolesPermissionsEntity> clansRolesPermissions;
}
