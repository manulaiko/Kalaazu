package com.kalaazu.server.netty;

import com.kalaazu.server.service.GameService;
import com.kalaazu.server.util.Packet;
import io.netty.channel.*;
import io.netty.channel.socket.SocketChannel;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.net.SocketException;
import java.util.Map;

/**
 * @author manulaiko <manulaiko@gmail.com>
 */
@Slf4j
@Component
@RequiredArgsConstructor
@ChannelHandler.Sharable
public class InboundHandler extends SimpleChannelInboundHandler<Packet> {
    public final Map<ChannelId, GameSession> connections;
    public final GameService gameService;

    /**
     * Calls {@link ChannelHandlerContext#fireChannelRegistered()} to forward
     * to the next {@link ChannelInboundHandler} in the {@link ChannelPipeline}.
     * <p>
     * Sub-classes may override this method to change behavior.
     *
     * @param ctx
     */
    @Override
    public void channelRegistered(ChannelHandlerContext ctx) throws Exception {
        // Check for possible IP Bans here.

        var id = ctx.channel().id();

        connections.put(id, new GameSession(ctx.channel()));


        super.channelRegistered(ctx);
    }

    /**
     * Calls {@link ChannelHandlerContext#fireChannelUnregistered()} to forward
     * to the next {@link ChannelInboundHandler} in the {@link ChannelPipeline}.
     * <p>
     * Sub-classes may override this method to change behavior.
     *
     * @param ctx
     */
    @Override
    public void channelUnregistered(ChannelHandlerContext ctx) throws Exception {
        connections.remove(ctx.channel().id());

        super.channelUnregistered(ctx);
    }

    /**
     * Calls {@link ChannelHandlerContext#fireChannelRead(Object)} to forward
     * to the next {@link ChannelInboundHandler} in the {@link ChannelPipeline}.
     * <p>
     * Sub-classes may override this method to change behavior.
     *
     * @param ctx
     * @param packet
     */
    @Override
    public void channelRead0(ChannelHandlerContext ctx, Packet packet) {
        var connection = connections.get(ctx.channel().id());
        if (connection == null) {
            log.info("Invalid connection {}, packet: {}", ctx.channel().id(), packet);

            return;
        }

        gameService.processPacket(packet, connection);
    }

    /**
     * Calls {@link ChannelHandlerContext#fireExceptionCaught(Throwable)} to forward
     * to the next {@link ChannelHandler} in the {@link ChannelPipeline}.
     * <p>
     * Sub-classes may override this method to change behavior.
     *
     * @param ctx
     * @param cause
     */
    @Override
    public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) {
        if (cause.getMessage().equalsIgnoreCase("Connection reset")) {
            connections.remove(ctx.channel().id());
            ctx.channel().close();

            log.debug("Connection reset received");
        }

        log.warn("Exception caught!", cause);
    }
}
