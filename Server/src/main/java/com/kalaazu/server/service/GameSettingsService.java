package com.kalaazu.server.service;

import com.google.gson.Gson;
import com.kalaazu.persistence.entity.AccountsSettingsEntity;
import com.kalaazu.persistence.service.ItemsService;
import com.kalaazu.server.commands.OutCommand;
import com.kalaazu.server.commands.out.ui.*;
import com.kalaazu.server.commands.out.settings.*;
import com.kalaazu.server.netty.GameSession;
import com.kalaazu.server.netty.event.SendCommandsEvent;
import com.kalaazu.service.DefaultGameSettingsService;
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
    public static final boolean hideAllWindows = false;
    public static final int scale = 6;
    public static final String barState = "24,1|23,1|100,1|25,1|35,0|34,0|39,0|";
    public static final String gameFeatureBarPosition = "0,0";
    public static final String gameFeatureBarLayoutType = "0";
    public static final String genericFeatureBarPosition = "98.3,0";
    public static final String genericFeatureBarLayoutType = "0";
    public static final String categoryBarPosition = "50,85";
    public static final String standartSlotBarPosition = "50,85|0,40";
    public static final String standartSlotBarLayoutType = "0";
    public static final String premiumSlotBarPosition = "50,85|0,80";
    public static final String premiumSlotBarLayoutType = "0";
    public static final String proActionBarPosition = "50,85|0,120";
    public static final String proActionBarLayoutType = "0";

    public static final String STANDARD_SLOT_BAR = "standardSlotBar";
    public static final String PREMIUM_SLOT_BAR = "premiumSlotBar";
    public static final String PRO_ACTION_BAR = "proActionBar";

    private final Gson mapper;
    private final ApplicationContext context;
    private final ItemsService items;
    private final DefaultGameSettingsService defaultGameSettingsService;

    /**
     * Builds and sends the game settings packets.
     *
     * @param accountsSettings Account's settings.
     * @param session          Game session.
     */
    public void sendSettings(Collection<AccountsSettingsEntity> accountsSettings, GameSession session) {
        var keybindings = new ArrayList<KeybindingCommand>();
        var commands = new HashMap<Integer, OutCommand>();
        var slotbars = new HashMap<String, List<ClientUiSlotBarItemCommand>>();

        accountsSettings.forEach(s -> {
            switch (s.getType()) {
                case 1 -> keybindings.add(mapper.fromJson(s.getValue(), KeybindingCommand.class));
                case 2 ->
                        commands.put(1, mapper.fromJson(s.getValue(), UpdateQualitySettingsCommand.class));
                case 3 ->
                        commands.put(2, mapper.fromJson(s.getValue(), UpdateDisplaySettingsCommand.class));
                case 4 ->
                        commands.put(3, mapper.fromJson(s.getValue(), UpdateQuestsSettingsCommand.class));
                case 5 ->
                        commands.put(4, mapper.fromJson(s.getValue(), UpdateWindowSettingsCommand.class));
                case 6 ->
                        commands.put(5, mapper.fromJson(s.getValue(), UpdateGameplaySettingsCommand.class));
                case 7 ->
                        commands.put(6, mapper.fromJson(s.getValue(), UpdateAudioSettingsCommand.class));
                case 8 ->
                        slotbars.computeIfAbsent(s.getName(), (s1) -> new ArrayList<>()).add(mapper.fromJson(s.getValue(), ClientUiSlotBarItemCommand.class));
            }
        });

        var commandsToSend = new ArrayList<OutCommand>();
        commandsToSend.add(buildKeybindingSettings(keybindings));
        commandsToSend.add(buildUserSettings(commands));
        commandsToSend.add(buildMenuBar());
        commandsToSend.add(buildSlotBar(slotbars));

        context.publishEvent(new SendCommandsEvent(session, commandsToSend, this));
    }

    private UpdateUserKeybindingsCommand buildKeybindingSettings(List<KeybindingCommand> keybindings) {
        return new UpdateUserKeybindingsCommand(false, keybindings);
    }

    private UpdateUserSettingsCommand buildUserSettings(Map<Integer, OutCommand> commands) {
        return new UpdateUserSettingsCommand(
                (UpdateQualitySettingsCommand) commands.get(1),
                (UpdateQuestsSettingsCommand) commands.get(3),
                (UpdateDisplaySettingsCommand) commands.get(2),
                (UpdateWindowSettingsCommand) commands.get(4),
                (UpdateGameplaySettingsCommand) commands.get(5),
                (UpdateAudioSettingsCommand) commands.get(6)
        );
    }

    private MenuBarCommand buildMenuBar() {
        var menuBarCommands = new ArrayList<ClientUiMenuBarCommand>();
        var defaultWindows = defaultGameSettingsService.getWindows();
        var defaultWindow = defaultGameSettingsService.getDefaultWindow();

        var leftItems = new HashMap<String, String>();
        var rightItems = new HashMap<String, String>();

        leftItems.put("user", "title_user");
        leftItems.put("ship", "title_ship");
        leftItems.put("ship_warp", "ttip_shipWarp_btn");
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

    private SlotBarsCommand buildSlotBar(HashMap<String, List<ClientUiSlotBarItemCommand>> slotbars) {
        var slotBars = new ArrayList<ClientUiSlotBarCommand>();
        var categories = new ArrayList<ClientUiSlotBarCategoryCommand>();

        slotBars.add(new ClientUiSlotBarCommand(
                standartSlotBarLayoutType,
                STANDARD_SLOT_BAR,
                standartSlotBarPosition,
                slotbars.getOrDefault(STANDARD_SLOT_BAR, new ArrayList<>()),
                true
        ));
        slotBars.add(new ClientUiSlotBarCommand(
                premiumSlotBarLayoutType,
                PREMIUM_SLOT_BAR,
                premiumSlotBarPosition,
                slotbars.getOrDefault(PREMIUM_SLOT_BAR, new ArrayList<>()),
                true
        ));
        slotBars.add(new ClientUiSlotBarCommand(
                proActionBarLayoutType,
                PRO_ACTION_BAR,
                proActionBarPosition,
                slotbars.getOrDefault(PRO_ACTION_BAR, new ArrayList<>()),
                true
        ));

        return new SlotBarsCommand(
                categoryBarPosition,
                slotBars,
                categories
        );
    }

    private ClientUiMenuBarCommand buildMenuBar(HashMap<String, String> items, Map<String, DefaultGameSettingsService.Window> defaultWindows, DefaultGameSettingsService.Window defaultWindow, boolean isLeft) {
        var position = gameFeatureBarPosition;
        var type = ClientUiMenuBarCommand.GAME_FEATURE_BAR;
        if (!isLeft) {
            position = genericFeatureBarPosition;
            type = ClientUiMenuBarCommand.GENERIC_FEATURE_BAR;
        }

        var menuItems = new ArrayList<ClientUiMenuBarItemCommand>();

        items.forEach((k, v) -> {
            var tooltips = new ArrayList<ClientUiTooltipCommand>();
            tooltips.add(new ClientUiTooltipCommand(
                    ClientUiTooltipCommand.STANDARD,
                    new ClientUITooltipTextFormatCommand(
                            ClientUITooltipTextFormatCommand.LOCALIZED
                    ),
                    new ArrayList<>(),
                    v
            ));

            var tooltipsCommand = new ClientUiTooltipsCommand(tooltips);

            var window = defaultWindows.getOrDefault(k, defaultWindow);
            var item = new UpdateWindowItemCommand(
                    window.maximized(),
                    window.height(),
                    true,
                    window.y(),
                    window.x(),
                    tooltipsCommand,
                    v,
                    window.width(),
                    new ClientUiTooltipsCommand(new ArrayList<>()),
                    k
            );

            menuItems.add(item);
        });

        return new ClientUiMenuBarCommand(
                position,
                type,
                menuItems,
                gameFeatureBarLayoutType
        );
    }
}
