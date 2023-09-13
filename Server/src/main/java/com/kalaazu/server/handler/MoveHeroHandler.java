package com.kalaazu.server.handler;

import com.kalaazu.math.Vector2;
import com.kalaazu.server.commands.in.MoveHero;
import com.kalaazu.server.commands.out.map.MoveEntityCommand;
import com.kalaazu.server.entities.Player;
import com.kalaazu.server.event.BroadcastCommandEvent;
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

        var travelTime = calculateTime(player, packet.getTo());

        player.setMoving(true);
        player.setDestination(packet.getTo());
        player.setMovementStartTime(System.currentTimeMillis());
        player.setTotalMovementTime(travelTime);

        var command = new MoveEntityCommand(
                player.getId(),
                player.getDestination(),
                player.getTotalMovementTime()
        );

        ctx.publishEvent(new BroadcastCommandEvent(command, this));
    }

    private int calculateTime(Player player, Vector2 destination) {
        var currentPosition = getCurrentPosition(player);

        return (int) (destination.dst(currentPosition) / player.getSpeed() * 1000);
    }

    private Vector2 getCurrentPosition(Player player) {
        if (!player.isMoving()) {
            return player.getPosition();
        }

        var currentPosition = new Vector2(player.getPosition());

        var timeElapsed = System.currentTimeMillis() - player.getMovementStartTime();

        if (timeElapsed > player.getTotalMovementTime()) {
            player.setMoving(false);
            currentPosition = new Vector2(player.getDestination());

            player.setPosition(currentPosition);

            return currentPosition;
        }

        var direction = player.getDirection();

        return new Vector2(player.getPosition()).move(direction, timeElapsed, player.getSpeed());
    }
}
