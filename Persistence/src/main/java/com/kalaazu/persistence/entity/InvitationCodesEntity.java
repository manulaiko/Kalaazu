package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.Collection;

/**
 * Invitation codes entity.
 * ========================
 *
 * Entity for the `invitation_codes` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "invitation_codes", schema = "kalaazu")
@Data
public class InvitationCodesEntity {
    @Id
    @Column(name = "id", nullable = false)
    private short id;

    @Basic
    @Column(name = "code", nullable = false)
    private String code;

    @Basic
    @Column(name = "max", nullable = false)
    private byte max;

    @OneToMany(mappedBy = "invitationCodesByInvitationCodesId")
    private Collection<InvitationCodesRedeemLogsEntity> invitationCodesRedeemLogs;
}
