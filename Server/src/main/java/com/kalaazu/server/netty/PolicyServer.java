package com.kalaazu.server.netty;

import io.netty.bootstrap.ServerBootstrap;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.ChannelOption;
import io.netty.channel.SimpleChannelInboundHandler;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.SocketChannel;
import io.netty.channel.socket.nio.NioServerSocketChannel;
import io.netty.handler.codec.DelimiterBasedFrameDecoder;
import io.netty.handler.codec.Delimiters;
import io.netty.handler.codec.string.StringDecoder;
import io.netty.handler.codec.string.StringEncoder;
import io.netty.handler.logging.LogLevel;
import io.netty.handler.logging.LoggingHandler;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * Socket server.
 * ==============
 * <p>
 * Listens for connections to the game socket server.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
@RequiredArgsConstructor
@Component
@Slf4j
public class PolicyServer extends Thread {
    public static final String POLICY_RESPONSE = "<?xml version=\"1.0\"?><cross-domain-policy xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:noNamespaceSchemaLocation=\"http://www.adobe.com/xml/schemas/PolicyFileSocket.xsd\"><allow-access-from domain=\"*\" to-ports=\"*\" secure=\"false\" /><site-control permitted-cross-domain-policies=\"master-only\" /></cross-domain-policy>\r\n";

    private final NioEventLoopGroup bossGroup;
    private final NioEventLoopGroup workerGroup;

    @Value("${app.port.policy}")
    private int port;

    public void run() {
        log.info("Starting policy server on port {}...", port);
        try {
            var b = new ServerBootstrap();
            b.group(bossGroup, workerGroup)
                    .channel(NioServerSocketChannel.class)
                    .handler(new LoggingHandler(LogLevel.TRACE))
                    .childHandler(new ChannelInitializer<SocketChannel>() {
                        @Override
                        public void initChannel(SocketChannel ch) {
                            ch.pipeline().addLast(
                                    new DelimiterBasedFrameDecoder(1024, Delimiters.nulDelimiter()),
                                    new StringDecoder(),
                                    new StringEncoder(),
                                    new InboundHandler()
                            );
                        }
                    })
                    .option(ChannelOption.SO_BACKLOG, 128)
                    .childOption(ChannelOption.SO_KEEPALIVE, true);

            // Bind and start to accept incoming connections.
            var f = b.bind(port).sync();

            f.channel().closeFuture().sync();
        } catch (Exception e) {
            log.warn("Couldn't start policy server!", e);
        } finally {
            workerGroup.shutdownGracefully();
            bossGroup.shutdownGracefully();
        }
    }

    @Slf4j
    static class InboundHandler extends SimpleChannelInboundHandler<String> {

        @Override
        public void channelRegistered(ChannelHandlerContext ctx) throws Exception {
            log.debug("Received policy server connection!");

            super.channelRegistered(ctx);
        }

        /**
         * Is called for each message of type {@link I}.
         *
         * @param ctx the {@link ChannelHandlerContext} which this {@link SimpleChannelInboundHandler}
         *            belongs to
         * @param msg the message to handle
         * @throws Exception is thrown if an error occurred
         */
        @Override
        protected void channelRead0(ChannelHandlerContext ctx, String msg) throws Exception {
            log.debug("Received policy server request! {}", msg);

            ctx.channel().writeAndFlush(PolicyServer.POLICY_RESPONSE);
            ctx.channel().close().sync();
        }
    }
}
