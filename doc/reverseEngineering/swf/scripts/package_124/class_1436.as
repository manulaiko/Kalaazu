package package_124 {

import flash.utils.Dictionary;

import net.bigpoint.darkorbit.mvc.events.model.EventProxy;

import org.puremvc.as3.multicore.interfaces.INotification;

import package_133.class_1849;
import package_133.class_1850;
import package_133.class_1851;
import package_133.class_1852;
import package_133.class_1853;
import package_133.class_1854;
import package_133.class_1855;
import package_133.class_383;

import package_201.EventNotifications;

import package_38.class_381;
import package_38.class_606;
import package_38.class_625;
import package_38.class_656;
import package_38.class_941;

import package_84.class_243;

public class class_1436 extends class_243 {


    private const const_1292: Array = this.method_5871();

    public function class_1436() {
        super();
    }

    private function get eventProxy(): EventProxy {
        return facade.retrieveProxy(EventProxy.NAME) as EventProxy;
    }

    override public function execute(param1: INotification): void {
        var _loc2_: class_381 = param1.getBody() as class_381;
        if (this.const_1292[_loc2_.type] != null) {
            this.const_1292[_loc2_.type](_loc2_);
        }
    }

    private function method_5871(): Array {
        var _loc1_: * = [];
        _loc1_[class_381.CHRISTMAS_TREES] = this.method_173;
        _loc1_[class_381.FROSTED_GATES] = this.method_4603;
        _loc1_[class_381.const_509] = this.method_6064;
        _loc1_[class_381.const_3143] = this.method_4564;
        _loc1_[class_381.const_2582] = this.method_1649;
        _loc1_[class_381.const_2396] = this.method_2667;
        _loc1_[class_381.const_3035] = this.method_3192;
        _loc1_[class_381.const_2583] = this.method_5742;
        _loc1_[class_381.DEMOLISHED_HQ] = this.method_2894;
        _loc1_[class_381.const_1843] = this.method_2933;
        _loc1_[class_381.const_1247] = this.method_3614;
        return _loc1_;
    }

    private function method_2933(param1: class_381): void {
        var _loc2_: class_625 = this.getModule(param1.attributes, class_625.ID) as class_625;
        if (_loc2_) {
            if (Boolean(this.eventProxy.method_1341(param1.type)) && Boolean(param1.active)) {
                if ((this.eventProxy.method_1576(param1.type) as class_383).method_3098 == _loc2_.faction.faction) {
                    return;
                }
            }
            sendNotification(EventNotifications.ADD_EVENT, new class_383(param1.type, param1.active, _loc2_.faction.faction));
        }
    }

    private function method_2894(param1: class_381): void {
        if (this.eventProxy.method_1341(param1.type) != param1.active) {
            sendNotification(EventNotifications.ADD_EVENT, new class_1851(param1.type, param1.active));
        }
    }

    private function method_6064(param1: class_381): void {
        sendNotification(EventNotifications.ADD_EVENT, new class_1849(param1.type, param1.active));
    }

    private function method_4603(param1: class_381): void {
        sendNotification(EventNotifications.ADD_EVENT, new class_1854(param1.type, param1.active));
    }

    private function method_173(param1: class_381): void {
        sendNotification(EventNotifications.ADD_EVENT, new class_1850(param1.type, param1.active));
    }

    private function method_5742(param1: class_381): void {
        var _loc5_: * = null;
        var _loc6_: Boolean = false;
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc2_: Vector.<class_606> = this.method_2586(param1.attributes, class_941.ID);
        if (_loc2_.length == 0) {
            return;
        }
        var _loc3_: class_1855 = this.eventProxy.method_1576(param1.type) as class_1855;
        var _loc4_: Dictionary = !!_loc3_ ? _loc3_.method_5572 || new Dictionary() : new Dictionary();
        if (_loc3_ && _loc3_.isActive != param1.active || Boolean(param1.active) && !_loc3_) {
            _loc6_ = true;
        }
        for each(_loc5_ in _loc2_) {
            _loc7_ = class_1855.method_2378(_loc5_.replacement);
            if (_loc4_[_loc5_.mapId] != _loc7_) {
                _loc4_[_loc5_.mapId] = _loc7_;
                _loc6_ = true;
            }
        }
        if (_loc6_) {
            _loc8_ = new class_1855(param1.type, param1.active, _loc4_);
            sendNotification(EventNotifications.ADD_EVENT, _loc8_);
        }
    }

    private function method_3192(param1: class_381): void {
        var _loc3_: * = null;
        var _loc2_: class_625 = this.getModule(param1.attributes, class_625.ID) as class_625;
        if (_loc2_) {
            _loc3_ = class_1852.method_4007(_loc2_.faction);
            sendNotification(EventNotifications.ADD_EVENT, new class_1852(param1.type, param1.active, _loc3_));
        }
    }

    private function method_4564(param1: class_381): void {
        sendNotification(EventNotifications.ADD_EVENT, new class_1852(param1.type, param1.active, class_1852.const_1492));
    }

    private function method_2667(param1: class_381): void {
        var _loc2_: Vector.<String> = new Vector.<String>();
        var _loc3_: class_656 = this.getModule(param1.attributes, class_656.ID) as class_656;
        switch (_loc3_.value) {
            case 3:
                _loc2_.push("large");
            case 2:
                _loc2_.push("medium");
            case 1:
                _loc2_.push("small");
        }
        sendNotification(EventNotifications.ADD_EVENT, new class_1853(param1.type, param1.active, class_1853.const_2432, _loc2_));
    }

    private function method_3614(param1: class_381): void {
        sendNotification(EventNotifications.ADD_EVENT, new class_1852(param1.type, param1.active, class_1852.const_1687));
    }

    private function method_1649(param1: class_381): void {
        sendNotification(EventNotifications.ADD_EVENT, new class_1852(param1.type, param1.active, class_1852.const_2797));
    }

    private function getModule(param1: Vector.<class_606>, param2: int): class_606 {
        var _loc3_: int = param1.length;
        var _loc4_: int = 0;
        while (_loc4_ < _loc3_) {
            if (param1[_loc4_].method_1330() == param2) {
                return param1[_loc4_];
            }
            _loc4_++;
        }
        return null;
    }

    private function method_2586(param1: Vector.<class_606>, param2: int): Vector.<class_606> {
        var _loc3_: int = param1.length;
        var _loc4_: Vector.<class_606> = new Vector.<class_606>();
        var _loc5_: int = 0;
        while (_loc5_ < _loc3_) {
            if (param1[_loc5_].method_1330() == param2) {
                _loc4_.push(param1[_loc5_]);
            }
            _loc5_++;
        }
        return _loc4_;
    }
}
}
