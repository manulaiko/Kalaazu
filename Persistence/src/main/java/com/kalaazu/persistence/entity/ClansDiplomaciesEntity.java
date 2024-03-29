package com.kalaazu.persistence.entity;

import jakarta.persistence.*;
import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;

import java.sql.Timestamp;

/**
 * Clans diplomacies entity.
 * =========================
 * <p>
 * Entity for the `clans_diplomacies` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "clans_diplomacies", schema = "kalaazu")
@Data
public class ClansDiplomaciesEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private int id;

    @Basic
    @Column(name = "date", nullable = false)
    @CreationTimestamp
    private Timestamp date;

    @Basic
    @Column(name = "expires")
    private Timestamp expires;

    @Basic
    @Column(name = "status", nullable = false)
    @Enumerated(EnumType.ORDINAL)
    private DiplomacyStatus status = DiplomacyStatus.NOT_ACCEPTED;

    @Basic
    @Column(name = "type", nullable = false)
    @Enumerated(EnumType.ORDINAL)
    private DiplomacyType type = DiplomacyType.WAR;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "from_clans_id", referencedColumnName = "id", nullable = false)
    private ClansEntity clansByFromClansId;

    @Basic
    @Column(name= "from_clans_id", nullable = false, insertable = false, updatable = false)
    private int fromClansId = 0;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "to_clans_id", referencedColumnName = "id", nullable = false)
    private ClansEntity clansByToClansId;

    @Basic
    @Column(name= "to_clans_id", nullable = false, insertable = false, updatable = false)
    private int toClansId = 0;
}
