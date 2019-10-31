package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Table(name = "users", schema = "kalaazu", catalog = "")
public class UsersEntity {
    private int                   id;
    private Timestamp             date;
    private String                name;
    private String                password;
    private String                email;
    private String                emailVerificationCode;
    private Timestamp             emailVerificationDate;
    private String                ip;
    private InvitationCodesEntity invitationCodesByInvitationCodesId;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "date", nullable = false)
    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    @Basic
    @Column(name = "name", nullable = false, length = 255)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "password", nullable = false, length = 255)
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Basic
    @Column(name = "email", nullable = false, length = 255)
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Basic
    @Column(name = "email_verification_code", nullable = false, length = 32)
    public String getEmailVerificationCode() {
        return emailVerificationCode;
    }

    public void setEmailVerificationCode(String emailVerificationCode) {
        this.emailVerificationCode = emailVerificationCode;
    }

    @Basic
    @Column(name = "email_verification_date", nullable = true)
    public Timestamp getEmailVerificationDate() {
        return emailVerificationDate;
    }

    public void setEmailVerificationDate(Timestamp emailVerificationDate) {
        this.emailVerificationDate = emailVerificationDate;
    }

    @Basic
    @Column(name = "ip", nullable = false, length = 45)
    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
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
        UsersEntity that = (UsersEntity) o;
        return id == that.id &&
               Objects.equals(date, that.date) &&
               Objects.equals(name, that.name) &&
               Objects.equals(password, that.password) &&
               Objects.equals(email, that.email) &&
               Objects.equals(emailVerificationCode, that.emailVerificationCode) &&
               Objects.equals(emailVerificationDate, that.emailVerificationDate) &&
               Objects.equals(ip, that.ip);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, date, name, password, email, emailVerificationCode, emailVerificationDate, ip);
    }

    @ManyToOne
    @JoinColumn(name = "invitation_codes_id", referencedColumnName = "id")
    public InvitationCodesEntity getInvitationCodesByInvitationCodesId() {
        return invitationCodesByInvitationCodesId;
    }

    public void setInvitationCodesByInvitationCodesId(
            InvitationCodesEntity invitationCodesByInvitationCodesId
    ) {
        this.invitationCodesByInvitationCodesId = invitationCodesByInvitationCodesId;
    }
}
