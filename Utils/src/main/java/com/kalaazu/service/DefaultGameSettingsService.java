package com.kalaazu.service;

import com.kalaazu.model.Keybinding;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

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
                false,
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
                100,
                100,
                100
        );
    }

    private Keybinding buildKeybinding(int actionType, int parameter, int key) {
        return new Keybinding((short) actionType, (short) 0, parameter, List.of(key));
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

            boolean var12P,
            boolean varb3N,
            int displaySetting3DqualityAntialias,
            int varp3M,
            int displaySetting3DqualityEffects,
            int displaySetting3DqualityLights,
            int displaySetting3DqualityTextures,
            int var03r,
            int displaySetting3DsizeTextures,
            int displaySetting3DtextureFiltering,
            boolean proActionBarEnabled,
            boolean proActionBarKeyboardInputEnabled,
            boolean proActionBarAutohideEnabled
    ) {
    }

    public record QuestSettings(
            boolean varf1t,
            boolean varOn,
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
            boolean varE3N
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
