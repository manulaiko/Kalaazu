package com.kalaazu.server.util;

import lombok.Getter;
import lombok.SneakyThrows;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;

/**
 * Game packet
 * ===========
 * <p>
 * Represents a packet sent/received between the game server and the game client.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
public class Packet {
    private DataOutputStream out;
    private ByteArrayOutputStream baos;

    private DataInputStream in;

    @Getter
    private int size;

    public Packet(byte[] bytes) {
        this();

        this.size = bytes.length;
        this.in = new DataInputStream(new ByteArrayInputStream(bytes));
    }

    /**
     * Server sent packet constructor, initializes the packet with 0
     */
    public Packet() {
        this.baos = new ByteArrayOutputStream();
        this.out = new DataOutputStream(this.baos);
    }

    @SneakyThrows
    public void writeString(String argument) {
        out.writeUTF(argument);
    }

    @SneakyThrows
    public String readString() {
        return in.readUTF();
    }

    @SneakyThrows
    public void writeInt(int i) {
        out.writeInt(i);
    }

    @SneakyThrows
    public int readInt() {
        return in.readInt();
    }

    @SneakyThrows
    public void writeShort(short s) {
        out.writeShort(s);
    }

    @SneakyThrows
    public void writeShort(int s) {
        writeShort((short)s);
    }

    @SneakyThrows
    public short readShort() {
        return in.readShort();
    }

    @SneakyThrows
    public void writeLong(long l) {
        out.writeLong(l);
    }

    @SneakyThrows
    public long readLong() {
        return in.readLong();
    }

    @SneakyThrows
    public void writeBoolean(boolean b) {
        out.writeBoolean(b);
    }

    @SneakyThrows
    public boolean readBoolean() {
        return in.readBoolean();
    }

    @SneakyThrows
    public void writeByte(byte b) {
        out.writeByte(b);
    }

    @SneakyThrows
    public byte readByte() {
        return in.readByte();
    }

    @SneakyThrows
    public void writeDouble(double d) {
        out.writeDouble(d);
    }

    @SneakyThrows
    public double readDouble() {
        return in.readDouble();
    }

    @SneakyThrows
    public void writeFloat(float f) {
        out.writeFloat(f);
    }

    @SneakyThrows
    public double readFloat() {
        return in.readFloat();
    }

    /**
     * Resets the index to the beginning.
     */
    @SneakyThrows
    public void reset() {
        in.reset();
    }

    /**
     * Jumps index to idx.
     * <p>
     * If the given index is bigger than current argument length do nothing.
     *
     * @param idx Index to jump to.
     */
    @SneakyThrows
    public void jump(int idx) {
        in.reset();
        in.skip(idx);
    }

    /**
     * Returns the written bytes.
     *
     * @return written bytes.
     */
    public byte[] getBytes() {
        return this.baos.toByteArray();
    }
}
