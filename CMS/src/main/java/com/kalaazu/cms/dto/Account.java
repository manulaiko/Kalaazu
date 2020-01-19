package com.kalaazu.cms.dto;

import lombok.Data;

import java.sql.Timestamp;

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
    private Timestamp banDate;
    private Timestamp premiumDate;
    private Timestamp date;
    private Timestamp lastLogin;
    private short skillPointsTotal = 0;
    private short skillPointsFree = 0;
    private long experience;
    private int honor;
    private long credits;
    private int uridium;
    private int jackpot;
    private short factionsId;
    private short levelsId;
}
