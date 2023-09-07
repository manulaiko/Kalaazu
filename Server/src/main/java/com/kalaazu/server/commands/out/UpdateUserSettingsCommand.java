package com.kalaazu.server.commands.out;

import com.kalaazu.server.commands.OutCommand;
import com.kalaazu.server.util.Packet;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * Update user settings command.
 * =============================
 * <p>
 * Updates in game settings.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
public class UpdateUserSettingsCommand extends OutCommand {
    private final short id = 18381;

    private UpdateQualitySettingsCommand qualitySettings;
    private UpdateQuestsSettingsCommand questSettings;
    private UpdateDisplaySettingsCommand displaySettings;
    private UpdateWindowSettingsCommand windowSettings;
    private UpdateGameplaySettingsCommand gameplaySettings;
    private UpdateAudioSettingsCommand audioSettings;

    @Override
    public void write(Packet packet) {
        packet.writeShort(id);
        qualitySettings.write(packet);
        questSettings.write(packet);
        displaySettings.write(packet);
        windowSettings.write(packet);
        gameplaySettings.write(packet);
        packet.writeShort(-23775);
        audioSettings.write(packet);
    }

    @EqualsAndHashCode(callSuper = true)
    @Data
    @AllArgsConstructor
    @NoArgsConstructor
    public static class UpdateQualitySettingsCommand extends OutCommand {
        private final short id = 21137;

        private boolean notSet;
        private short qualityAttack;
        private short qualityBackground;
        private short qualityPresetting;
        private boolean qualityCustomized;
        private short qualityPOIzone;
        private short qualityShip;
        private short qualityEngine;
        private short qualityExplosion;
        private short qualityCollectables;
        private short qualityEffect;

        @Override
        public void write(Packet packet) {
            packet.writeShort(id);
            packet.writeShort(15684);
            packet.writeShort(qualityEffect);
            packet.writeShort(qualityPresetting);
            packet.writeShort(qualityBackground);
            packet.writeShort(qualityAttack);
            packet.writeBoolean(qualityCustomized);
            packet.writeBoolean(notSet);
            packet.writeShort(qualityShip);
            packet.writeShort(qualityExplosion);
            packet.writeShort(qualityEngine);
            packet.writeShort(qualityPOIzone);
            packet.writeShort(8709);
            packet.writeShort(qualityCollectables);
        }
    }

    @EqualsAndHashCode(callSuper = false)
    @Data
    @AllArgsConstructor
    @NoArgsConstructor
    public static class UpdateDisplaySettingsCommand extends OutCommand {
        private final short id = 16484;

        private boolean notSet;
        private boolean displayPlayerNames;
        private boolean displayResources;
        private boolean showPremiumQuickslotBar;
        private boolean allowAutoQuality;
        private boolean preloadUserShips;
        private boolean displayHitpointBubbles;
        private boolean showNotOwnedItems;
        private boolean displayChat;
        private boolean displayWindowsBackground;
        private boolean displayNotFreeCargoBoxes;
        private boolean dragWindowsAlways;
        private boolean displayNotifications;
        private boolean hoverShips;
        private boolean displayDrones;
        private boolean displayBonusBoxes;
        private boolean displayFreeCargoBoxes;

        private boolean var12P;
        private boolean varb3N;
        private int displaySetting3DqualityAntialias;
        private int varp3M;
        private int displaySetting3DqualityEffects;
        private int displaySetting3DqualityLights;
        private int displaySetting3DqualityTextures;
        private int var03r;
        private int displaySetting3DsizeTextures;
        private int displaySetting3DtextureFiltering;
        private boolean proActionBarEnabled;
        private boolean proActionBarKeyboardInputEnabled;
        private boolean proActionBarAutohideEnabled;

