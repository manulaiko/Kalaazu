package com.kalaazu.persistence.entity;

import jakarta.persistence.*;
import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;

import java.sql.Timestamp;

/**
 * Clans battlestation logs entity.
 * ================================
 * <p>
 * Entity for the `clans_battlestations_logs` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "clans_battlestations_logs", schema = "kalaazu")
@Data
public class ClansBattlestationsLogsEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private int id;

    @Basic
    @Column(name = "message", nullable = false, length = -1, columnDefinition = "TEXT")
    private String message;

    @Basic
    @Column(name = "date", nullable = false)
    @CreationTimestamp
    private Timestamp date;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "clans_id", referencedColumnName = "id", nullable = false)
    private ClansEntity clansByClansId;

    @Basic
    @Column(name= "clans_id", nullable = false, insertable = false, updatable = false)
    private int clansId = 0;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "clans_battlestations_id", referencedColumnName = "id", nullable = false)
    private ClansBattlestationsEntity clansBattlestationsByClansBattlestationsId;

    @Basic
    @Column(name= "clans_battlestations_id", nullable = false, insertable = false, updatable = false)
    private byte clansBattlestationsId = 0;
}
