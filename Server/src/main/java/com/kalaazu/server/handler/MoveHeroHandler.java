package com.kalaazu.server.handler;

import com.kalaazu.server.commands.in.MoveHero;
import com.kalaazu.server.netty.GameSession;
import com.kalaazu.server.util.Handler;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;

/**
 * Move hero handler.
 * ==================
 *
 * Handles the player movement packet.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
@EqualsAndHashCode(callSuper = true)
@Component
@Data
public class MoveHeroHandler extends Handler<MoveHero> {
    private final short id = MoveHero.ID;
    private final Class<MoveHero> clazz = MoveHero.class;

    private final ApplicationContext ctx;

    @Override
    public void handle(MoveHero packet, GameSession session) {
        var player = session.getPlayer();

        player.move(packet.getFrom(), packet.getTo());
    }
}
