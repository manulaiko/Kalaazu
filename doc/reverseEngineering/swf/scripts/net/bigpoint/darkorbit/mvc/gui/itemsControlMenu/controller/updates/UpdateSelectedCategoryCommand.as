package net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.controller.updates {

import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.ItemsControlMenuNotifications;

import org.puremvc.as3.multicore.interfaces.INotification;

import package_84.class_243;

public class UpdateSelectedCategoryCommand extends class_243 {


    public function UpdateSelectedCategoryCommand() {
        super();
    }

    override public function execute(param1: INotification): void {
        sendNotification(ItemsControlMenuNotifications.REFRESH_SELECTED_CATEGORY_ITEMS_BAR);
    }
}
}
