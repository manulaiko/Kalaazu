package com.kalaazu.cms.dto;

import lombok.Data;

/**
 * Account DTO.
 * ============
 *
 * DTO For the account entity.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Data
public class Account {
    private int id;
    private String sessionId;
    private String name;
    private String banDate;
    private String premiumDate;
    private String date;
    private String lastLogin;
    private short skillPointsTotal = 0;
    private short skillPointsFree = 0;
    private long experience;
    private int honor;
    private long credits;
    private int uridium;
    private int jackpot;
    private short factionsId;
    private short levelsId;
    private short ranksId;
    private int clansId;
    private int accountsHangarsId;
}
