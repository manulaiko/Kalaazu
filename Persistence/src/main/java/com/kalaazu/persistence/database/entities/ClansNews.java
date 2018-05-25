package com.kalaazu.persistence.database.entities;

import com.kalaazu.persistence.database.entities.clans_news.generated.GeneratedClansNews;

/**
 * Clans' news table.
 * ==================
 *
 * Contains the news of each clan.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface ClansNews extends GeneratedClansNews, Entity<Integer> {
    /**
     * Returns the clan.
     *
     * @return The clan.
     */
    Clans getClan();

    /**
     * Returns the account.
     *
     * @return The account.
     */
    Accounts getAccount();
}