        @Override
        public void write(Packet packet) {
            packet.writeShort(id);

            packet.writeInt(displaySetting3DqualityAntialias << 11 | displaySetting3DqualityAntialias >> 21);
            packet.writeShort(30800);
            packet.writeBoolean(proActionBarEnabled);
            packet.writeBoolean(proActionBarAutohideEnabled);
            packet.writeShort(-21589);
            packet.writeInt(displaySetting3DqualityTextures << 11 | displaySetting3DqualityTextures >> 21);
            packet.writeBoolean(varb3N);
            packet.writeInt(var03r << 14 | var03r >> 18);
            packet.writeBoolean(showNotOwnedItems);
            packet.writeBoolean(displayDrones);
            packet.writeBoolean(displayNotifications);
            packet.writeInt(displaySetting3DqualityLights << 1 | displaySetting3DqualityLights >> 31);
            packet.writeBoolean(displayResources);
            packet.writeBoolean(displayPlayerNames);
            packet.writeBoolean(displayChat);
            packet.writeBoolean(preloadUserShips);
            packet.writeInt(displaySetting3DsizeTextures >> 12 | displaySetting3DsizeTextures << 20);
            packet.writeBoolean(displayWindowsBackground);
            packet.writeInt(displaySetting3DtextureFiltering >> 16 | displaySetting3DtextureFiltering << 16);
            packet.writeBoolean(var12P);
            packet.writeInt(varp3M << 9 | varp3M >> 23);
            packet.writeInt(displaySetting3DqualityEffects >> 4 | displaySetting3DqualityEffects << 28);
            packet.writeBoolean(displayBonusBoxes);
            packet.writeBoolean(displayFreeCargoBoxes);
            packet.writeBoolean(dragWindowsAlways);
            packet.writeBoolean(proActionBarKeyboardInputEnabled);
            packet.writeBoolean(notSet);
            packet.writeBoolean(displayHitpointBubbles);
            packet.writeBoolean(allowAutoQuality);
            packet.writeBoolean(hoverShips);
            packet.writeBoolean(showPremiumQuickslotBar);
            packet.writeBoolean(displayNotFreeCargoBoxes);
        }
    }

    @EqualsAndHashCode(callSuper = true)
    @Data
    @AllArgsConstructor
    @NoArgsConstructor
    public static class UpdateQuestsSettingsCommand extends OutCommand {
        private final short id = 21683;

        private boolean varf1t;
        private boolean varOn;
        private boolean questsLevelOrderDescending;
        private boolean questsAvailableFilter = true;
        private boolean questsUnavailableFilter;
        private boolean questsCompletedFilter;

        public void write(Packet packet) {
            packet.writeShort(id);

            packet.writeBoolean(questsLevelOrderDescending);
            packet.writeBoolean(questsAvailableFilter);
            packet.writeBoolean(questsUnavailableFilter);
            packet.writeBoolean(questsCompletedFilter);
            packet.writeShort(-19304);
            packet.writeBoolean(varf1t);
            packet.writeBoolean(varOn);
        }
    }


    @EqualsAndHashCode(callSuper = true)
    @Data
    @AllArgsConstructor
    @NoArgsConstructor
    public static class UpdateWindowSettingsCommand extends OutCommand {
        private final short id = 1110;

        private boolean hideAllWindows;
        private int scale = 0;
        private String barState = "";

        public void write(Packet packet) {
            packet.writeShort(id);

            packet.writeString(barState);
            packet.writeInt(scale << 13 | scale >> 19);
            packet.writeBoolean(hideAllWindows);
            packet.writeShort(-27662);
            packet.writeShort(15301);
        }
    }


    @EqualsAndHashCode(callSuper = true)
    @Data
    @AllArgsConstructor
    @NoArgsConstructor
    public static class UpdateGameplaySettingsCommand extends OutCommand {
        private final short id = 20988;

        private boolean notSet;
        private boolean autoRefinement;
        private boolean quickSlotStopAttack;
        private boolean autoBoost;
        private boolean autoBuyBootyKeys;
        private boolean doubleClickAttackEnabled;
        private boolean autoChangeAmmo;
        private boolean autoStartEnabled;
        private boolean showBattlerayNotifications;
        private boolean varE3N;

        public void write(Packet packet) {
            packet.writeShort(id);

            packet.writeBoolean(notSet);
            packet.writeBoolean(autoRefinement);
            packet.writeBoolean(autoChangeAmmo);
            packet.writeBoolean(varE3N);
            packet.writeBoolean(autoBuyBootyKeys);
            packet.writeBoolean(autoStartEnabled);
            packet.writeBoolean(quickSlotStopAttack);
            packet.writeBoolean(showBattlerayNotifications);
            packet.writeBoolean(doubleClickAttackEnabled);
            packet.writeShort(-15038);
            packet.writeBoolean(autoBoost);
        }
    }


    @EqualsAndHashCode(callSuper = true)
    @Data
    @AllArgsConstructor
    @NoArgsConstructor
    public static class UpdateAudioSettingsCommand extends OutCommand {
        private final short id = 27262;

        private boolean notSet = false;
        private boolean playCombatMusic = false;
        private int voice = 0;
        private int sound = 0;
        private int music = 0;


        public void write(Packet packet) {
            packet.writeShort(id);

            packet.writeShort(-4407);
            packet.writeInt(voice << 9 | voice >> 23);
            packet.writeInt(sound << 7 | sound >> 25);
            packet.writeBoolean(playCombatMusic);
            packet.writeInt(music >> 4 | music << 28);
            packet.writeShort(-5063);
            packet.writeBoolean(notSet);
        }
    }
}
