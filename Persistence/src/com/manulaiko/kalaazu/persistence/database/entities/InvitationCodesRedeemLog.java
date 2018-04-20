package com.manulaiko.kalaazu.persistence.database.entities;

import javax.persistence.*;
import java.util.Date;
import java.util.Arrays;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "invitation_codes_redeem_logs", schema = "kalaazu")
public class InvitationCodesRedeemLog {
    private int id;

    private int invitationCodesId;

    private byte[] ip;

    private Date date;

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
    @Column(name = "invitation_codes_id")
    public int getInvitationCodesId() {
        return invitationCodesId;
    }

    public void setInvitationCodesId(int invitationCodesId) {
        this.invitationCodesId = invitationCodesId;
    }

    @Basic
    @Column(name = "ip")
    public byte[] getIp() {
        return ip;
    }

    public void setIp(byte[] ip) {
        this.ip = ip;
    }

    @Basic
    @Column(name = "date")
    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        InvitationCodesRedeemLog that = (InvitationCodesRedeemLog) o;
        return id == that.id &&
               invitationCodesId == that.invitationCodesId &&
               Arrays.equals(ip, that.ip) &&
               Objects.equals(date, that.date);
    }

    @Override
    public int hashCode() {

        int result = Objects.hash(id, invitationCodesId, date);
        result = 31 * result + Arrays.hashCode(ip);
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "invitation_codes_id", referencedColumnName = "id", nullable = false)
    public InvitationCode getInvitationCodesByInvitationCodesId() {
        return invitationCodesByInvitationCodesId;
    }

    public void setInvitationCodesByInvitationCodesId(
            InvitationCode invitationCodesByInvitationCodesId
    ) {
        this.invitationCodesByInvitationCodesId = invitationCodesByInvitationCodesId;
    }
}
