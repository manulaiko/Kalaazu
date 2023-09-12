package net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.controller.updates {

import net.bigpoint.darkorbit.mvc.common.sounds.SoundNotifications;
import net.bigpoint.darkorbit.mvc.gui.GuiConstants;
import net.bigpoint.darkorbit.mvc.gui.featuresMenu.FeaturesMenuConstants;
import net.bigpoint.darkorbit.mvc.gui.highlights.HighLightItemNotification;
import net.bigpoint.darkorbit.mvc.gui.highlights.model.HighlightItemVO;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.ItemsControlMenuConstants;

import org.puremvc.as3.multicore.interfaces.INotification;

import package_38.class_818;
import package_38.class_841;

import package_84.class_243;

public class AddMenuItemHighlightCommand extends class_243 {


    public function AddMenuItemHighlightCommand() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc2_: class_818 = param1.getBody() as class_818;
        var _loc3_: String = "";
        switch (_loc2_.var_4733.var_4733) {
            case class_841.const_401:
                _loc3_ = "null";
                break;
            case class_841.const_1475:
                _loc3_ = "null";
                break;
            case class_841.WINDOW:
                _loc3_ = "null";
        }
        sendNotification(HighLightItemNotification.ADD_HIGHLIGHT, new HighlightItemVO(_loc2_.itemId, _loc3_, _loc2_.var_257.type));
        sendNotification(SoundNotifications.PLAY_SOUND_TRIGGER_MODULE, _loc2_.var_3770);
    }
}
}
