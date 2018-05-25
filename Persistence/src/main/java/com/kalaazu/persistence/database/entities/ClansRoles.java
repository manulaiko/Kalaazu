package com.kalaazu.persistence.database.entities;


import com.kalaazu.persistence.database.entities.clans_roles.generated.GeneratedClansRoles;
import com.kalaazu.persistence.database.entities.roles.Role;

/**
 * Clans' roles table.
 * ===================
 *
 * Contains the roles of each clan.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface ClansRoles extends GeneratedClansRoles, Entity<Integer>, Role {
}