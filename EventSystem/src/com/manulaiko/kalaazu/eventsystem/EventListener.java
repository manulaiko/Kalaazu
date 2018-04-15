package com.manulaiko.kalaazu.eventsystem;

import lombok.Data;
import lombok.NonNull;
import org.greenrobot.eventbus.Subscribe;
import org.greenrobot.eventbus.ThreadMode;

/**
 * Event listener.
 * ===============
 *
 * Subscribes to the event bus and listens for events.
 *
 * The method `onEvent` will be called when an event is published.
 *
 * By default, the events are handled asynchronously, you can change
 * this behaviour by overriding the `EventListener.onEvent(Object)` method.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
@Data
public abstract class EventListener {
    /**
     * The event manager of this listener.
     */
    private EventManager manager;

    /**
     * Subscribes the event listener.
     */
    public void subscribe() {
        this.manager.subscribe(this);
    }

    /**
     * Unsubscribes the event listener.
     */
    public void unsubscribe() {
        this.manager.unsubscribe(this);
    }

    /**
     * Listens for published events.
     *
     * @param event Published event.
     */
    @Subscribe(threadMode = ThreadMode.ASYNC)
    private void onEvent(@NonNull Object event) {
        this.onEvent((Event)event);
    }

    /**
     * Called when an event is published in the bus.
     *
     * @param event Published event.
     */
    public abstract void onEvent(Event event);
}
