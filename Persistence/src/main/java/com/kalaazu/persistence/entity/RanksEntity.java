package com.kalaazu.persistence.entity;

import jakarta.persistence.*;
import lombok.Data;

/**
 * Ranks entity.
 * =============
 * <p>
 * Entity for the `ranks` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "ranks", schema = "kalaazu")
@Data
public class RanksEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private byte id;

    @Basic
    @Column(name = "name", nullable = false)
    private String name = "";

    @Basic
    @Column(name = "percentaje", nullable = false, precision = 2)
    private double percentaje = 0;

    @Basic
    @Column(name = "is_public", nullable = false)
    private boolean isPublic = true;
}
