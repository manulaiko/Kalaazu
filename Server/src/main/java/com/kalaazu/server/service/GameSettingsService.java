package com.kalaazu.server.service;

import com.google.gson.Gson;
import com.kalaazu.persistence.entity.AccountsSettingsEntity;
import com.kalaazu.server.commands.OutCommand;
import com.kalaazu.server.commands.out.UpdateUserKeybindingsCommand;
import com.kalaazu.server.commands.out.UpdateUserSettingsCommand;
import com.kalaazu.server.netty.GameSession;
import com.kalaazu.server.netty.event.SendCommandEvent;
import com.kalaazu.server.netty.event.SendCommandsEvent;
import lombok.RequiredArgsConstructor;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;

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
        var keybindings = new ArrayList<UpdateUserKeybindingsCommand.Keybinding>();
        var commands = new HashMap<Integer, OutCommand>();

        accountsSettings.forEach(s -> {
            switch (s.getType()) {
                case 1 -> keybindings.add(mapper.fromJson(s.getValue(), UpdateUserKeybindingsCommand.Keybinding.class));
                case 2 -> commands.put(1, mapper.fromJson(s.getValue(), UpdateUserSettingsCommand.UpdateQualitySettingsCommand.class));
                case 3 -> commands.put(2, mapper.fromJson(s.getValue(), UpdateUserSettingsCommand.UpdateDisplaySettingsCommand.class));
                case 4 -> commands.put(3, mapper.fromJson(s.getValue(), UpdateUserSettingsCommand.UpdateQuestsSettingsCommand.class));
                case 5 -> commands.put(4, mapper.fromJson(s.getValue(), UpdateUserSettingsCommand.UpdateWindowSettingsCommand.class));
                case 6 -> commands.put(5, mapper.fromJson(s.getValue(), UpdateUserSettingsCommand.UpdateGameplaySettingsCommand.class));
                case 7 -> commands.put(6, mapper.fromJson(s.getValue(), UpdateUserSettingsCommand.UpdateAudioSettingsCommand.class));
            }
        });

        var updateUserKeybindings = new UpdateUserKeybindingsCommand(false, keybindings);

        var updateUserSettings = new UpdateUserSettingsCommand(
                (UpdateUserSettingsCommand.UpdateQualitySettingsCommand) commands.get(1),
                (UpdateUserSettingsCommand.UpdateQuestsSettingsCommand) commands.get(3),
                (UpdateUserSettingsCommand.UpdateDisplaySettingsCommand) commands.get(2),
                (UpdateUserSettingsCommand.UpdateWindowSettingsCommand) commands.get(4),
                (UpdateUserSettingsCommand.UpdateGameplaySettingsCommand) commands.get(5),
                (UpdateUserSettingsCommand.UpdateAudioSettingsCommand) commands.get(6)
        );

        context.publishEvent(new SendCommandsEvent(session, Arrays.asList(updateUserKeybindings, updateUserSettings), this));
    }
}
