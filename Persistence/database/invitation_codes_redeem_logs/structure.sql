-- Invitation codes redeem logs.
--
-- Contains the redeem logs for the invitation codes.
--
CREATE TABLE `invitation_codes_redeem_logs`
(
    `id`                  int         NOT NULL AUTO_INCREMENT
        COMMENT 'Primary Key.',
    `invitation_codes_id` smallint    NOT NULL
        COMMENT 'Invitation code ID.',
    `ip`                  varchar(45) NOT NULL DEFAULT '0.0.0.0'
        COMMENT 'IP that redeemed the code.',
    `date`                timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP
        COMMENT 'Date when the code was redeemed.',

    CONSTRAINT `invitation_codes_redeem_logs_pk` PRIMARY KEY (`id`)
) ENGINE InnoDB
  CHARACTER SET utf8
    COMMENT 'Contains the redeem logs for the invitation codes.';
