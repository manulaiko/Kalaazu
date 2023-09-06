package com.kalaazu.server.service;

import com.google.gson.Gson;
import com.kalaazu.persistence.entity.AccountsSettingsEntity;
import com.kalaazu.server.commands.out.UpdateUserKeybindingsCommand;
import com.kalaazu.server.netty.GameSession;
import com.kalaazu.server.netty.event.SendCommandEvent;
import lombok.RequiredArgsConstructor;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Service;

import java.util.Collection;

/**
 * Game Settings service.
 * ======================
 * <p>
 * Service for game settings.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
@Service
@RequiredArgsConstructor
public class GameSettingsService {
    private final Gson mapper;
    private final ApplicationContext context;

    /**
     * Builds and sends the game settings packets.
     *
     * @param accountsSettings Account's settings.
     * @param session          Game session.
     */
    public void sendSettings(Collection<AccountsSettingsEntity> accountsSettings, GameSession session) {
        var settings = accountsSettings.stream()
                .filter(s -> s.getType() == 1)
                .map(k -> {
                    try {
                        return mapper.fromJson(k.getValue(), UpdateUserKeybindingsCommand.Keybinding.class);
                    } catch (Exception e) {
                        return null;
                    }
                })
                .toList();

        var command = new UpdateUserKeybindingsCommand();
        command.setRemove(false);
        command.setKeybindings(settings);

        context.publishEvent(new SendCommandEvent(session, command, this));
    }
}
