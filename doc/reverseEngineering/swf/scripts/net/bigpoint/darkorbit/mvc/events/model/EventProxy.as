package net.bigpoint.darkorbit.mvc.events.model {

import flash.utils.Dictionary;

import org.puremvc.as3.multicore.patterns.proxy.Proxy;

import package_132.class_382;

import package_201.EventNotifications;

public class EventProxy extends Proxy {

    public static const NAME: String = "EventProxy";


    private var var_3460: Dictionary;

    public function EventProxy(param1: Object = null) {
        this.var_3460 = new Dictionary();
        super(EventProxy.NAME, param1);
    }

    private function get events(): Vector.<class_382> {
        return data as Vector.<class_382>;
    }

    public function method_1341(param1: int): Boolean {
        var _loc2_: class_382 = this.method_1576(param1);
        return !!_loc2_ ? Boolean(_loc2_.isActive) : false;
    }

    public function method_1576(param1: int): class_382 {
        var _loc2_: * = null;
        var _loc3_: * = null;
        for each(_loc3_ in this.events) {
            if (_loc3_.id == param1) {
                _loc2_ = _loc3_;
                break;
            }
        }
        return _loc2_;
    }

    public function method_3722(param1: class_382): void {
        if (this.method_1576(param1.id)) {
            this.method_4504(param1.id);
        }
        this.events.push(param1);
        sendNotification(EventNotifications.ACTIVATE_EVENT, param1);
        this.var_3460[param1.id] = param1.isActive;
    }

    public function method_4504(param1: int, param2: Boolean = true): void {
        var _loc3_: class_382 = this.method_1576(param1);
        if (_loc3_) {
            this.method_3407(_loc3_, param2);
        }
    }

    private function method_3407(param1: class_382, param2: Boolean): void {
        var _loc3_: int = this.events.indexOf(param1);
        if (_loc3_ != -1) {
            this.events.splice(_loc3_, 1);
        }
        if (param2) {
            this.var_3460[param1.id] = false;
        }
    }

    public function method_5193(): Vector.<class_382> {
        return this.events;
    }

    public function cleanup(): void {
    }
}
}
