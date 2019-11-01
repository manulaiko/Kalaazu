package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;

/**
 * Key value entity.
 * =================
 *
 * Entity for the `key_value` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "key_value", schema = "kalaazu")
@Data
public class KeyValueEntity {
    @Id
    @Column(name = "id", nullable = false)
    private int id;

    @Basic
    @Column(name = "name", nullable = false)
    private String name;

    @Basic
    @Column(name = "value", nullable = false)
    private String value;
}
