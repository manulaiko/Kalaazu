package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Table(name = "server_logs", schema = "kalaazu", catalog = "")
public class ServerLogsEntity {
    private int       id;
    private Timestamp date;
    private String    level;
    private String    type;
    private String    context;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "date", nullable = false)
    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    @Basic
    @Column(name = "level", nullable = false, length = 255)
    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    @Basic
    @Column(name = "type", nullable = false, length = 255)
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Basic
    @Column(name = "context", nullable = false, length = -1)
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
        ServerLogsEntity that = (ServerLogsEntity) o;
        return id == that.id &&
               Objects.equals(date, that.date) &&
               Objects.equals(level, that.level) &&
               Objects.equals(type, that.type) &&
               Objects.equals(context, that.context);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, date, level, type, context);
    }
}
