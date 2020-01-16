package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Invitation codes redeem logs entity.
 * ====================================
 *
 * Entity for the `invitation_codes_redeem_logs` table.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "invitation_codes_redeem_logs", schema = "kalaazu")
@Data
public class InvitationCodesRedeemLogsEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private int id;

    @Basic
    @Column(name = "ip", nullable = false, length = 45)
    private String ip = "0.0.0.0";

    @Basic
    @Column(name = "date", nullable = false)
    private Timestamp date;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "invitation_codes_id", referencedColumnName = "id", nullable = false)
    private InvitationCodesEntity invitationCodesByInvitationCodesId;
}
