package package_333 {

import flash.events.Event;

import net.bigpoint.darkorbit.mvc.common.AssetNotifications;
import net.bigpoint.darkorbit.mvc.common.ConnectionNotifications;
import net.bigpoint.darkorbit.mvc.common.model.assets.AssetsProxy;
import net.bigpoint.darkorbit.mvc.common.view.ScreenNotifications;
import net.bigpoint.darkorbit.net.class_59;

import org.puremvc.as3.multicore.interfaces.INotification;

import package_176.class_1071;
import package_176.class_1847;

import package_22.class_198;

import package_239.class_2284;

import package_31.class_92;

import package_334.class_1845;

import package_38.class_657;

public class TargetedOfferWindowMediator extends class_92 {

    public static const NAME: String = "TargetedOfferWindowMediator";


    public function TargetedOfferWindowMediator(param1: class_1846) {
        super(NAME, param1);
        method_2176(ScreenNotifications.SCREEN_VIEWPORT_RESIZED, this.method_3014);
    }

    override public function onRegister(): void {
        this.window.addEventListener(class_2284.const_1966, this.method_3248);
        this.method_496.addEventListener(class_2284.const_1407, this.method_817);
        this.method_496.addEventListener(class_2284.const_1126, this.method_4536);
        this.method_496.addEventListener(class_2284.const_1942, this.loadBackgroundImage);
        this.method_496.method_1528(this.proxy.method_4107());
    }

    private function method_4536(param1: class_2284): void {
        this.window.show();
    }

    private function loadBackgroundImage(param1: class_2284): void {
        var _loc2_: class_1071 = class_198.var_3938[this.method_496.method_5364] as class_1071 || class_198.var_3938["default"] as class_1071;
        var _loc3_: String = _loc2_.gfxKey;
        facade.sendNotification(AssetNotifications.LOAD_ASSET, [_loc3_, this.method_496.method_3983, null, AssetsProxy.GAME]);
    }

    private function method_817(param1: class_2284): void {
        class_59.call(class_59.const_1192, [this.proxy.paymentLink]);
        var _loc2_: class_657 = new class_657(this.proxy.name_73, true);
        this.sendRequest(_loc2_);
        this.remove();
    }

    public function method_3014(param1: INotification = null): void {
        this.window.method_4575();
        this.window.x = this.window.name_141;
        this.window.y = this.window.name_18;
    }

    private function method_3248(param1: Event): void {
        var _loc2_: class_657 = new class_657(this.proxy.name_73, false);
        this.sendRequest(_loc2_);
        this.remove();
    }

    private function sendRequest(param1: class_657): void {
        sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST, param1);
    }

    private function remove(): void {
        this.removeEventListeners();
        this.method_496.cleanup();
        this.window.cleanup(true);
        sendNotification(class_1845.CLEANUP);
        onRemove();
    }

    private function removeEventListeners(): void {
        this.window.removeEventListener(class_2284.const_1966, this.method_3248);
        this.method_496.removeEventListener(class_2284.const_1407, this.method_817);
        this.method_496.removeEventListener(class_2284.const_1126, this.method_4536);
        this.method_496.removeEventListener(class_2284.const_1942, this.loadBackgroundImage);
    }

    private function get window(): class_1846 {
        return viewComponent as class_1846;
    }

    private function get method_496(): class_1843 {
        return this.window.method_496 as class_1843;
    }

    protected function get proxy(): class_1847 {
        return retrieveProxy(class_1847.NAME) as class_1847;
    }
}
}
