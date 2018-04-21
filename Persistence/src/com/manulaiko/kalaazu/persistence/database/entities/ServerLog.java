package com.manulaiko.kalaazu.persistence.database.entities;


import java.util.Date;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class ServerLog {
    private int id;

    private Date date;

    private String level;

    private String type;

    private String context;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        ServerLog serverLog = (ServerLog) o;
        return id == serverLog.id &&
               Objects.equals(date, serverLog.date) &&
               Objects.equals(level, serverLog.level) &&
               Objects.equals(type, serverLog.type) &&
               Objects.equals(context, serverLog.context);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, date, level, type, context);
    }
}
