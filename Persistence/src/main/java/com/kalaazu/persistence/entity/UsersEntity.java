package com.kalaazu.persistence.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.sql.Timestamp;
import java.util.Collection;
import java.util.HashSet;

/**
 * Users entity.
 * =============
 * <p>
 * Entity for the `users` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "users", schema = "kalaazu")
@Data
public class UsersEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private int id;

    @Basic
    @Column(name = "date", nullable = false)
    private Timestamp date;

    @Basic
    @Column(name = "name", nullable = false)
    private String name;

    @Basic
    @Column(name = "password", nullable = false)
    private String password;

    @Basic
    @Column(name = "email", nullable = false)
    private String email;

    @Basic
    @Column(name = "email_verification_code", nullable = false, length = 32)
    private String emailVerificationCode;

    @Basic
    @Column(name = "email_verification_date")
    private Timestamp emailVerificationDate;

    @Basic
    @Column(name = "ip", nullable = false, length = 45)
    private String ip = "0.0.0.0";

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "invitation_codes_id", referencedColumnName = "id")
    private InvitationCodesEntity invitationCodesByInvitationCodesId;

    @OneToMany(mappedBy = "usersByUsersId", fetch = FetchType.LAZY)
    private Collection<AccountsEntity> accounts = new HashSet<>();

    /**
     * Adds a new account.
     *
     * @param account Account to add.
     */
    public void addAccount(AccountsEntity account) {
        this.accounts.add(account);
        account.setUsersByUsersId(this);
    }
}
