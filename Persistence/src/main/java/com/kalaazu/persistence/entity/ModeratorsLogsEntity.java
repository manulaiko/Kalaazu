package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Table(name = "moderators_logs", schema = "kalaazu", catalog = "")
public class ModeratorsLogsEntity {
    private int              id;
    private Timestamp        date;
    private String           type;
    private String           text;
    private ModeratorsEntity moderatorsByModeratorsId;

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
    @Column(name = "type", nullable = false, length = 255)
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Basic
    @Column(name = "text", nullable = false, length = -1)
    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        ModeratorsLogsEntity that = (ModeratorsLogsEntity) o;
        return id == that.id &&
               Objects.equals(date, that.date) &&
               Objects.equals(type, that.type) &&
               Objects.equals(text, that.text);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, date, type, text);
    }

    @ManyToOne
    @JoinColumn(name = "moderators_id", referencedColumnName = "id", nullable = false)
    public ModeratorsEntity getModeratorsByModeratorsId() {
        return moderatorsByModeratorsId;
    }

    public void setModeratorsByModeratorsId(ModeratorsEntity moderatorsByModeratorsId) {
        this.moderatorsByModeratorsId = moderatorsByModeratorsId;
    }
}
