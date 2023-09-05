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
        out.writeCharSequence(msg.toString() + "\r\n\u0000", C);
    }

    @Override
    protected void decode(ChannelHandlerContext ctx, ByteBuf in, List<Object> out) {
        var str = in.toString(C);

        // Force ByteBuf to read the string so next time we read from it, we don't read everything that's been received
        in.readBytes(str.length());

        out.add(new Packet(str));
    }
}
