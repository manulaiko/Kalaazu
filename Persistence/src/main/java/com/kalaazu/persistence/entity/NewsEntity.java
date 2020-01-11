package com.kalaazu.persistence.entity;

import lombok.Data;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * News entity.
 * ============
 *
 * Entity for the `news` table`
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "news", schema = "kalaazu")
@Data
public class NewsEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private short id;

    @Basic
    @Column(name = "date", nullable = false)
    private Timestamp date;

    @Basic
    @Column(name = "image", nullable = false)
    private String image = "";

    @Basic
    @Column(name = "title", nullable = false)
    private String title = "";

    @Basic
    @Column(name = "teaser", nullable = false)
    private String teaser = "";

    @Basic
    @Column(name = "text", nullable = false, length = -1, columnDefinition = "TEXT")
    private String text;
}
