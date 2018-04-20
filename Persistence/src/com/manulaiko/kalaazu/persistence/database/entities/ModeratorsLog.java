package com.manulaiko.kalaazu.persistence.database.entities;

import javax.persistence.*;
import java.util.Date;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "moderators_logs", schema = "kalaazu")
public class ModeratorsLog {
    private int id;

    private int moderatorsId;

    private Date date;

    private String type;

    private String text;

    private Moderator moderatorsByModeratorsId;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "moderators_id")
    public int getModeratorsId() {
        return moderatorsId;
    }

    public void setModeratorsId(int moderatorsId) {
        this.moderatorsId = moderatorsId;
    }

    @Basic
    @Column(name = "date")
    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Basic
    @Column(name = "type")
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Basic
    @Column(name = "text")
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
        ModeratorsLog that = (ModeratorsLog) o;
        return id == that.id &&
               moderatorsId == that.moderatorsId &&
               Objects.equals(date, that.date) &&
               Objects.equals(type, that.type) &&
               Objects.equals(text, that.text);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, moderatorsId, date, type, text);
    }

    @ManyToOne
    @JoinColumn(name = "moderators_id", referencedColumnName = "id", nullable = false)
    public Moderator getModeratorsByModeratorsId() {
        return moderatorsByModeratorsId;
    }

    public void setModeratorsByModeratorsId(
            Moderator moderatorsByModeratorsId
    ) {
        this.moderatorsByModeratorsId = moderatorsByModeratorsId;
    }
}
