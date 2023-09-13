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
    default Vector2 getDirection() {
        return Vector2.sub(getPosition(), getDestination());
    }

    short getSpeed();

    boolean isMoving();

    long getEndMovementTime();
    int getTotalMovementTime();

    void move(Vector2 from, Vector2 to);

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
