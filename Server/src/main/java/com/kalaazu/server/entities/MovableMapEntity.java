package com.kalaazu.server.entities;

import com.kalaazu.math.Vector2;
import com.kalaazu.server.commands.out.map.MoveEntityCommand;
import com.kalaazu.server.event.BroadcastCommandEvent;
import org.springframework.context.ApplicationContext;

/**
 * Movable map entity.
 * ===================
 * <p>
 * A map entity that can move.
 * <p>
 * Movable entities have a destination and a speed.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
public interface MovableMapEntity extends MapEntity {
    ApplicationContext getCtx();

    Vector2 getDestination();
    void setDestination(Vector2 v);

    Vector2 getInitialPosition();
    void setInitialPosition(Vector2 v);

    short getSpeed();

    boolean isMoving();

    void setMoving(boolean moving);

    long getEndMovementTime();
    void setEndMovementTime(long l);

    int getTotalMovementTime();

    default void move(Vector2 from, Vector2 to) {
        this.setMoving(true);

        this.setInitialPosition(from);
        this.setPosition(from);
        this.setDestination(to);

        this.setEndMovementTime(System.currentTimeMillis() + this.getMovementDuration());
        this.getCtx().publishEvent(new BroadcastCommandEvent(this.getMovementCommand(), this));
    }

    default void movementTick() {
        if (!this.isMoving()) {
            return;
        }

        var timeLeft = this.getEndMovementTime() - System.currentTimeMillis();

        if (timeLeft <= 0) {
            this.setMoving(false);
            this.setPosition(this.getDestination());

            return;
        }
        var traveled = Vector2.sub(this.getInitialPosition(), this.getDestination());

        traveled.div(getTotalMovementTime())
                .scl(timeLeft);

        this.setPosition(Vector2.sub(this.getDestination(), traveled));
    }

    default int getMovementDuration() {
        if (!this.isMoving()) {
            return 0;
        }

        return (int) (this.getPosition().dst(this.getDestination()) * 1000 / this.getSpeed());
    }

    default MoveEntityCommand getMovementCommand() {
        return new MoveEntityCommand(
                this.getId(),
                this.getDestination(),
                this.getMovementDuration()
        );
    }
}
