package com.manulaiko.kalaazu.persistence.database.entities;

import javax.persistence.*;
import java.util.Date;
import java.util.Arrays;
import java.util.Collection;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "users", schema = "kalaazu")
public class User {
    private int id;

    private Date date;

    private Integer invitationCodesId;

    private String name;

    private String password;

    private String email;

    private String emailVerificationCode;

    private Date emailVerificationDate;

    private byte[] ip;

    private Collection<Account> accountsById;

    private InvitationCode invitationCodesByInvitationCodesId;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "date")
    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Basic
    @Column(name = "invitation_codes_id")
    public Integer getInvitationCodesId() {
        return invitationCodesId;
    }

    public void setInvitationCodesId(Integer invitationCodesId) {
        this.invitationCodesId = invitationCodesId;
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
    @Column(name = "password")
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Basic
    @Column(name = "email")
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Basic
    @Column(name = "email_verification_code")
    public String getEmailVerificationCode() {
        return emailVerificationCode;
    }

    public void setEmailVerificationCode(String emailVerificationCode) {
        this.emailVerificationCode = emailVerificationCode;
    }

    @Basic
    @Column(name = "email_verification_date")
    public Date getEmailVerificationDate() {
        return emailVerificationDate;
    }

    public void setEmailVerificationDate(Date emailVerificationDate) {
        this.emailVerificationDate = emailVerificationDate;
    }

    @Basic
    @Column(name = "ip")
    public byte[] getIp() {
        return ip;
    }

    public void setIp(byte[] ip) {
        this.ip = ip;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        User user = (User) o;
        return id == user.id &&
               Objects.equals(date, user.date) &&
               Objects.equals(invitationCodesId, user.invitationCodesId) &&
               Objects.equals(name, user.name) &&
               Objects.equals(password, user.password) &&
               Objects.equals(email, user.email) &&
               Objects.equals(emailVerificationCode, user.emailVerificationCode) &&
               Objects.equals(emailVerificationDate, user.emailVerificationDate) &&
               Arrays.equals(ip, user.ip);
    }

    @Override
    public int hashCode() {

        int result = Objects.hash(id, date, invitationCodesId, name, password, email, emailVerificationCode,
                                  emailVerificationDate
        );
        result = 31 * result + Arrays.hashCode(ip);
        return result;
    }

    @OneToMany(mappedBy = "usersByUsersId")
    public Collection<Account> getAccountsById() {
        return accountsById;
    }

    public void setAccountsById(Collection<Account> accountsById) {
        this.accountsById = accountsById;
    }

    @ManyToOne
    @JoinColumn(name = "invitation_codes_id", referencedColumnName = "id")
    public InvitationCode getInvitationCodesByInvitationCodesId() {
        return invitationCodesByInvitationCodesId;
    }

    public void setInvitationCodesByInvitationCodesId(
            InvitationCode invitationCodesByInvitationCodesId
    ) {
        this.invitationCodesByInvitationCodesId = invitationCodesByInvitationCodesId;
    }
}
