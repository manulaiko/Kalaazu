package com.kalaazu.persistence.entity;

import jakarta.persistence.*;
import lombok.Data;

/**
 * Maps stations entity.
 * =====================
 * <p>
 * Entity for the `maps_stations` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "maps_stations", schema = "kalaazu")
@Data
public class MapsStationsEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private byte id;

    @Basic
    @Column(name = "position", nullable = false)
    private long position = 0;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "maps_id", referencedColumnName = "id")
    private MapsEntity mapsByMapsId;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "factions_id", referencedColumnName = "id")
    private FactionsEntity factionsByFactionsId;
}
