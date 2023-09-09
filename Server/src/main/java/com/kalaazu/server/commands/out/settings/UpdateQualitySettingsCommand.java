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
@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
public class UpdateQualitySettingsCommand extends OutCommand {
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
        packet.writeShort(0);
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
        packet.writeShort(0);
        packet.writeShort(qualityCollectables);
    }
}
