package com.kalaazu.persistence.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.util.Collection;

/**
 * Clans roles entity.
 * ===================
 * <p>
 * Entity for the `clans_roles` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "clans_roles", schema = "kalaazu")
@Data
public class ClansRolesEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private int id;

    @Basic
    @Column(name = "name", nullable = false)
    private String name;

    @Basic
    @Column(name = "priority", nullable = false)
    private byte priority = 1;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "clans_id", referencedColumnName = "id", nullable = false)
    private ClansEntity clansByClansId;

    @OneToMany(mappedBy = "clansRolesByClansRolesId", fetch = FetchType.EAGER)
    private Collection<ClansRolesPermissionsEntity> clansRolesPermissions;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "clans_roles_id", referencedColumnName = "id")
    private ClansRolesEntity clansRolesByClansRolesId;
}
