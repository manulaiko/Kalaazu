package com.kalaazu.server.commands.out.settings;

import com.kalaazu.server.commands.OutCommand;
import com.kalaazu.server.util.Packet;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * @author manulaiko <manulaiko@gmail.com>
 */
@EqualsAndHashCode(callSuper = false)
@Data
@AllArgsConstructor
@NoArgsConstructor
public class UpdateDisplaySettingsCommand extends OutCommand {
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

    private boolean showMinimapBackground;
    private boolean force2D;
    private int displaySetting3DqualityAntialias;
    private int qualityBackground;
    private int displaySetting3DqualityEffects;
    private int displaySetting3DqualityLights;
    private int displaySetting3DqualityTextures;
    private int qualityPoizone;
    private int displaySetting3DsizeTextures;
    private int displaySetting3DtextureFiltering;
    private boolean proActionBarEnabled;
    private boolean proActionBarKeyboardInputEnabled;
    private boolean proActionBarAutohideEnabled;

    @Override
    public void write(Packet packet) {
        packet.writeShort(id);

        packet.writeInt(displaySetting3DqualityAntialias << 11 | displaySetting3DqualityAntialias >> 21);
        packet.writeShort(0);
        packet.writeBoolean(proActionBarEnabled);
        packet.writeBoolean(proActionBarAutohideEnabled);
        packet.writeShort(0);
        packet.writeInt(displaySetting3DqualityTextures << 11 | displaySetting3DqualityTextures >> 21);
        packet.writeBoolean(force2D);
        packet.writeInt(qualityPoizone << 14 | qualityPoizone >> 18);
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
        packet.writeBoolean(showMinimapBackground);
        packet.writeInt(qualityBackground << 9 | qualityBackground >> 23);
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
