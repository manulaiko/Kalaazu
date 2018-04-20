package com.manulaiko.kalaazu.persistence.database.entities;

import javax.persistence.*;
import java.util.Date;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "accounts_skylabs", schema = "kalaazu")
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

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "accounts_id")
    public int getAccountsId() {
        return accountsId;
    }

    public void setAccountsId(int accountsId) {
        this.accountsId = accountsId;
    }

    @Basic
    @Column(name = "skylab_modules_id")
    public int getSkylabModulesId() {
        return skylabModulesId;
    }

    public void setSkylabModulesId(int skylabModulesId) {
        this.skylabModulesId = skylabModulesId;
    }

    @Basic
    @Column(name = "levels_id")
    public int getLevelsId() {
        return levelsId;
    }

    public void setLevelsId(int levelsId) {
        this.levelsId = levelsId;
    }

    @Basic
    @Column(name = "space")
    public int getSpace() {
        return space;
    }

    public void setSpace(int space) {
        this.space = space;
    }

    @Basic
    @Column(name = "upgrade")
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

    @ManyToOne
    @JoinColumn(name = "accounts_id", referencedColumnName = "id", nullable = false)
    public Account getAccountsByAccountsId() {
        return accountsByAccountsId;
    }

    public void setAccountsByAccountsId(Account accountsByAccountsId) {
        this.accountsByAccountsId = accountsByAccountsId;
    }

    @ManyToOne
    @JoinColumn(name = "skylab_modules_id", referencedColumnName = "id", nullable = false)
    public SkylabModule getSkylabModulesBySkylabModulesId() {
        return skylabModulesBySkylabModulesId;
    }

    public void setSkylabModulesBySkylabModulesId(
            SkylabModule skylabModulesBySkylabModulesId
    ) {
        this.skylabModulesBySkylabModulesId = skylabModulesBySkylabModulesId;
    }

    @ManyToOne
    @JoinColumn(name = "levels_id", referencedColumnName = "id", nullable = false)
    public Level getLevelsByLevelsId() {
        return levelsByLevelsId;
    }

    public void setLevelsByLevelsId(Level levelsByLevelsId) {
        this.levelsByLevelsId = levelsByLevelsId;
    }
}
