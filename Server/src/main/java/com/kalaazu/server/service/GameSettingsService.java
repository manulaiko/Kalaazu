package com.kalaazu.server.service;

import com.google.gson.Gson;
import com.kalaazu.persistence.entity.AccountsSettingsEntity;
import com.kalaazu.server.commands.OutCommand;
import com.kalaazu.server.commands.out.MenuBarCommand;
import com.kalaazu.server.commands.out.UpdateUserKeybindingsCommand;
import com.kalaazu.server.commands.out.UpdateUserSettingsCommand;
import com.kalaazu.server.netty.GameSession;
import com.kalaazu.server.netty.event.SendCommandsEvent;
import lombok.RequiredArgsConstructor;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Service;

import java.util.*;

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
                case 2 ->
                        commands.put(1, mapper.fromJson(s.getValue(), UpdateUserSettingsCommand.UpdateQualitySettingsCommand.class));
                case 3 ->
                        commands.put(2, mapper.fromJson(s.getValue(), UpdateUserSettingsCommand.UpdateDisplaySettingsCommand.class));
                case 4 ->
                        commands.put(3, mapper.fromJson(s.getValue(), UpdateUserSettingsCommand.UpdateQuestsSettingsCommand.class));
                case 5 ->
                        commands.put(4, mapper.fromJson(s.getValue(), UpdateUserSettingsCommand.UpdateWindowSettingsCommand.class));
                case 6 ->
                        commands.put(5, mapper.fromJson(s.getValue(), UpdateUserSettingsCommand.UpdateGameplaySettingsCommand.class));
                case 7 ->
                        commands.put(6, mapper.fromJson(s.getValue(), UpdateUserSettingsCommand.UpdateAudioSettingsCommand.class));
            }
        });

        var commandsToSend = new ArrayList<OutCommand>();
        commandsToSend.add(buildKeybindingSettings(keybindings));
        commandsToSend.add(buildUserSettings(commands));
        commandsToSend.add(buildMenuBar());

        context.publishEvent(new SendCommandsEvent(session, commandsToSend, this));
    }

    private UpdateUserKeybindingsCommand buildKeybindingSettings(List<UpdateUserKeybindingsCommand.Keybinding> keybindings) {
        return new UpdateUserKeybindingsCommand(false, keybindings);
    }

    private UpdateUserSettingsCommand buildUserSettings(Map<Integer, OutCommand> commands) {
        return new UpdateUserSettingsCommand(
                (UpdateUserSettingsCommand.UpdateQualitySettingsCommand) commands.get(1),
                (UpdateUserSettingsCommand.UpdateQuestsSettingsCommand) commands.get(3),
                (UpdateUserSettingsCommand.UpdateDisplaySettingsCommand) commands.get(2),
                (UpdateUserSettingsCommand.UpdateWindowSettingsCommand) commands.get(4),
                (UpdateUserSettingsCommand.UpdateGameplaySettingsCommand) commands.get(5),
                (UpdateUserSettingsCommand.UpdateAudioSettingsCommand) commands.get(6)
        );
    }

    private MenuBarCommand buildMenuBar() {
        var menuBarCommands = new ArrayList<MenuBarCommand.ClientUiMenuBarCommand>();

        var defaultWindows = getDefaultWindows();
        var defaultWindow = new Window(30, 30, 200, 100, false);

        var leftItems = new HashMap<String, String>();
        var rightItems = new HashMap<String, String>();

        leftItems.put("user", "title_user");
        leftItems.put("ship", "title_ship");
        //leftItems.Add("ship_warp", "ttip_shipWarp_btn");
        leftItems.put("chat", "title_chat");
        leftItems.put("group", "title_group");
        leftItems.put("minimap", "title_map");
        leftItems.put("spacemap", "title_spacemap");
        leftItems.put("log", "title_log");
        leftItems.put("pet", "title_pet");
        leftItems.put("spaceball", "title_spaceball");
        leftItems.put("booster", "title_booster");
        leftItems.put("traininggrounds", "title_traininggrounds");

        menuBarCommands.add(buildMenuBar(leftItems, defaultWindows, defaultWindow, true));

        rightItems.put("settings", "title_settings");
        rightItems.put("help", "title_help");
        rightItems.put("logout", "title_logout");
        rightItems.put("fullscreen", "ttip_fullscreen_btn");

        menuBarCommands.add(buildMenuBar(rightItems, defaultWindows, defaultWindow, false));

        return new MenuBarCommand(menuBarCommands);
    }

    private MenuBarCommand.ClientUiMenuBarCommand buildMenuBar(HashMap<String, String> rightItems, Map<String, Window> defaultWindows, Window defaultWindow, boolean isLeft) {
        var position = "0,0";
        var type = MenuBarCommand.ClientUiMenuBarCommand.GAME_FEATURE_BAR;
        if (!isLeft) {
            position = "98.3,0";
            type = MenuBarCommand.ClientUiMenuBarCommand.GENERIC_FEATURE_BAR;
        }

        var menuItems = new ArrayList<MenuBarCommand.ClientUiMenuBarCommand.ClientUiMenuBarItemCommand>();

        rightItems.forEach((k, v) -> {
            var tooltips = new ArrayList<MenuBarCommand.ClientUiMenuBarCommand.ClientUiMenuBarItemCommand.ClientUiTooltipsCommand.ClientUiTooltipCommand>();
            tooltips.add(new MenuBarCommand.ClientUiMenuBarCommand.ClientUiMenuBarItemCommand.ClientUiTooltipsCommand.ClientUiTooltipCommand(
                    MenuBarCommand.ClientUiMenuBarCommand.ClientUiMenuBarItemCommand.ClientUiTooltipsCommand.ClientUiTooltipCommand.STANDARD,
                    new MenuBarCommand.ClientUiMenuBarCommand.ClientUiMenuBarItemCommand.ClientUiTooltipsCommand.ClientUiTooltipCommand.ClientUITooltipTextFormatCommand(
                            MenuBarCommand.ClientUiMenuBarCommand.ClientUiMenuBarItemCommand.ClientUiTooltipsCommand.ClientUiTooltipCommand.ClientUITooltipTextFormatCommand.LOCALIZED
                    ),
                    new ArrayList<>(),
                    v
            ));

            var tooltipsCommand = new MenuBarCommand.ClientUiMenuBarCommand.ClientUiMenuBarItemCommand.ClientUiTooltipsCommand(tooltips);

            var window = defaultWindows.getOrDefault(k, defaultWindow);
            var item = new MenuBarCommand.UpdateWindowItemCommand(
                    window.maximized,
                    window.height,
                    true,
                    window.y,
                    window.x,
                    tooltipsCommand,
                    v,
                    window.width,
                    new MenuBarCommand.ClientUiMenuBarCommand.ClientUiMenuBarItemCommand.ClientUiTooltipsCommand(new ArrayList<>()),
                    k
            );

            menuItems.add(item);
        });

        return new MenuBarCommand.ClientUiMenuBarCommand(
                position,
                type,
                menuItems,
                "0"
        );
    }

    private Map<String, Window> getDefaultWindows() {
        var map = new HashMap<String, Window>();
        map.put("user", new Window(30, 30, 212, 88, false));
        map.put("ship", new Window(30, 30, 212, 88, false));
        map.put("ship_warp", new Window(50, 50, 300, 210, false));
        map.put("chat", new Window(10, 10, 300, 150, false));
        map.put("group", new Window(50, 50, 196, 200, false));
        map.put("minimap", new Window(30, 30, 238, 180, false));
        map.put("spacemap", new Window(10, 10, 650, 475, false));
        map.put("log", new Window(30, 30, 240, 150, false));
        map.put("pet", new Window(50, 50, 260, 130, false));
        map.put("spaceball", new Window(10, 10, 170, 70, false));
        map.put("booster", new Window(10, 10, 110, 150, false));
        map.put("traininggrounds", new Window(10, 10, 320, 320, false));
        map.put("settings", new Window(50, 50, 400, 470, false));
        map.put("help", new Window(10, 10, 219, 121, false));
        map.put("logout", new Window(50, 50, 200, 200, false));

        return map;
    }

    private record Window(
            int x,
            int y,
            int width,
            int height,
            boolean maximized
    ) {
    }
}
