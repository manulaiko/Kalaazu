package com.kalaazu.server.service;

import com.google.gson.Gson;
import com.kalaazu.persistence.entity.AccountsSettingsEntity;
import com.kalaazu.persistence.service.ItemsService;
import com.kalaazu.server.commands.OutCommand;
import com.kalaazu.server.commands.out.MenuBarCommand;
import com.kalaazu.server.commands.out.SlotBarsCommand;
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
public class GenericGameSettingsService {
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

    /**
     * Builds and sends the game settings packets.
     *
     * @param accountsSettings Account's settings.
     * @param session          Game session.
     */
    public void sendSettings(Collection<AccountsSettingsEntity> accountsSettings, GameSession session) {
        var keybindings = new ArrayList<UpdateUserKeybindingsCommand.Keybinding>();
        var commands = new HashMap<Integer, OutCommand>();
        var slotbars = new HashMap<String, List<SlotBarsCommand.ClientUiSlotBarCommand.ClientUiSlotBarItemCommand>>();

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
                case 8 ->
                        slotbars.computeIfAbsent(s.getName(), (s1) -> new ArrayList<>()).add(mapper.fromJson(s.getValue(), SlotBarsCommand.ClientUiSlotBarCommand.ClientUiSlotBarItemCommand.class));
            }
        });

        var commandsToSend = new ArrayList<OutCommand>();
        commandsToSend.add(buildKeybindingSettings(keybindings));
        commandsToSend.add(buildUserSettings(commands));
        commandsToSend.add(buildMenuBar());
        //commandsToSend.add(buildSlotBar(slotbars));

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

    private SlotBarsCommand buildSlotBar(HashMap<String, List<SlotBarsCommand.ClientUiSlotBarCommand.ClientUiSlotBarItemCommand>> slotbars) {
        var slotBars = new ArrayList<SlotBarsCommand.ClientUiSlotBarCommand>();
        var categories = new ArrayList<SlotBarsCommand.ClientUiSlotBarCategoryCommand>();

        slotBars.add(new SlotBarsCommand.ClientUiSlotBarCommand(
                standartSlotBarLayoutType,
                STANDARD_SLOT_BAR,
                standartSlotBarPosition,
                slotbars.get(STANDARD_SLOT_BAR),
                true
        ));
        slotBars.add(new SlotBarsCommand.ClientUiSlotBarCommand(
                premiumSlotBarLayoutType,
                PREMIUM_SLOT_BAR,
                premiumSlotBarPosition,
                slotbars.get(PREMIUM_SLOT_BAR),
                true
        ));
        slotBars.add(new SlotBarsCommand.ClientUiSlotBarCommand(
                proActionBarLayoutType,
                PRO_ACTION_BAR,
                proActionBarPosition,
                slotbars.get(PRO_ACTION_BAR),
                true
        ));

        /*var laserItems = new ArrayList<SlotBarsCommand.ClientUiSlotBarCategoryCommand.ClientUiSlotBarCategoryItemCommand>();

        var laserAmmo = items.findByCategoryAndType(ItemCategory.AMMUNITION, ItemType.LASER_AMMO);
        laserAmmo.forEach(i -> {
            var timer = new SlotBarsCommand.ClientUiSlotBarCategoryCommand.ClientUiSlotBarCategoryItemCommand.ClientUiSlotBarCategoryItemTimerCommand(
                    new SlotBarsCommand.ClientUiSlotBarCategoryCommand.ClientUiSlotBarCategoryItemCommand.ClientUiSlotBarCategoryItemTimerCommand.ClientUiSlotBarCategoryItemTimerStatusCommand(SlotBarsCommand.ClientUiSlotBarCategoryCommand.ClientUiSlotBarCategoryItemCommand.ClientUiSlotBarCategoryItemTimerCommand.ClientUiSlotBarCategoryItemTimerStatusCommand.COOLDOWN),
                    i.getLootId(),
                    false,
                    0,
                    i.getCooldown()
            );
            laserItems.add(new SlotBarsCommand.ClientUiSlotBarCategoryCommand.ClientUiSlotBarCategoryItemCommand(
                    SlotBarsCommand.ClientUiSlotBarCategoryCommand.ClientUiSlotBarCategoryItemCommand.NONE,
                    timer,
                    getItemStatus(i),
                    1,
                    getCooldownType(i),
                    SlotBarsCommand.ClientUiSlotBarCategoryCommand.ClientUiSlotBarCategoryItemCommand.SELECTION
            ));
        });*/


        return new SlotBarsCommand(
                categoryBarPosition,
                slotBars,
                categories
        );
    }

    private MenuBarCommand.ClientUiMenuBarCommand buildMenuBar(HashMap<String, String> rightItems, Map<String, Window> defaultWindows, Window defaultWindow, boolean isLeft) {
        var position = gameFeatureBarPosition;
        var type = MenuBarCommand.ClientUiMenuBarCommand.GAME_FEATURE_BAR;
        if (!isLeft) {
            position = genericFeatureBarPosition;
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
                gameFeatureBarLayoutType
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
