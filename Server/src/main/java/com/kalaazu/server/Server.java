package com.kalaazu.server;

import com.kalaazu.server.netty.SocketServer;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;

/**
 * @author manulaiko <manulaiko@gmail.com>
 */
@Component
@RequiredArgsConstructor
public class Server implements ApplicationListener<ApplicationReadyEvent> {
    private final SocketServer socketServer;

    /**
     * Handle an application event.
     *
     * @param event the event to respond to
     */
    @Override
    public void onApplicationEvent(ApplicationReadyEvent event) {
        socketServer.start();
    }
}
