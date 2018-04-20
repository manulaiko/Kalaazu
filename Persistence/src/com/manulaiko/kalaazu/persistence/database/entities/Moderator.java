package com.manulaiko.kalaazu.persistence.database.entities;

import javax.persistence.*;
import java.util.Date;
import java.util.Collection;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Entity
@Table(name = "moderators", schema = "kalaazu")
public class Moderator {
    private int id;

    private int accountsId;

    private int type;

    private Date date;

    private Account accountsByAccountsId;

    private Collection<ModeratorsLog> moderatorsLogsById;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "accounts_id")
    public int getAccountsId() {
        return accountsId;
    }

    public void setAccountsId(int accountsId) {
        this.accountsId = accountsId;
    }

    @Basic
    @Column(name = "type")
    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    @Basic
    @Column(name = "date")
    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        Moderator moderator = (Moderator) o;
        return id == moderator.id &&
               accountsId == moderator.accountsId &&
               type == moderator.type &&
               Objects.equals(date, moderator.date);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, accountsId, type, date);
    }

    @ManyToOne
    @JoinColumn(name = "accounts_id", referencedColumnName = "id", nullable = false)
    public Account getAccountsByAccountsId() {
        return accountsByAccountsId;
    }

    public void setAccountsByAccountsId(Account accountsByAccountsId) {
        this.accountsByAccountsId = accountsByAccountsId;
    }

    @OneToMany(mappedBy = "moderatorsByModeratorsId")
    public Collection<ModeratorsLog> getModeratorsLogsById() {
        return moderatorsLogsById;
    }

    public void setModeratorsLogsById(
            Collection<ModeratorsLog> moderatorsLogsById
    ) {
        this.moderatorsLogsById = moderatorsLogsById;
    }
}
