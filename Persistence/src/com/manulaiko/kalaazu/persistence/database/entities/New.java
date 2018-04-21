package com.manulaiko.kalaazu.persistence.database.entities;


import java.util.Date;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class New {
    private int id;

    private Date date;

    private String image;

    private String title;

    private String teaser;

    private String text;

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

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTeaser() {
        return teaser;
    }

    public void setTeaser(String teaser) {
        this.teaser = teaser;
    }

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
        New aNew = (New) o;
        return id == aNew.id &&
               Objects.equals(date, aNew.date) &&
               Objects.equals(image, aNew.image) &&
               Objects.equals(title, aNew.title) &&
               Objects.equals(teaser, aNew.teaser) &&
               Objects.equals(text, aNew.text);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, date, image, title, teaser, text);
    }
}
