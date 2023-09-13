package com.kalaazu.server.netty;

import com.kalaazu.persistence.entity.AccountsEntity;
import com.kalaazu.persistence.entity.AccountsShipsEntity;
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
    private Byte mapId;
}
