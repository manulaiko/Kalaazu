package com.manulaiko.kalaazu.persistence.database.entities;


import java.util.Date;
import java.util.Objects;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class AccountsQuest {
    private int id;

    private int questsId;

    private int accountsId;

    private boolean completed;

    private Date date;

    private Quest questsByQuestsId;

    private Account accountsByAccountsId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuestsId() {
        return questsId;
    }

    public void setQuestsId(int questsId) {
        this.questsId = questsId;
    }

    public int getAccountsId() {
        return accountsId;
    }

    public void setAccountsId(int accountsId) {
        this.accountsId = accountsId;
    }

    public boolean isCompleted() {
        return completed;
    }

    public void setCompleted(boolean completed) {
        this.completed = completed;
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
        AccountsQuest that = (AccountsQuest) o;
        return id == that.id &&
               questsId == that.questsId &&
               accountsId == that.accountsId &&
               completed == that.completed &&
               Objects.equals(date, that.date);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, questsId, accountsId, completed, date);
    }

    public Quest getQuestsByQuestsId() {
        return questsByQuestsId;
    }

    public void setQuestsByQuestsId(Quest questsByQuestsId) {
        this.questsByQuestsId = questsByQuestsId;
    }

    public Account getAccountsByAccountsId() {
        return accountsByAccountsId;
    }

    public void setAccountsByAccountsId(Account accountsByAccountsId) {
        this.accountsByAccountsId = accountsByAccountsId;
    }
}
