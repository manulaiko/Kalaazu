package com.kalaazu.server.event;

import com.kalaazu.server.entities.MovableMapEntity;
import com.kalaazu.server.entities.Player;
import lombok.Getter;
import org.springframework.context.ApplicationEvent;

/**
 * Entity moved event.
 * ===================
 *
 * Fired when a map entity has moved.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
@Getter
public class EntityMovedEvent extends ApplicationEvent {
    private final MovableMapEntity entity;

    public EntityMovedEvent(MovableMapEntity entity, Object source) {
        super(source);

        this.entity = entity;
    }
}
