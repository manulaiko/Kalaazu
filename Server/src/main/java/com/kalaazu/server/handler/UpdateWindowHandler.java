package com.kalaazu.server.handler;

import com.kalaazu.server.commands.in.UpdateWindow;
import com.kalaazu.server.netty.GameSession;
import com.kalaazu.server.util.Handler;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

/**
 * @author manulaiko <manulaiko@gmail.com>
 */
@Component
@Slf4j
@RequiredArgsConstructor
public class UpdateWindowHandler extends Handler<UpdateWindow> {
    @Getter
    private final short id = UpdateWindow.ID;

    @Getter
    private final Class<UpdateWindow> clazz = UpdateWindow.class;

    @Override
    public void handle(UpdateWindow packet, GameSession session) {
        log.info("Update window request received: {}", packet);
        // TODO Save window settings
    }
}
