package com.kalaazu.persistence.entity;

import jakarta.persistence.*;
import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;

import java.sql.Timestamp;
import java.util.Collection;

/**
 * Moderators entity.
 * ==================
 * <p>
 * Entity for the `moderators` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "moderators", schema = "kalaazu")
@Data
public class ModeratorsEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private byte id;

    @Basic
    @Column(name = "date", nullable = false)
    @CreationTimestamp
    private Timestamp date;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "accounts_id", referencedColumnName = "id", nullable = false)
    private AccountsEntity accountsByAccountsId;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "moderators_roles_id", referencedColumnName = "id", nullable = false)
    private ModeratorsRolesEntity moderatorsRoles;

    @OneToMany(mappedBy = "moderatorsByModeratorsId", fetch = FetchType.EAGER)
    private Collection<ModeratorsLogsEntity> moderatorsLogs;
}
