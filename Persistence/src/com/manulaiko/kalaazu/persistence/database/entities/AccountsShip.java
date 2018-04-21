package com.manulaiko.kalaazu.persistence.database.entities;

import com.manulaiko.kalaazu.math.Vector2;

import java.util.Collection;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class AccountsShip {
    private int id;

    private int accountsId;

    private int shipsId;

    private int mapsId;

    private Vector2 position;

    private int health;

    private int shield;

    private int nanohull;

    private int gfx;

    private Collection<AccountsHangar> accountsHangarsById;

    private Account accountsByAccountsId;

    private Ship shipsByShipsId;

    private Map mapsByMapsId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAccountsId() {
        return accountsId;
    }

    public void setAccountsId(int accountsId) {
        this.accountsId = accountsId;
    }

    public int getShipsId() {
        return shipsId;
    }

    public void setShipsId(int shipsId) {
        this.shipsId = shipsId;
    }

    public int getMapsId() {
        return mapsId;
    }

    public void setMapsId(int mapsId) {
        this.mapsId = mapsId;
    }

    public Vector2 getPosition() {
        return position;
    }

    public void setPosition(Vector2 position) {
        this.position = position;
    }

    public int getHealth() {
        return health;
    }

    public void setHealth(int health) {
        this.health = health;
    }

    public int getShield() {
        return shield;
    }

    public void setShield(int shield) {
        this.shield = shield;
    }

    public int getNanohull() {
        return nanohull;
    }

    public void setNanohull(int nanohull) {
        this.nanohull = nanohull;
    }

    public int getGfx() {
        return gfx;
    }

    public void setGfx(int gfx) {
        this.gfx = gfx;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        AccountsShip that = (AccountsShip) o;
        return id == that.id &&
               accountsId == that.accountsId &&
               shipsId == that.shipsId &&
               mapsId == that.mapsId &&
               health == that.health &&
               shield == that.shield &&
               nanohull == that.nanohull &&
               gfx == that.gfx;
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, accountsId, shipsId, mapsId, health, shield, nanohull, gfx);
    }

    public Collection<AccountsHangar> getAccountsHangarsById() {
        return accountsHangarsById;
    }

    public void setAccountsHangarsById(
            Collection<AccountsHangar> accountsHangarsById
    ) {
        this.accountsHangarsById = accountsHangarsById;
    }

    public Account getAccountsByAccountsId() {
        return accountsByAccountsId;
    }

    public void setAccountsByAccountsId(Account accountsByAccountsId) {
        this.accountsByAccountsId = accountsByAccountsId;
    }

    public Ship getShipsByShipsId() {
        return shipsByShipsId;
    }

    public void setShipsByShipsId(Ship shipsByShipsId) {
        this.shipsByShipsId = shipsByShipsId;
    }

    public Map getMapsByMapsId() {
        return mapsByMapsId;
    }

    public void setMapsByMapsId(Map mapsByMapsId) {
        this.mapsByMapsId = mapsByMapsId;
    }
}
