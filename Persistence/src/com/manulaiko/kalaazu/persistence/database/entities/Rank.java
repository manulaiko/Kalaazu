package com.manulaiko.kalaazu.persistence.database.entities;


import java.math.BigDecimal;
import java.util.Collection;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class Rank {
    private int id;

    private String name;

    private BigDecimal percentaje;

    private boolean isPublic;

    private Collection<Account> accountsById;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public BigDecimal getPercentaje() {
        return percentaje;
    }

    public void setPercentaje(BigDecimal percentaje) {
        this.percentaje = percentaje;
    }

    public boolean isPublic() {
        return isPublic;
    }

    public void setPublic(boolean aPublic) {
        isPublic = aPublic;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        Rank rank = (Rank) o;
        return id == rank.id &&
               isPublic == rank.isPublic &&
               Objects.equals(name, rank.name) &&
               Objects.equals(percentaje, rank.percentaje);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, name, percentaje, isPublic);
    }

    public Collection<Account> getAccountsById() {
        return accountsById;
    }

    public void setAccountsById(Collection<Account> accountsById) {
        this.accountsById = accountsById;
    }
}
