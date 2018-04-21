package com.manulaiko.kalaazu.persistence.database.entities;


import java.util.Date;
import java.util.Collection;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class Moderator {
    private int id;

    private int accountsId;

    private int type;

    private Date date;

    private Account accountsByAccountsId;

    private Collection<ModeratorsLog> moderatorsLogsById;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAccountsId() {
        return accountsId;
    }

    public void setAccountsId(int accountsId) {
        this.accountsId = accountsId;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

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

    public Account getAccountsByAccountsId() {
        return accountsByAccountsId;
    }

    public void setAccountsByAccountsId(Account accountsByAccountsId) {
        this.accountsByAccountsId = accountsByAccountsId;
    }

    public Collection<ModeratorsLog> getModeratorsLogsById() {
        return moderatorsLogsById;
    }

    public void setModeratorsLogsById(
            Collection<ModeratorsLog> moderatorsLogsById
    ) {
        this.moderatorsLogsById = moderatorsLogsById;
    }
}
