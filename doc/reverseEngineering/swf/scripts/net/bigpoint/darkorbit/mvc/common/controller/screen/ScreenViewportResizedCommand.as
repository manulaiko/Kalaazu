package net.bigpoint.darkorbit.mvc.common.controller.screen {

import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;
import net.bigpoint.darkorbit.mvc.gui.featuresMenu.FeaturesMenuNotifications;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.ItemsControlMenuNotifications;

import org.puremvc.as3.multicore.interfaces.INotification;

import package_84.class_243;

public class ScreenViewportResizedCommand extends class_243 {


    public function ScreenViewportResizedCommand() {
        super();
    }

    override public function execute(param1: INotification): void {
        sendNotification(ItemsControlMenuNotifications.UPDATE_MENUS_POSITION);
        sendNotification(FeaturesMenuNotifications.UPDATE_POSITION);
        sendNotification(GuiNotifications.UPDATE_WINDOWS_POSITIONS);
        sendNotification(GuiNotifications.UPDATE_MODAL_WINDOWS);
        sendNotification(FeaturesMenuNotifications.UPDATE_WINDOWS_MINIMIZED_POSITIONS);
    }
}
}
