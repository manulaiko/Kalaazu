package com.kalaazu.persistence.entity;

import jakarta.persistence.*;
import lombok.Data;

/**
 * Clans banks entity.
 * ===================
 * <p>
 * Entity for the `clans_banks` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "clans_banks", schema = "kalaazu")
@Data
public class ClansBanksEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private int id;

    @Basic
    @Column(name = "credits", nullable = false)
    private long credits = 0;

    @Basic
    @Column(name = "uridium", nullable = false)
    private long uridium = 0;

    @Basic
    @Column(name = "tax_credits", nullable = false)
    private byte taxCredits = 5;

    @Basic
    @Column(name = "tax_uridium", nullable = false)
    private byte taxUridium = 0;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "clans_id", referencedColumnName = "id", nullable = false)
    private ClansEntity clansByClansId;
}
