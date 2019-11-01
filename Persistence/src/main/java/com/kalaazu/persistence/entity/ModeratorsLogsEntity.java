package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Moderators logs entity.
 * =======================
 *
 * Entity for the `moderators_logs` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "moderators_logs", schema = "kalaazu")
@Data
public class ModeratorsLogsEntity {
    @Id
    @Column(name = "id", nullable = false)
    private int id;

    @Basic
    @Column(name = "date", nullable = false)
    private Timestamp date;

    @Basic
    @Column(name = "type", nullable = false)
    private String type;

    @Basic
    @Column(name = "text", nullable = false, length = -1)
    private String text;

    @ManyToOne
    @JoinColumn(name = "moderators_id", referencedColumnName = "id", nullable = false)
    private ModeratorsEntity moderatorsByModeratorsId;
}
