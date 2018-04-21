package com.manulaiko.kalaazu.persistence.database.entities;


import java.util.Date;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class Event {
    private int id;

    private String name;

    private String description;

    private Date startDate;

    private Date endDate;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        Event event = (Event) o;
        return id == event.id &&
               Objects.equals(name, event.name) &&
               Objects.equals(description, event.description) &&
               Objects.equals(startDate, event.startDate) &&
               Objects.equals(endDate, event.endDate);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, name, description, startDate, endDate);
    }
}
