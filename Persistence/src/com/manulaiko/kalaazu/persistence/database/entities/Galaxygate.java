package com.manulaiko.kalaazu.persistence.database.entities;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "galaxygates", schema = "kalaazu")
public class Galaxygate {
    private int id;

    private String name;

    private Integer galaxygatesWavesId;

    private int parts;

    private Collection<AccountsGalaxygate> accountsGalaxygatesById;

    private GalaxygatesWave galaxygatesWavesByGalaxygatesWavesId;

    private Collection<GalaxygatesGgSpin> galaxygatesGgSpinsById;

    private Collection<GalaxygatesGgWaves> galaxygatesGgWavesById;

    private Collection<GalaxygatesProbabilitie> galaxygatesProbabilitiesById;

    private Collection<RewardsGalaxygate> rewardsGalaxygatesById;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "galaxygates_waves_id")
    public Integer getGalaxygatesWavesId() {
        return galaxygatesWavesId;
    }

    public void setGalaxygatesWavesId(Integer galaxygatesWavesId) {
        this.galaxygatesWavesId = galaxygatesWavesId;
    }

    @Basic
    @Column(name = "parts")
    public int getParts() {
        return parts;
    }

    public void setParts(int parts) {
        this.parts = parts;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        Galaxygate that = (Galaxygate) o;
        return id == that.id &&
               parts == that.parts &&
               Objects.equals(name, that.name) &&
               Objects.equals(galaxygatesWavesId, that.galaxygatesWavesId);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, name, galaxygatesWavesId, parts);
    }

    @OneToMany(mappedBy = "galaxygatesByGalaxygatesId")
    public Collection<AccountsGalaxygate> getAccountsGalaxygatesById() {
        return accountsGalaxygatesById;
    }

    public void setAccountsGalaxygatesById(
            Collection<AccountsGalaxygate> accountsGalaxygatesById
    ) {
        this.accountsGalaxygatesById = accountsGalaxygatesById;
    }

    @ManyToOne
    @JoinColumn(name = "galaxygates_waves_id", referencedColumnName = "id")
    public GalaxygatesWave getGalaxygatesWavesByGalaxygatesWavesId() {
        return galaxygatesWavesByGalaxygatesWavesId;
    }

    public void setGalaxygatesWavesByGalaxygatesWavesId(
            GalaxygatesWave galaxygatesWavesByGalaxygatesWavesId
    ) {
        this.galaxygatesWavesByGalaxygatesWavesId = galaxygatesWavesByGalaxygatesWavesId;
    }

    @OneToMany(mappedBy = "galaxygatesByGalaxygatesId")
    public Collection<GalaxygatesGgSpin> getGalaxygatesGgSpinsById() {
        return galaxygatesGgSpinsById;
    }

    public void setGalaxygatesGgSpinsById(
            Collection<GalaxygatesGgSpin> galaxygatesGgSpinsById
    ) {
        this.galaxygatesGgSpinsById = galaxygatesGgSpinsById;
    }

    @OneToMany(mappedBy = "galaxygatesByGalaxygatesId")
    public Collection<GalaxygatesGgWaves> getGalaxygatesGgWavesById() {
        return galaxygatesGgWavesById;
    }

    public void setGalaxygatesGgWavesById(
            Collection<GalaxygatesGgWaves> galaxygatesGgWavesById
    ) {
        this.galaxygatesGgWavesById = galaxygatesGgWavesById;
    }

    @OneToMany(mappedBy = "galaxygatesByGalaxygatesId")
    public Collection<GalaxygatesProbabilitie> getGalaxygatesProbabilitiesById() {
        return galaxygatesProbabilitiesById;
    }

    public void setGalaxygatesProbabilitiesById(
            Collection<GalaxygatesProbabilitie> galaxygatesProbabilitiesById
    ) {
        this.galaxygatesProbabilitiesById = galaxygatesProbabilitiesById;
    }

    @OneToMany(mappedBy = "galaxygatesByGalaxygatesId")
    public Collection<RewardsGalaxygate> getRewardsGalaxygatesById() {
        return rewardsGalaxygatesById;
    }

    public void setRewardsGalaxygatesById(
            Collection<RewardsGalaxygate> rewardsGalaxygatesById
    ) {
        this.rewardsGalaxygatesById = rewardsGalaxygatesById;
    }
}
