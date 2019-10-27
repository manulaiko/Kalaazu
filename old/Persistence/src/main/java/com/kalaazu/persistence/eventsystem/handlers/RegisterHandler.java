package com.kalaazu.persistence.eventsystem.handlers;

import com.kalaazu.eventsystem.Handler;
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
    public void handle() {/*
        RegisterHandler.logger.info(super.getEvent().body());
        String username       = super.get("username");
        String password       = super.get("password");
        String email          = super.get("email");
        String ip             = super.get("ip");
        String invitationCode = super.get("invitationCode");
        byte   factionsID     = Byte.parseByte(super.get("factionsId"));

        if (username.length() <= 4) {
            super.fail("Username can't be shorter than 4 chars!");

            return;
        }
        if (!StringUtils.isEmail(email)) {
            super.fail("Invalid email!");

            return;
        }

        var u = Database.instance()
                        .all(Users.class)
                        .filter(i -> (
                                i.name()
                                 .equalsIgnoreCase(username) ||
                                i.email()
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


        var user = this.addUser(username, password, email, ip, code.id());

        var json = new JsonObject();
        json.put("usersId", user.id())
            .put("name", user.name())
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

    *//**
     * Finds and returns the ID of the specified invitation code.
     *
     * @param invitationCode The code.
     *
     * @return Code's ID.
     *//*
    private InvitationCodes findInvitationCode(String invitationCode, String ip) {
        var code = Database.instance()
                           .find(InvitationCodes.CODE, invitationCode, InvitationCodes.class);

        code.ifPresent(c -> {
            var redeems = Database.instance()
                                  .all(InvitationCodesRedeemLogs.class)
                                  .filter(InvitationCodesRedeemLogs.INVITATION_CODES_ID.equal(c.id()))
                                  .count();

            if (c.limit() >= 0 && redeems >= c.limit()) {
                //noinspection UnusedAssignment
                c = InvitationCodes.INVALID_CODE;

                return;
            }

            var log = new InvitationCodesRedeemLogsImpl();
            log.invitationCodesId(c.id())
               .ip(ip);

            Database.instance()
                    .create(log, InvitationCodesRedeemLogs.class);
        });

        return code.orElse(InvitationCodes.INVALID_CODE);
    }

    *//**
     * Adds the user to the database.
     *
     * @param username         User name.
     * @param password         User password.
     * @param email            User email.
     * @param ip               Registration ip.
     * @param invitationCodeId Invitation code ID.
     *
     * @return User entity.
     *//*
    private Users addUser(String username, String password, String email, String ip, short invitationCodeId) {
        var user = new UsersImpl();

        if (invitationCodeId > 0) {
            user.invitationCodesId(invitationCodeId);
        }

        user.name(username)
            .password(StringUtils.hash(password))
            .email(email)
            .emailVerificationCode(StringUtils.random(32))
            .ip(ip);

        return Database.instance()
                       .create(user, Users.class);*/
    }
}
