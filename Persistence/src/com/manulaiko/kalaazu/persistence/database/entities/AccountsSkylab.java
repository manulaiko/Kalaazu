package com.manulaiko.kalaazu.persistence.database.entities;


import java.util.Date;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class AccountsSkylab {
    private int id;

    private int accountsId;

    private int skylabModulesId;

    private int levelsId;

    private int space;

    private Date upgrade;

    private Account accountsByAccountsId;

    private SkylabModule skylabModulesBySkylabModulesId;

    private Level levelsByLevelsId;

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

    public int getSkylabModulesId() {
        return skylabModulesId;
    }

    public void setSkylabModulesId(int skylabModulesId) {
        this.skylabModulesId = skylabModulesId;
    }

    public int getLevelsId() {
        return levelsId;
    }

    public void setLevelsId(int levelsId) {
        this.levelsId = levelsId;
    }

    public int getSpace() {
        return space;
    }

    public void setSpace(int space) {
        this.space = space;
    }

    public Date getUpgrade() {
        return upgrade;
    }

    public void setUpgrade(Date upgrade) {
        this.upgrade = upgrade;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        AccountsSkylab that = (AccountsSkylab) o;
        return id == that.id &&
               accountsId == that.accountsId &&
               skylabModulesId == that.skylabModulesId &&
               levelsId == that.levelsId &&
               space == that.space &&
               Objects.equals(upgrade, that.upgrade);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, accountsId, skylabModulesId, levelsId, space, upgrade);
    }

    public Account getAccountsByAccountsId() {
        return accountsByAccountsId;
    }

    public void setAccountsByAccountsId(Account accountsByAccountsId) {
        this.accountsByAccountsId = accountsByAccountsId;
    }

    public SkylabModule getSkylabModulesBySkylabModulesId() {
        return skylabModulesBySkylabModulesId;
    }

    public void setSkylabModulesBySkylabModulesId(
            SkylabModule skylabModulesBySkylabModulesId
    ) {
        this.skylabModulesBySkylabModulesId = skylabModulesBySkylabModulesId;
    }

    public Level getLevelsByLevelsId() {
        return levelsByLevelsId;
    }

    public void setLevelsByLevelsId(Level levelsByLevelsId) {
        this.levelsByLevelsId = levelsByLevelsId;
    }
}
