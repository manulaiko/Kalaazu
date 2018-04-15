Contents:

 - [File Structure](#file_structure)
   - [Table Structure](#table_structure)
   - [Initial Dump](#initial_dump)
   - [Relations](#relations)
 - [Coding Style](#coding_style)

<a name="file_structure"></a>
File Structure
==============

Each table is located in its folder.

A table is divided in 3 parts:

 * Table structure.
 * Initial dump.
 * Relations.

<a name="table_structure"></a>
Table Structure.
----------------

The table structure contains the `CREATE TABLE` statement and the statements needed to specify the keys of the table.

The documentation starts with a title for the table and the description.

It's located in the `structure.sql` file.

Example:

```sql
-- Users table
-- 
-- Contains the registered users in the server.
--
CREATE TABLE `users`(
    `id`                  int       NOT NULL AUTO_INCREMENT            COMMENT 'Primary Key.',
    `date`                timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date when the user registered.',
    `invitation_codes_id` int       NULL     DEFAULT NULL,
    `accounts_id`         int       NOT_NULL                           COMMENT 'User\'s last used account.',
    -- Rest of columns

    CONSTRAINT `users_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Contains the login information of the registered users.';

CREATE  UNIQUE INDEX `users_id_idx` ON `users` (`id`);
CREATE  UNIQUE INDEX `users_accounts_id_idx` ON `users` (`accounts_id`);
-- Table keys
```

<a name="initial_dump"></a>
Initial Dump.
-------------

The initial dump contains the initial rows from the table. It doesn't need to have documentation.

It's located in the `dump.sql` file.

Example:

```
INSERT INTO `users`(`id`) VALUES
(1),
(2);
```

<a name="relations"></a>
Relations.
----------

The relations MUST be documented, even if there table isn't related to any other table.

It's located in the `relations.sql` file.

Example:

```sql
-- Relations for `users` table.
-- 
-- An user can have only one active account.
-- An user can register with an invitation code.
--

ALTER TABLE `users` ADD CONSTRAINT `users_accounts` FOREIGN KEY `users_accounts` (`accounts_id`)
    REFERENCES `accounts` (`id`);

ALTER TABLE `users` ADD CONSTRAINT `users_invitation_codes` FOREIGN KEY `users_invitation_codes` (`invitation_codes_id`)
    REFERENCES `invitation_codes` (`id`);
```

<a name="coding_style"></a>
Coding Style.
=============

The `CREATE TABLE` statement must be indented by columns (field name, type, default value, modifiers, comment...).
The comment must be at the end, can only be omitted when it's obvious what it means.

All fields **must** be non-nulls unless they need to be null.

Keywords are in uppercase (`INSERT`, `NULL`, `DEFAULT`...).

The primary key constraint is separated from the columns by one line.

Example:

```sql
-- News table.
--
-- Contains server news that are displayed in the home page.
--
CREATE TABLE `news` (
    `id`     int          NOT NULL AUTO_INCREMENT COMMENT 'Primary Key.',
    `date`   timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `image`  varchar(255) NOT NULL DEFAULT '',
    `title`  varchar(255) NOT NULL DEFAULT '',
    `teaser` varchar(255) NOT NULL DEFAULT '',
    `text`   text         NOT NULL,

    CONSTRAINT `news_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB CHARACTER SET utf8 COMMENT 'Server news.';
```
