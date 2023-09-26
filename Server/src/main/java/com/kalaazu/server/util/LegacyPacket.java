package com.kalaazu.server.util;

import com.kalaazu.server.commands.out.LegacyCommand;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Game packet
 * ===========
 * <p>
 * Represents a packet sent/received between the game server and the game client.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
public class LegacyPacket extends LegacyCommand {
    private List<String> arguments = new ArrayList<>();

    @Getter
    private int index;

    /**
     * Server sent packet constructor, initializes the packet with 0
     */
    public LegacyPacket() {
        this.write("0");
    }

    public LegacyPacket(Object... arguments) {
        this();
        this.write(arguments);
    }

    public LegacyPacket(String argument) {
        arguments = Arrays.asList(argument.split("\\|"));
    }

    public void write(Object argument) {
        arguments.add(String.valueOf(argument));
    }

    public void write(Object... argument) {
        for (Object o : argument) {
            write(o);
        }
    }

    public String readString() {
        return arguments.get(index++);
    }

    public int readInt() {
        return Integer.parseInt(readString());
    }

    public short readShort() {
        return Short.parseShort(readString());
    }

    public long readLong() {
        return Long.parseLong(readString());
    }

    public boolean readBoolean() {
        var str = readString();

        // Boolean.parseBoolean("1") == false
        return "true".equalsIgnoreCase(str) || "1".equalsIgnoreCase(str);
    }

    public byte readByte() {
        return Byte.parseByte(readString());
    }

    /**
     * Resets the index to the beginning.
     */
    public void reset() {
        index = 0;
    }

    /**
     * Jumps index to idx.
     * <p>
     * If the given index is bigger than current argument length do nothing.
     *
     * @param idx Index to jump to.
     */
    public void jump(int idx) {
        if (idx > arguments.size()) {
            return;
        }

        index = idx;
    }

    public int size() {
        return arguments.size();
    }

    public String getPacket() {
        return this.toString();
    }

    @Override
    public String toString() {
        return String.join("|", arguments);
    }
}
