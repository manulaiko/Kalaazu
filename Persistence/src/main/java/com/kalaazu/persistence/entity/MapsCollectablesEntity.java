package com.kalaazu.persistence.entity;

import com.kalaazu.math.Vector2;
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
    private byte amount = 0;

    @Basic
    @Column(name = "from", nullable = false)
    @Type(value = Vector2Type.class)
    private Vector2 from = new Vector2(0L);

    @Basic
    @Column(name = "to")
    @Type(value = Vector2Type.class)
    private Vector2 to = null;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "maps_id", referencedColumnName = "id", nullable = false)
    private MapsEntity mapsByMapsId;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "collectables_id", referencedColumnName = "id", nullable = false)
    private CollectablesEntity collectablesByCollectablesId;
}
