package com.manulaiko.kalaazu.persistence.database.entities;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Collection;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "clans_banks", schema = "kalaazu")
public class ClansBank {
    private int id;

    private int clansId;

    private long credits;

    private long uridium;

    private BigDecimal taxCredits;

    private BigDecimal taxUridium;

    private Clan clansByClansId;

    private Collection<ClansBanksLog> clansBanksLogsById;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "clans_id")
    public int getClansId() {
        return clansId;
    }

    public void setClansId(int clansId) {
        this.clansId = clansId;
    }

    @Basic
    @Column(name = "credits")
    public long getCredits() {
        return credits;
    }

    public void setCredits(long credits) {
        this.credits = credits;
    }

    @Basic
    @Column(name = "uridium")
    public long getUridium() {
        return uridium;
    }

    public void setUridium(long uridium) {
        this.uridium = uridium;
    }

    @Basic
    @Column(name = "tax_credits")
    public BigDecimal getTaxCredits() {
        return taxCredits;
    }

    public void setTaxCredits(BigDecimal taxCredits) {
        this.taxCredits = taxCredits;
    }

    @Basic
    @Column(name = "tax_uridium")
    public BigDecimal getTaxUridium() {
        return taxUridium;
    }

    public void setTaxUridium(BigDecimal taxUridium) {
        this.taxUridium = taxUridium;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        ClansBank clansBank = (ClansBank) o;
        return id == clansBank.id &&
               clansId == clansBank.clansId &&
               credits == clansBank.credits &&
               uridium == clansBank.uridium &&
               Objects.equals(taxCredits, clansBank.taxCredits) &&
               Objects.equals(taxUridium, clansBank.taxUridium);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, clansId, credits, uridium, taxCredits, taxUridium);
    }

    @ManyToOne
    @JoinColumn(name = "clans_id", referencedColumnName = "id", nullable = false)
    public Clan getClansByClansId() {
        return clansByClansId;
    }

    public void setClansByClansId(Clan clansByClansId) {
        this.clansByClansId = clansByClansId;
    }

    @OneToMany(mappedBy = "clansBanksByClansBanksId")
    public Collection<ClansBanksLog> getClansBanksLogsById() {
        return clansBanksLogsById;
    }

    public void setClansBanksLogsById(
            Collection<ClansBanksLog> clansBanksLogsById
    ) {
        this.clansBanksLogsById = clansBanksLogsById;
    }
}
