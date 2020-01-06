package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Collection;

/**
 * Clans battlestations entity.
 * ============================
 *
 * Entity for the `clans_battlestations` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "clans_battlestations", schema = "kalaazu")
@Data
public class ClansBattlestationsEntity {
    @Id
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
    private Timestamp date;

    @ManyToOne
    @JoinColumn(name = "clans_id", referencedColumnName = "id")
    private ClansEntity clansByClansId;

    @ManyToOne
    @JoinColumn(name = "maps_id", referencedColumnName = "id")
    private MapsEntity mapsByMapsId;

    @OneToMany(mappedBy = "clansBattlestationsByClansBattlestationsId")
    private Collection<ClansBattlestationsItemsEntity> clansBattlestationsItems;

    @OneToMany(mappedBy = "clansBattlestationsByClansBattlestationsId")
    private Collection<ClansBattlestationsLogsEntity> clansBattlestationsLogs;
}
