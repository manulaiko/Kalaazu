package com.manulaiko.kalaazu.persistence.database.entities;


import java.util.Collection;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class InvitationCode {
    private int id;

    private String code;

    private int limit;

    private Collection<InvitationCodesRedeemLog> invitationCodesRedeemLogsById;

    private Collection<User> usersById;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

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

    public Collection<InvitationCodesRedeemLog> getInvitationCodesRedeemLogsById() {
        return invitationCodesRedeemLogsById;
    }

    public void setInvitationCodesRedeemLogsById(
            Collection<InvitationCodesRedeemLog> invitationCodesRedeemLogsById
    ) {
        this.invitationCodesRedeemLogsById = invitationCodesRedeemLogsById;
    }

    public Collection<User> getUsersById() {
        return usersById;
    }

    public void setUsersById(Collection<User> usersById) {
        this.usersById = usersById;
    }
}
