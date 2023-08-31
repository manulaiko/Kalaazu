package com.kalaazu.server.netty;

import com.kalaazu.server.util.Packet;
import io.netty.buffer.ByteBuf;
import io.netty.channel.ChannelHandlerContext;
import io.netty.handler.codec.ByteToMessageCodec;
import io.netty.handler.codec.MessageToByteEncoder;
import io.netty.handler.codec.MessageToMessageEncoder;
import org.springframework.core.serializer.Serializer;

import java.io.IOException;
import java.io.OutputStream;
import java.nio.charset.Charset;
import java.util.List;

/**
 * @author manulaiko <manulaiko@gmail.com>
 */
public class PacketSerializer extends ByteToMessageCodec<Packet> {
    /**
     * Encode from one message to an other. This method will be called for each written message that can be handled
     * by this encoder.
     *
     * @param ctx the {@link ChannelHandlerContext} which this {@link MessageToMessageEncoder} belongs to
     * @param msg the message to encode to an other one
     * @param out the {@link List} into which the encoded msg should be added
     *            needs to do some kind of aggregation
     */
    @Override
    protected void encode(ChannelHandlerContext ctx, Packet msg, ByteBuf out) {
        out.writeCharSequence(msg.toString() + "\r\n", Charset.defaultCharset());
    }

    /**
     * @param ctx
     * @param in
     * @param out
     * @see ByteToMessageDecoder#decode(ChannelHandlerContext, ByteBuf, List)
     */
    @Override
    protected void decode(ChannelHandlerContext ctx, ByteBuf in, List<Object> out) {
        //out.add(new Packet(in.toString(Charset.defaultCharset())));
    }
}
