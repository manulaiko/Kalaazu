package com.kalaazu.persistence.entity;

import com.kalaazu.math.Vector;
import com.kalaazu.persistence.VectorType;
import jakarta.persistence.*;
import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.Type;

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
    @Type(value = VectorType.class)
    private Vector position = Vector.ZERO;

    @Basic
    @Column(name = "date")
    @CreationTimestamp
    private Timestamp date;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "clans_id", referencedColumnName = "id")
    private ClansEntity clansByClansId;

    @Basic
    @Column(name= "clans_id", insertable = false, updatable = false)
    private Integer clansId = 0;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "maps_id", referencedColumnName = "id")
    private MapsEntity mapsByMapsId;

    @Basic
    @Column(name= "maps_id", insertable = false, updatable = false)
    private Short mapsId = 0;

    @OneToMany(mappedBy = "clansBattlestationsByClansBattlestationsId", fetch = FetchType.LAZY)
    private Collection<ClansBattlestationsItemsEntity> clansBattlestationsItems;

    @OneToMany(mappedBy = "clansBattlestationsByClansBattlestationsId", fetch = FetchType.LAZY)
    private Collection<ClansBattlestationsLogsEntity> clansBattlestationsLogs;
}
