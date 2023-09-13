package com.kalaazu.server.netty;

import com.kalaazu.server.util.Packet;
import io.netty.channel.ChannelHandler;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.SimpleChannelInboundHandler;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;

/**
 * Inbound handler.
 * ================
 * <p>
 * Process the incoming channel messages and connections.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
@Slf4j
@Component
@RequiredArgsConstructor
@ChannelHandler.Sharable
public class InboundHandler extends SimpleChannelInboundHandler<Packet> {
    private final ChannelManager channelManager;
    private final ApplicationContext applicationContext;

    @Override
    public void channelRegistered(ChannelHandlerContext ctx) throws Exception {
        // Check for possible IP Bans here.
        var id = ctx.channel().id();
        log.info("Connection received {}", id);

        var session = applicationContext.getBean(GameSession.class);
        session.setChannelId(id);

        channelManager.startGameSession(session, ctx.channel());

        super.channelRegistered(ctx);
    }

    @Override
    public void channelUnregistered(ChannelHandlerContext ctx) throws Exception {
        log.info("Connection closed {}", ctx.channel().id());
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
