-- Relations for the `invitation_codes_redeem_logs` table.
--
-- A log entry belongs to an invitation code.
--

ALTER TABLE `invitation_codes_redeem_logs`
    ADD CONSTRAINT `invitation_codes_redeem_logs_invitation_codes` FOREIGN KEY `invitation_codes_redeem_logs_invitation_codes` (`invitation_codes_id`)
        REFERENCES `invitation_codes` (`id`);
