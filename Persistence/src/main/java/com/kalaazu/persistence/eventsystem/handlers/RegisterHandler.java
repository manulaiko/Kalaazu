package com.kalaazu.persistence.eventsystem.handlers;

import com.kalaazu.eventsystem.Handler;
import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.*;
import com.kalaazu.persistence.database.entities.invitation_codes_redeem_logs.InvitationCodesRedeemLogsImpl;
import com.kalaazu.persistence.database.entities.users.UsersImpl;
import com.kalaazu.util.StringUtils;
import io.vertx.core.Vertx;
import io.vertx.core.json.JsonObject;
import io.vertx.core.logging.Logger;
import io.vertx.core.logging.LoggerFactory;


/**
 * Register handler.
 * =================
 *
 * Registers an user in the database.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class RegisterHandler extends Handler {
    /**
     * Console logger.
     */
    public static final Logger logger = LoggerFactory.getLogger(RegisterHandler.class);

    @Override
    public void handle() {
        String username       = super.get("username");
        String password       = super.get("password");
        String email          = super.get("email");
        String ip             = super.get("ip");
        String invitationCode = super.get("invitationCode");
        byte   factionsID     = super.get("factionsId");

        if (username.length() <= 4) {
            super.fail("Username can't be shorter than 4 chars!");

            return;
        }
        if (!StringUtils.isEmail(email)) {
            super.fail("Invalid email!");

            return;
        }

        var u = Database.getInstance()
                        .all(Users.class)
                        .filter(i -> (
                                i.getName()
                                 .equalsIgnoreCase(username) ||
                                i.getEmail()
                                 .equalsIgnoreCase(email)
                        ))
                        .findFirst();

        if (u.isPresent()) {
            super.fail("Username/email already exists!");

            return;
        }

        var code = this.findInvitationCode(invitationCode, ip);
        if (code.equals(InvitationCodes.INVALID_CODE)) {
            super.fail("Invalid invitation code!");

            return;
        }


        var user = this.addUser(username, password, email, ip, code.getId());

        var json = new JsonObject();
        json.put("usersId", user.getId())
            .put("name", user.getName())
            .put("factionsId", factionsID);

        Vertx.currentContext()
             .owner()
             .eventBus()
             .send("persistence.create_account", json, h -> {
                 if (h.failed()) {
                     super.getEvent()
                          .fail(
                                  0,
                                  h.cause()
                                   .getMessage()
                          );

                     return;
                 }

                 super.getEvent()
                      .reply(h.result()
                              .body());
             });
    }

    /**
     * Finds and returns the ID of the specified invitation code.
     *
     * @param invitationCode The code.
     *
     * @return Code's ID.
     */
    private InvitationCodes findInvitationCode(String invitationCode, String ip) {
        var code = Database.getInstance()
                           .find(InvitationCodes.CODE, invitationCode, InvitationCodes.class);

        code.ifPresent(c -> {
            var redeems = Database.getInstance()
                                  .all(InvitationCodesRedeemLogs.class)
                                  .filter(InvitationCodesRedeemLogs.INVITATION_CODES_ID.equal(c.getId()))
                                  .count();

            if (c.getLimit() >= 0 && redeems >= c.getLimit()) {
                //noinspection UnusedAssignment
                c = InvitationCodes.INVALID_CODE;

                return;
            }

            var log = new InvitationCodesRedeemLogsImpl();
            log.setInvitationCodesId(c.getId())
               .setIp(ip);

            Database.getInstance()
                    .create(log, InvitationCodesRedeemLogs.class);
        });

        return code.orElse(InvitationCodes.INVALID_CODE);
    }

    /**
     * Adds the user to the database.
     *
     * @param username         User name.
     * @param password         User password.
     * @param email            User email.
     * @param ip               Registration ip.
     * @param invitationCodeId Invitation code ID.
     *
     * @return User entity.
     */
    private Users addUser(String username, String password, String email, String ip, short invitationCodeId) {
        var user = new UsersImpl();

        if (invitationCodeId > 0) {
            user.setInvitationCodesId(invitationCodeId);
        }

        user.setName(username)
            .setPassword(StringUtils.hash(password))
            .setEmail(email)
            .setEmailVerificationCode(StringUtils.random(32))
            .setIp(ip);

        return Database.getInstance()
                       .create(user, Users.class);
    }
}
