package com.manulaiko.kalaazu.persistence.database.entities;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "invitation_codes", schema = "kalaazu")
public class InvitationCode {
    private int id;

    private String code;

    private int limit;

    private Collection<InvitationCodesRedeemLog> invitationCodesRedeemLogsById;

    private Collection<User> usersById;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "code")
    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    @Basic
    @Column(name = "limit")
    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        InvitationCode that = (InvitationCode) o;
        return id == that.id &&
               limit == that.limit &&
               Objects.equals(code, that.code);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, code, limit);
    }

    @OneToMany(mappedBy = "invitationCodesByInvitationCodesId")
    public Collection<InvitationCodesRedeemLog> getInvitationCodesRedeemLogsById() {
        return invitationCodesRedeemLogsById;
    }

    public void setInvitationCodesRedeemLogsById(
            Collection<InvitationCodesRedeemLog> invitationCodesRedeemLogsById
    ) {
        this.invitationCodesRedeemLogsById = invitationCodesRedeemLogsById;
    }

    @OneToMany(mappedBy = "invitationCodesByInvitationCodesId")
    public Collection<User> getUsersById() {
        return usersById;
    }

    public void setUsersById(Collection<User> usersById) {
        this.usersById = usersById;
    }
}
