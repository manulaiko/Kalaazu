package com.kalaazu.server.netty;

import com.kalaazu.server.util.Packet;
import io.netty.buffer.ByteBuf;
import io.netty.channel.ChannelHandlerContext;
import io.netty.handler.codec.ByteToMessageCodec;

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
    @Override
    protected void encode(ChannelHandlerContext ctx, Packet msg, ByteBuf out) {
        var bytes = msg.getBytes();
        //out.writeShort(bytes.length);
        out.writeBytes(bytes);
    }

    @Override
    protected void decode(ChannelHandlerContext ctx, ByteBuf in, List<Object> out) {
        if (in.readableBytes() < 2) {
            return;
        }

        var length = in.readShort();
        var packet = new byte[length];
        in.readBytes(packet);

        out.add(new Packet(packet));
    }
}
