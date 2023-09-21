package com.kalaazu.persistence.entity;

import com.kalaazu.math.Vector;
import com.kalaazu.persistence.Vector2Type;
import jakarta.persistence.*;
import lombok.Data;
import org.hibernate.annotations.Type;

/**
 * Maps collectables entity.
 * =========================
 * <p>
 * Entity for the `maps_collectables` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "maps_collectables", schema = "kalaazu")
@Data
public class MapsCollectablesEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private byte id;

    @Basic
    @Column(name = "amount", nullable = false)
    private short amount = 0;

    @Basic
    @Column(name = "from", nullable = false)
    @Type(value = Vector2Type.class)
    private Vector from = new Vector(0L);

    @Basic
    @Column(name = "to")
    @Type(value = Vector2Type.class)
    private Vector to = null;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "maps_id", referencedColumnName = "id", nullable = false)
    private MapsEntity mapsByMapsId;

    @Basic
    @Column(name= "maps_id", nullable = false, insertable = false, updatable = false)
    private byte mapsId = 0;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "collectables_id", referencedColumnName = "id", nullable = false)
    private CollectablesEntity collectablesByCollectablesId;

    @Basic
    @Column(name= "collectables_id", nullable = false, insertable = false, updatable = false)
    private byte collectablesId = 0;
}
