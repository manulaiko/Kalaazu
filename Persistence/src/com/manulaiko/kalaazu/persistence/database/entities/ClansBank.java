package com.manulaiko.kalaazu.persistence.database.entities;


import java.math.BigDecimal;
import java.util.Collection;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class ClansBank {
    private int id;

    private int clansId;

    private long credits;

    private long uridium;

    private BigDecimal taxCredits;

    private BigDecimal taxUridium;

    private Clan clansByClansId;

    private Collection<ClansBanksLog> clansBanksLogsById;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getClansId() {
        return clansId;
    }

    public void setClansId(int clansId) {
        this.clansId = clansId;
    }

    public long getCredits() {
        return credits;
    }

    public void setCredits(long credits) {
        this.credits = credits;
    }

    public long getUridium() {
        return uridium;
    }

    public void setUridium(long uridium) {
        this.uridium = uridium;
    }

    public BigDecimal getTaxCredits() {
        return taxCredits;
    }

    public void setTaxCredits(BigDecimal taxCredits) {
        this.taxCredits = taxCredits;
    }

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

    public Clan getClansByClansId() {
        return clansByClansId;
    }

    public void setClansByClansId(Clan clansByClansId) {
        this.clansByClansId = clansByClansId;
    }

    public Collection<ClansBanksLog> getClansBanksLogsById() {
        return clansBanksLogsById;
    }

    public void setClansBanksLogsById(
            Collection<ClansBanksLog> clansBanksLogsById
    ) {
        this.clansBanksLogsById = clansBanksLogsById;
    }
}
