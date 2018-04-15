package com.manulaiko.kalaazu.eventsystem;

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
 * @author Manulaiko <manulaiko@gmail.com>
 */
public interface EventListener {
    /**
     * Listens for published events.
     *
     * @param event Published event.
     */
    @Subscribe(threadMode = ThreadMode.ASYNC)
    void onEvent(@NonNull Object event);
}
