package com.kalaazu.server.netty;

import com.kalaazu.server.util.Packet;
import io.netty.buffer.ByteBuf;
import io.netty.channel.ChannelHandlerContext;
import io.netty.handler.codec.ByteToMessageCodec;

import java.nio.charset.Charset;
import java.util.List;

/**
 * Packet serializer.
 * ==================
 * <p>
 * Encoder and decoder for the packet format.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
public class PacketSerializer extends ByteToMessageCodec<Packet> {
    public static final Charset C = Charset.defaultCharset();

    @Override
    protected void encode(ChannelHandlerContext ctx, Packet msg, ByteBuf out) {
        out.writeShort(msg.getSize());
        out.writeBytes(msg.getBytes());
    }

    @Override
    protected void decode(ChannelHandlerContext ctx, ByteBuf in, List<Object> out) {
        var length = in.readShort();
        var packet = new byte[length];
        in.readBytes(packet);

        out.add(new Packet(packet));
    }
}
