package com.kalaazu.server.netty;

import io.netty.channel.ChannelId;
import lombok.AllArgsConstructor;
import lombok.Data;

/**
 * @author manulaiko <manulaiko@gmail.com>
 */
@AllArgsConstructor
@Data
public class GameSession {
    private final ChannelId channelId;
}
