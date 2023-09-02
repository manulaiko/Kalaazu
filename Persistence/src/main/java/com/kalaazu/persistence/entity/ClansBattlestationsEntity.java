package com.kalaazu.persistence.entity;

import jakarta.persistence.*;
import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;

import java.sql.Timestamp;
import java.util.Collection;

/**
 * Clans battlestations entity.
 * ============================
 * <p>
 * Entity for the `clans_battlestations` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "clans_battlestations", schema = "kalaazu")
@Data
public class ClansBattlestationsEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private byte id;

    @Basic
    @Column(name = "name", nullable = false)
    private String name = "";

    @Basic
    @Column(name = "position", nullable = false)
    private long position = 0;

    @Basic
    @Column(name = "date")
    @CreationTimestamp
    private Timestamp date;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "clans_id", referencedColumnName = "id")
    private ClansEntity clansByClansId;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "maps_id", referencedColumnName = "id")
    private MapsEntity mapsByMapsId;

    @OneToMany(mappedBy = "clansBattlestationsByClansBattlestationsId", fetch = FetchType.EAGER)
    private Collection<ClansBattlestationsItemsEntity> clansBattlestationsItems;

    @OneToMany(mappedBy = "clansBattlestationsByClansBattlestationsId", fetch = FetchType.EAGER)
    private Collection<ClansBattlestationsLogsEntity> clansBattlestationsLogs;
}
