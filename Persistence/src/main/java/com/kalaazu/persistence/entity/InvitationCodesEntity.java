package com.kalaazu.persistence.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.util.Collection;

/**
 * Invitation codes entity.
 * ========================
 * <p>
 * Entity for the `invitation_codes` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "invitation_codes", schema = "kalaazu")
@Data
public class InvitationCodesEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private short id;

    @Basic
    @Column(name = "code", nullable = false)
    private String code;

    @Basic
    @Column(name = "max", nullable = false)
    private byte max = 1;

    @OneToMany(mappedBy = "invitationCodesByInvitationCodesId", fetch = FetchType.LAZY)
    private Collection<InvitationCodesRedeemLogsEntity> invitationCodesRedeemLogs;
}
