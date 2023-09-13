package com.kalaazu.server.entities;

import com.kalaazu.math.Vector2;
import com.kalaazu.server.commands.out.map.MoveEntityCommand;

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
    Vector2 getDestination();

    Vector2 getInitialPosition();

    short getSpeed();

    boolean isMoving();

    void setMoving(boolean moving);

    long getEndMovementTime();

    int getTotalMovementTime();

    void startMovement(Vector2 from, Vector2 to);

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
