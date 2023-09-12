package net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.controller.updates {

import net.bigpoint.darkorbit.mvc.gui.GuiConstants;
import net.bigpoint.darkorbit.mvc.gui.featuresMenu.FeaturesMenuConstants;
import net.bigpoint.darkorbit.mvc.gui.highlights.HighLightItemNotification;
import net.bigpoint.darkorbit.mvc.gui.highlights.model.HighlightItemVO;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.ItemsControlMenuConstants;

import org.puremvc.as3.multicore.interfaces.INotification;

import package_38.class_648;
import package_38.class_841;

import package_84.class_243;

public class RemoveMenuItemHighlightCommand extends class_243 {


    public function RemoveMenuItemHighlightCommand() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc2_: class_648 = param1.getBody() as class_648;
        switch (_loc2_.var_4733.var_4733) {
            case class_841.const_401:
                sendNotification(HighLightItemNotification.REMOVE_HIGHLIGHT, new HighlightItemVO(_loc2_.itemId, FeaturesMenuConstants.MENU_ID, _loc2_.var_257.type));
                break;
            case class_841.const_1475:
                sendNotification(HighLightItemNotification.REMOVE_HIGHLIGHT, new HighlightItemVO(_loc2_.itemId, ItemsControlMenuConstants.CATEGORY_BAR, _loc2_.var_257.type));
                sendNotification(HighLightItemNotification.REMOVE_HIGHLIGHT, new HighlightItemVO(_loc2_.itemId, ItemsControlMenuConstants.STANDARD_SLOT_BAR, _loc2_.var_257.type));
                sendNotification(HighLightItemNotification.REMOVE_HIGHLIGHT, new HighlightItemVO(_loc2_.itemId, ItemsControlMenuConstants.PREMIUM_SLOT_BAR, _loc2_.var_257.type));
                sendNotification(HighLightItemNotification.REMOVE_HIGHLIGHT, new HighlightItemVO(_loc2_.itemId, ItemsControlMenuConstants.PRO_ACTION_BAR, _loc2_.var_257.type));
                break;
            case class_841.WINDOW:
                sendNotification(HighLightItemNotification.REMOVE_HIGHLIGHT, new HighlightItemVO(_loc2_.itemId, GuiConstants.WINDOWS_ID, _loc2_.var_257.type));
        }
    }
}
}
