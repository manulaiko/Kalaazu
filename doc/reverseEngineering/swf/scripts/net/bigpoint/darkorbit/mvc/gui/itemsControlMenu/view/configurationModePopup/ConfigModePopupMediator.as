package net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.configurationModePopup {

import flash.events.Event;
import flash.events.MouseEvent;

import net.bigpoint.darkorbit.mvc.common.view.components.DOWindow;
import net.bigpoint.darkorbit.mvc.gui.GuiConstants;
import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;
import net.bigpoint.darkorbit.mvc.gui.featuresMenu.FeaturesMenuNotifications;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.ItemsControlMenuNotifications;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.model.ItemsControlMenuProxy;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.configurationModePopup.components.ConfigModePopup;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.mediator.Mediator;

public class ConfigModePopupMediator extends Mediator {

    public static const NAME: String = "MenuConfigModePopupMediator";


    public function ConfigModePopupMediator(param1: ConfigModePopup) {
        super(NAME, param1);
    }

    override public function onRegister(): void {
        super.onRegister();
        this.view.addEventListener(DOWindow.CLOSE_WINDOW_CLICKED, this.closeWindowClickHandler);
        this.addListeners();
    }

    override public function listNotificationInterests(): Array {
        return [];
    }

    override public function handleNotification(param1: INotification): void {
        var _loc2_: * = param1.getName();
        switch (0) {
        }
    }

    private function addListeners(): void {
        this.view.resetAndExit.addEventListener(MouseEvent.CLICK, this.resetAndExitClickHandler);
        this.view.saveAndExit.addEventListener(MouseEvent.CLICK, this.closeWindowClickHandler);
    }

    private function resetAndExitClickHandler(param1: MouseEvent): void {
        sendNotification(ItemsControlMenuNotifications.UPDATE_MENUS_POSITION, GuiConstants.CONFIG_RESET_AND_EXIT);
        sendNotification(FeaturesMenuNotifications.UPDATE_POSITION, GuiConstants.CONFIG_RESET_AND_EXIT);
        sendNotification(GuiNotifications.SAVE_BARS_SETTINGS);
        sendNotification(GuiNotifications.MANAGE_MENUS_CONFIG_MODE, false, GuiConstants.CONFIG_RESET_AND_EXIT);
        this.view.closeWindow();
        facade.removeMediator(NAME);
    }

    private function closeWindowClickHandler(param1: Event = null): void {
        sendNotification(GuiNotifications.MANAGE_MENUS_CONFIG_MODE, false);
        this.view.closeWindow();
        facade.removeMediator(NAME);
    }

    protected function get menuProxy(): ItemsControlMenuProxy {
        return facade.retrieveProxy(ItemsControlMenuProxy.NAME) as ItemsControlMenuProxy;
    }

    protected function get view(): ConfigModePopup {
        return viewComponent as ConfigModePopup;
    }
}
}
