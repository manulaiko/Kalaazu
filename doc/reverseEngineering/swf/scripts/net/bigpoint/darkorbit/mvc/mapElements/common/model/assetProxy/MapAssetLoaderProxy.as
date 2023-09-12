package net.bigpoint.darkorbit.mvc.mapElements.common.model.assetProxy {

import flash.utils.Dictionary;

import org.puremvc.as3.multicore.patterns.observer.Notification;
import org.puremvc.as3.multicore.patterns.proxy.Proxy;

import package_11.class_38;

public class MapAssetLoaderProxy extends Proxy {

    public static const NAME: String = "MapAssetLoaderProxy";


    public function MapAssetLoaderProxy(param1: Object = null) {
        super(NAME, param1);
    }

    private function get callbackPairs(): Dictionary {
        return data as Dictionary;
    }

    public function onComplete(param1: class_38): void {
        var _loc3_: * = null;
        var _loc2_: Vector.<Notification> = this.callbackPairs[param1.name_58.id];
        for each(_loc3_ in _loc2_) {
            sendNotification(_loc3_.getName(), _loc3_.getBody(), _loc3_.getType());
        }
        delete this.callbackPairs[param1.name_58.id];
    }

    public function onError(): void {
    }

    public function setCallBackPair(param1: Notification, param2: String): void {
        if (!this.callbackPairs[param2]) {
            this.callbackPairs[param2] = new Vector.<Notification>();
        }
        (this.callbackPairs[param2] as Vector.<Notification>).push(param1);
    }
}
}
