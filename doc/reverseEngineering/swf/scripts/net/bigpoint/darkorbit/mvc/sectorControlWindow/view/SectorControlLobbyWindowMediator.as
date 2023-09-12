package net.bigpoint.darkorbit.mvc.sectorControlWindow.view {

import flash.events.Event;

import net.bigpoint.darkorbit.class_81;
import net.bigpoint.darkorbit.mvc.common.ConnectionNotifications;
import net.bigpoint.darkorbit.mvc.common.view.components.DOWindow;
import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;
import net.bigpoint.darkorbit.mvc.sectorControlWindow.SectorControlWindowNotifications;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.mediator.Mediator;

import package_158.class_1008;
import package_158.class_1939;

import package_159.SectorControlLobbyWindowEvent;

import package_210.class_2676;

import package_267.SectorControlProxy;

import package_38.class_501;
import package_38.class_691;
import package_38.class_797;
import package_38.class_917;
import package_38.class_938;

import package_98.MapNotification;

public class SectorControlLobbyWindowMediator extends Mediator {

    public static const NAME: String = "SectorControlLobbyWindowMediator";


    public function SectorControlLobbyWindowMediator(param1: class_156 = null) {
        super(NAME, param1);
    }

    override public function setViewComponent(param1: Object): void {
        this.removeEventListener();
        super.setViewComponent(param1);
        this.addEventListeners();
    }

    override public function onRegister(): void {
        facade.registerCommand(SectorControlWindowNotifications.SELECTION_CHANGED, class_2676);
        this.addEventListeners();
    }

    override public function onRemove(): void {
        this.removeEventListener();
        sendNotification(SectorControlWindowNotifications.SELECTION_REMOVE);
        facade.removeCommand(SectorControlWindowNotifications.SELECTION_CHANGED);
    }

    override public function listNotificationInterests(): Array {
        return [SectorControlWindowNotifications.const_2672, SectorControlWindowNotifications.const_2907, SectorControlWindowNotifications.const_2018, SectorControlWindowNotifications.const_2257, SectorControlWindowNotifications.const_986, MapNotification.CLEANUP, SectorControlWindowNotifications.UPDATE_MIN_PLAYERS_PER_TEAM, SectorControlWindowNotifications.SET_UI_INTERACTIVITY, SectorControlWindowNotifications.SET_JOIN_LEAVE_BUTTON_STATE, SectorControlWindowNotifications.UPDATE_MESSAGE_LABLE];
    }

    override public function handleNotification(param1: INotification): void {
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: * = 0;
        var _loc6_: * = 0;
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc9_: * = null;
        var _loc10_: * = null;
        super.handleNotification(param1);
        var _loc2_: String = param1.getName();
        switch (_loc2_) {
            case SectorControlWindowNotifications.const_2672:
                _loc3_ = param1.getBody() as Vector.<class_1008>;
                this.updateItemList(_loc3_);
                break;
            case SectorControlWindowNotifications.const_2907:
                _loc5_ = uint((_loc4_ = param1.getBody() as Array)[0]);
                _loc6_ = uint(_loc4_[1]);
                this.updateLevelRange(_loc5_, _loc6_);
                break;
            case SectorControlWindowNotifications.const_2018:
                _loc7_ = param1.getBody() as class_691;
                this.method_2027(_loc7_);
                break;
            case SectorControlWindowNotifications.const_2257:
                _loc8_ = param1.getBody() as String;
                this.updateMatchTime(_loc8_);
                break;
            case SectorControlWindowNotifications.const_986:
                this.clearMatchTime();
                break;
            case MapNotification.CLEANUP:
                _loc9_ = this.window as DOWindow;
                sendNotification(GuiNotifications.CLOSE_WINDOW_BY_TYPE, _loc9_.windowType);
                break;
            case SectorControlWindowNotifications.UPDATE_MIN_PLAYERS_PER_TEAM:
                this.window.method_1715(param1.getBody() as int);
                break;
            case SectorControlWindowNotifications.SET_UI_INTERACTIVITY:
                this.window.method_1304(param1.getBody() as Boolean);
                break;
            case SectorControlWindowNotifications.SET_JOIN_LEAVE_BUTTON_STATE:
                this.window.method_968(param1.getBody() as String);
                break;
            case SectorControlWindowNotifications.UPDATE_MESSAGE_LABLE:
                _loc10_ = param1.getBody() as class_1939;
                this.window.method_3255(_loc10_.var_4218, _loc10_.var_4325);
        }
    }

    private function addEventListeners(): void {
        this.window.addEventListener(Event.CLOSE, this.method_2555);
        this.window.addEventListener(SectorControlLobbyWindowEvent.const_1519, this.method_1612);
        this.window.addEventListener(SectorControlLobbyWindowEvent.const_199, this.method_4100);
        this.window.addEventListener(SectorControlLobbyWindowEvent.const_3272, this.method_1217);
    }

    private function removeEventListener(): void {
        this.window.removeEventListener(Event.CLOSE, this.method_2555);
        this.window.removeEventListener(SectorControlLobbyWindowEvent.const_1519, this.method_1612);
        this.window.removeEventListener(SectorControlLobbyWindowEvent.const_199, this.method_4100);
        this.window.removeEventListener(SectorControlLobbyWindowEvent.const_3272, this.method_1217);
    }

    private function method_1612(param1: SectorControlLobbyWindowEvent): void {
        sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST, new class_501());
    }

    private function method_4100(param1: SectorControlLobbyWindowEvent): void {
        switch (param1.action) {
            case SectorControlLobbyWindowEvent.const_1355:
                this.joinMatch(param1);
                break;
            case SectorControlLobbyWindowEvent.const_500:
                this.method_5339(param1);
                break;
            case SectorControlLobbyWindowEvent.const_3079:
                this.method_6385(param1);
        }
    }

    private function method_1217(param1: SectorControlLobbyWindowEvent): void {
        var _loc2_: class_1008 = param1.method_4561;
        sendNotification(SectorControlWindowNotifications.SELECTION_CHANGED, _loc2_);
        sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST, new class_917(_loc2_.matchID));
    }

    private function method_2555(param1: Event): void {
        this.method_5933.method_849();
        facade.removeMediator(this.getMediatorName());
    }

    private function joinMatch(param1: SectorControlLobbyWindowEvent): void {
        var _loc2_: int = int(param1.matchID);
        if (_loc2_ > 0) {
            sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST, new class_938(_loc2_));
        }
    }

    private function method_5339(param1: SectorControlLobbyWindowEvent): void {
        sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST, new class_797());
    }

    private function method_6385(param1: SectorControlLobbyWindowEvent): void {
        sendNotification(SectorControlWindowNotifications.const_561, param1.matchID);
    }

    private function method_2027(param1: class_691): void {
        this.window.method_2027(param1);
    }

    private function updateItemList(param1: Vector.<class_1008>): void {
        this.window.method_5849(param1);
    }

    private function updateLevelRange(param1: uint, param2: uint): void {
        this.window.method_1124(class_81.level, param1, param2);
    }

    private function updateMatchTime(param1: String): void {
        this.window.updateMatchTime(param1);
    }

    private function clearMatchTime(): void {
        this.window.clearMatchTime();
    }

    private function get method_5933(): SectorControlProxy {
        return this.facade.retrieveProxy(SectorControlProxy.NAME) as SectorControlProxy;
    }

    protected function get window(): class_156 {
        return viewComponent as class_156;
    }
}
}
