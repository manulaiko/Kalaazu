package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Server logs entity.
 * ===================
 *
 * Entity for the `server_logs` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "server_logs", schema = "kalaazu")
@Data
public class ServerLogsEntity {
    @Id
    @Column(name = "id", nullable = false)
    private int id;

    @Basic
    @Column(name = "date", nullable = false)
    private Timestamp date;

    @Basic
    @Column(name = "level", nullable = false)
    private String level;

    @Basic
    @Column(name = "type", nullable = false)
    private String type;

    @Basic
    @Column(name = "context", nullable = false, length = -1, columnDefinition = "TEXT")
    private String context;
}
