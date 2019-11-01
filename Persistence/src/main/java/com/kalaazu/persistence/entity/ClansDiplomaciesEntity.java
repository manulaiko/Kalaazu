package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Clans diplomacies entity.
 * =========================
 *
 * Entity for the `clans_diplomacies` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "clans_diplomacies", schema = "kalaazu")
@Data
public class ClansDiplomaciesEntity {
    @Id
    @Column(name = "id", nullable = false)
    private int id;

    @Basic
    @Column(name = "date", nullable = false)
    private Timestamp date;

    @Basic
    @Column(name = "expires")
    private Timestamp expires;

    @Basic
    @Column(name = "status", nullable = false)
    private byte status;

    @Basic
    @Column(name = "type", nullable = false)
    private byte type;

    @ManyToOne
    @JoinColumn(name = "from_clans_id", referencedColumnName = "id", nullable = false)
    private ClansEntity clansByFromClansId;

    @ManyToOne
    @JoinColumn(name = "to_clans_id", referencedColumnName = "id", nullable = false)
    private ClansEntity clansByToClansId;
}
