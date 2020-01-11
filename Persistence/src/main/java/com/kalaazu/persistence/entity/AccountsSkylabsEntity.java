package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;
import java.sql.Timestamp;

/***
 * Accounts skylabs entity.
 * ========================
 *
 * Entity for the `accounts_skylabs` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "accounts_skylabs", schema = "kalaazu")
@Data
public class AccountsSkylabsEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private int id;

    @Basic
    @Column(name = "space", nullable = false)
    private int space = 0;

    @Basic
    @Column(name = "upgrade")
    private Timestamp upgrade;

    @ManyToOne
    @JoinColumn(name = "accounts_id", referencedColumnName = "id", nullable = false)
    private AccountsEntity accountsByAccountsId;

    @ManyToOne
    @JoinColumn(name = "skylab_modules_id", referencedColumnName = "id", nullable = false)
    private SkylabModulesEntity skylabModulesBySkylabModulesId;

    @ManyToOne
    @JoinColumn(name = "levels_id", referencedColumnName = "id", nullable = false)
    private LevelsEntity levelsByLevelsId;
}
