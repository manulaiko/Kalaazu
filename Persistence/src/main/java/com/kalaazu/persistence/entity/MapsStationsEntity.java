package com.kalaazu.persistence.entity;

import com.kalaazu.math.Vector;
import com.kalaazu.persistence.VectorType;
import jakarta.persistence.*;
import lombok.Data;
import org.hibernate.annotations.Type;

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
    @Type(value = VectorType.class)
    private Vector position = Vector.ZERO;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "maps_id", referencedColumnName = "id")
    private MapsEntity mapsByMapsId;

    @Basic
    @Column(name= "maps_id", insertable = false, updatable = false)
    private Short mapsId = 0;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "factions_id", referencedColumnName = "id")
    private FactionsEntity factionsByFactionsId;

    @Basic
    @Column(name= "factions_id", insertable = false, updatable = false)
    private Byte factionsId = 0;
}
