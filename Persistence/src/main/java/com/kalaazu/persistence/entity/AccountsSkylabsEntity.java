package com.kalaazu.persistence.entity;

import jakarta.persistence.*;
import lombok.Data;

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

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "accounts_id", referencedColumnName = "id", nullable = false)
    private AccountsEntity accountsByAccountsId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "skylab_modules_id", referencedColumnName = "id", nullable = false)
    private SkylabModulesEntity skylabModulesBySkylabModulesId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "levels_id", referencedColumnName = "id", nullable = false)
    private LevelsEntity levelsByLevelsId;
}
