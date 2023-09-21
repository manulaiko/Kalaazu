package com.kalaazu.service;

import com.kalaazu.model.Keybinding;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Game settings service.
 * ======================
 * <p>
 * Service for the default game settings.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
@Service
@RequiredArgsConstructor
public class DefaultGameSettingsService {
    public List<Keybinding> getKeybindings() {
        var keybindings = new ArrayList<Keybinding>();

        keybindings.add(buildKeybinding(7, 0, 49));
        keybindings.add(buildKeybinding(7, 1, 50));
        keybindings.add(buildKeybinding(7, 2, 51));
        keybindings.add(buildKeybinding(7, 3, 52));
        keybindings.add(buildKeybinding(7, 4, 53));
        keybindings.add(buildKeybinding(7, 5, 54));
        keybindings.add(buildKeybinding(7, 6, 55));
        keybindings.add(buildKeybinding(7, 7, 56));
        keybindings.add(buildKeybinding(7, 8, 57));
        keybindings.add(buildKeybinding(7, 9, 48));
        keybindings.add(buildKeybinding(8, 0, 112));
        keybindings.add(buildKeybinding(8, 1, 113));
        keybindings.add(buildKeybinding(8, 2, 114));
        keybindings.add(buildKeybinding(8, 3, 115));
        keybindings.add(buildKeybinding(8, 4, 116));
        keybindings.add(buildKeybinding(8, 5, 117));
        keybindings.add(buildKeybinding(8, 6, 118));
        keybindings.add(buildKeybinding(8, 7, 119));
        keybindings.add(buildKeybinding(8, 8, 120));
        keybindings.add(buildKeybinding(8, 9, 121));
        keybindings.add(buildKeybinding(0, 0, 74));
        keybindings.add(buildKeybinding(1, 0, 67));
        keybindings.add(buildKeybinding(2, 0, 17));
        keybindings.add(buildKeybinding(3, 0, 32));
        keybindings.add(buildKeybinding(4, 0, 69));
        keybindings.add(buildKeybinding(5, 0, 82));
        keybindings.add(buildKeybinding(13, 0, 68));
        keybindings.add(buildKeybinding(6, 0, 76));
        keybindings.add(buildKeybinding(9, 0, 72));
        keybindings.add(buildKeybinding(10, 0, 70));
        keybindings.add(buildKeybinding(11, 0, 107));
        keybindings.add(buildKeybinding(12, 0, 109));
        keybindings.add(buildKeybinding(14, 0, 13));
        keybindings.add(buildKeybinding(15, 0, 9));
        keybindings.add(buildKeybinding(8, 9, 121));
        keybindings.add(buildKeybinding(16, 0, 16));

        return keybindings;
    }

    public QualitySettings getQualitySettings() {
        return new QualitySettings(
                false,
                3,
                3,
                3,
                true,
                3,
                1,
                1,
                1,
                1,
                1
        );
    }

    public DisplaySettings getDisplaySettings() {
        return new DisplaySettings(
                false,
                true,
                true,
                true,
                true,
                true,
                true,
                true,
                true,
                true,
                true,
                true,
                true,
                true,
                true,
                true,
                true,
                true,
                true,
                4,
                4,
                4,
                3,
                3,
                4,
                3,
                -1,
                true,
                true,
                true
        );
    }

    public QuestSettings getQuestSettings() {
        return new QuestSettings(
                false,
                false,
                false,
                false
        );
    }

    public WindowSettings getWindowSettings() {
        return new WindowSettings(
                false,
                6,
                "24,1|23,1|100,1|25,1|35,0|34,0|39,0|"
        );
    }

    public GameplaySettings getGameplaySettings() {
        return new GameplaySettings(
                false,
                false,
                true,
                false,
                false,
                true,
                true,
                true,
                true,
                true
        );
    }

    public AudioSettings getAudioSettings() {
        return new AudioSettings(
                false,
                true,
                0,
                0,
                0
        );
    }

    public Map<String, Window> getWindows() {
        var map = new HashMap<String, Window>();
        map.put("user", new Window(0, 100, 212, 88, true));
        map.put("ship", new Window(87, 100, 212, 88, true));
        map.put("ship_warp", new Window(50, 50, 300, 210, false));
        map.put("chat", new Window(0, 6, 370, 260, true));
        map.put("group", new Window(100, 30, 196, 200, true));
        map.put("minimap", new Window(100, 100, 238, 180, true));
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

    public Window getDefaultWindow() {
        return new Window(30, 30, 200, 100, false);
    }

    private Keybinding buildKeybinding(int actionType, int parameter, int key) {
        return new Keybinding((short) actionType, (short) 0, parameter, List.of(key));
    }

    public record Window(
            int x,
            int y,
            int width,
            int height,
            boolean maximized
    ) {
    }

    public record QualitySettings(
            boolean notSet,
            int qualityAttack,
            int qualityBackground,
            int qualityPresetting,
            boolean qualityCustomized,
            int qualityPOIzone,
            int qualityShip,
            int qualityEngine,
            int qualityExplosion,
            int qualityCollectables,
            int qualityEffect
    ) {
    }

    public record DisplaySettings(
            boolean notSet,
            boolean displayPlayerNames,
            boolean displayResources,
            boolean showPremiumQuickslotBar,
            boolean allowAutoQuality,
            boolean preloadUserShips,
            boolean displayHitpointBubbles,
            boolean showNotOwnedItems,
            boolean displayChat,
            boolean displayWindowsBackground,
            boolean displayNotFreeCargoBoxes,
            boolean dragWindowsAlways,
            boolean displayNotifications,
            boolean hoverShips,
            boolean displayDrones,
            boolean displayBonusBoxes,
            boolean displayFreeCargoBoxes,

            boolean showMinimapBackground,
            boolean force2D,
            int displaySetting3DqualityAntialias,
            int qualityBackground,
            int displaySetting3DqualityEffects,
            int displaySetting3DqualityLights,
            int displaySetting3DqualityTextures,
            int qualityPoizone,
            int displaySetting3DsizeTextures,
            int displaySetting3DtextureFiltering,
            boolean proActionBarEnabled,
            boolean proActionBarKeyboardInputEnabled,
            boolean proActionBarAutohideEnabled
    ) {
    }

    public record QuestSettings(
            boolean questsLevelOrderDescending,
            boolean questsAvailableFilter,
            boolean questsUnavailableFilter,
            boolean questsCompletedFilter
    ) {
    }

    public record WindowSettings(
            boolean hideAllWindows,
            int scale,
            String barState
    ) {
    }

    public record GameplaySettings(
            boolean notSet,
            boolean autoRefinement,
            boolean quickSlotStopAttack,
            boolean autoBoost,
            boolean autoBuyBootyKeys,
            boolean doubleClickAttackEnabled,
            boolean autoChangeAmmo,
            boolean autoStartEnabled,
            boolean showBattlerayNotifications,
            boolean showLowHpWarn
    ) {
    }

    public record AudioSettings(
            boolean notSet,
            boolean playCombatMusic,
            int voice,
            int sound,
            int music
    ) {
    }
}
