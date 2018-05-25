package com.kalaazu.persistence.database.entities.server_logs.generated;

import com.kalaazu.persistence.database.entities.ServerLogs;
import com.speedment.common.annotation.GeneratedCode;

import java.sql.Timestamp;
import java.util.Objects;
import java.util.StringJoiner;

/**
 * The generated base implementation of the {@link
 * ServerLogs}-interface.
 * <p>
 * This file has been automatically generated by Speedment. Any changes made to
 * it will be overwritten.
 *
 * @author Speedment
 */
@GeneratedCode("Speedment")
public abstract class GeneratedServerLogsImpl implements ServerLogs {

    private int id;

    private Timestamp date;

    private String level;

    private String type;

    private String context;

    protected GeneratedServerLogsImpl() {

    }

    @Override
    public Integer getId() {
        return id;
    }

    @Override
    public Timestamp getDate() {
        return date;
    }

    @Override
    public String getLevel() {
        return level;
    }

    @Override
    public String getType() {
        return type;
    }

    @Override
    public String getContext() {
        return context;
    }

    @Override
    public ServerLogs setId(int id) {
        this.id = id;
        return this;
    }

    @Override
    public ServerLogs setDate(Timestamp date) {
        this.date = date;
        return this;
    }

    @Override
    public ServerLogs setLevel(String level) {
        this.level = level;
        return this;
    }

    @Override
    public ServerLogs setType(String type) {
        this.type = type;
        return this;
    }

    @Override
    public ServerLogs setContext(String context) {
        this.context = context;
        return this;
    }

    @Override
    public String toString() {
        final StringJoiner sj = new StringJoiner(", ", "{ ", " }");
        sj.add("id = " + Objects.toString(getId()));
        sj.add("date = " + Objects.toString(getDate()));
        sj.add("level = " + Objects.toString(getLevel()));
        sj.add("type = " + Objects.toString(getType()));
        sj.add("context = " + Objects.toString(getContext()));
        return "ServerLogsImpl " + sj.toString();
    }

    @Override
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (!(that instanceof ServerLogs)) {
            return false;
        }
        final ServerLogs thatServerLogs = (ServerLogs) that;
        if (this.getId() != thatServerLogs.getId()) {
            return false;
        }
        if (!Objects.equals(this.getDate(), thatServerLogs.getDate())) {
            return false;
        }
        if (!Objects.equals(this.getLevel(), thatServerLogs.getLevel())) {
            return false;
        }
        if (!Objects.equals(this.getType(), thatServerLogs.getType())) {
            return false;
        }
        if (!Objects.equals(this.getContext(), thatServerLogs.getContext())) {
            return false;
        }
        return true;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 31 * hash + Integer.hashCode(getId());
        hash = 31 * hash + Objects.hashCode(getDate());
        hash = 31 * hash + Objects.hashCode(getLevel());
        hash = 31 * hash + Objects.hashCode(getType());
        hash = 31 * hash + Objects.hashCode(getContext());
        return hash;
    }
}