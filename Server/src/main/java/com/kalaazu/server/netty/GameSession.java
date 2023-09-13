package com.kalaazu.server.netty;

import com.kalaazu.persistence.entity.AccountsConfigurationsEntity;
import com.kalaazu.persistence.entity.AccountsEntity;
import com.kalaazu.persistence.entity.AccountsHangarsEntity;
import com.kalaazu.persistence.entity.AccountsShipsEntity;
import com.kalaazu.server.entities.Player;
import io.netty.channel.ChannelId;
import lombok.Data;
import lombok.RequiredArgsConstructor;

/**
 * Game Session.
 * =============
 *
 * Represents an active player.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
@RequiredArgsConstructor
@Data
public class GameSession {
    private final ChannelId channelId;

    private AccountsEntity account;
    private AccountsShipsEntity ship;
    private AccountsConfigurationsEntity configuration;
    private AccountsHangarsEntity hangar;
    private Byte mapId;
    private Player player;
}
