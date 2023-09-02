package com.kalaazu.server.netty;

import com.kalaazu.server.util.Packet;
import io.netty.channel.ChannelHandler;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.SimpleChannelInboundHandler;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

/**
 * @author manulaiko <manulaiko@gmail.com>
 */
@Slf4j
@Component
@RequiredArgsConstructor
@ChannelHandler.Sharable
public class InboundHandler extends SimpleChannelInboundHandler<Packet> {
    private final ChannelManager channelManager;

    @Override
    public void channelRegistered(ChannelHandlerContext ctx) throws Exception {
        // Check for possible IP Bans here.
        var id = ctx.channel().id();

        channelManager.startGameSession(new GameSession(id), ctx.channel());

        super.channelRegistered(ctx);
    }

    @Override
    public void channelUnregistered(ChannelHandlerContext ctx) throws Exception {
        channelManager.endGameSession(ctx.channel().id());

        super.channelUnregistered(ctx);
    }

    @Override
    public void channelRead0(ChannelHandlerContext ctx, Packet packet) {
        channelManager.processPacket(packet, ctx.channel().id());
    }

    @Override
    public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) {
        if (cause.getMessage().equalsIgnoreCase("Connection reset")) {
            channelManager.endGameSession(ctx.channel().id());
            ctx.channel().close();

            log.debug("Connection reset received");
        }

        log.warn("Exception caught!", cause);
    }
}
