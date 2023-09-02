package com.kalaazu.server.netty;

import com.kalaazu.persistence.entity.AccountsEntity;
import io.netty.channel.ChannelId;
import lombok.Data;
import lombok.RequiredArgsConstructor;

/**
 * @author manulaiko <manulaiko@gmail.com>
 */
@RequiredArgsConstructor
@Data
public class GameSession {
    private final ChannelId channelId;

    private AccountsEntity account;
}
