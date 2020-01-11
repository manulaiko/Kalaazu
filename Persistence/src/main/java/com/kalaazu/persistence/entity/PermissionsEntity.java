package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;

/**
 * Permissions entity.
 * ===================
 *
 * Entity for the `permissions` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "permissions", schema = "kalaazu")
@Data
public class PermissionsEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private byte id;

    @Basic
    @Column(name = "name", nullable = false)
    private String name;

    @Basic
    @Column(name = "category", nullable = false)
    private String category;
}
