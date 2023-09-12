package package_267 {

import com.bigpoint.utils.class_73;

import flash.events.TimerEvent;
import flash.utils.Dictionary;
import flash.utils.Timer;

import net.bigpoint.darkorbit.class_126;
import net.bigpoint.darkorbit.class_81;
import net.bigpoint.darkorbit.mvc.sectorControlWindow.SectorControlWindowNotifications;

import org.puremvc.as3.multicore.interfaces.IProxy;
import org.puremvc.as3.multicore.patterns.proxy.Proxy;

import package_135.class_391;

import package_14.class_52;

import package_158.class_1008;
import package_158.class_1939;
import package_158.class_1940;

import package_210.class_1938;

import package_27.class_82;

import package_313.class_1786;
import package_313.class_1941;

import package_38.class_469;
import package_38.class_479;
import package_38.class_691;
import package_38.class_694;
import package_38.class_932;
import package_38.class_946;

import package_9.class_50;

public class SectorControlProxy extends Proxy implements IProxy, class_52 {

    public static const NAME: String = "SectorControlProxy";


    private var var_4587: class_1940;

    private var var_4618: class_1008;

    private var var_3767: class_1786;

    private var var_1487: Vector.<class_1008>;

    private var var_1866: uint;

    private var var_1022: uint;

    private var var_1441: int = -1;

    private var var_442: int = -1;

    private var var_991: Boolean;

    private var var_3970: Number = 0;

    private var var_1865: Number = 0;

    private var var_3971: int;

    private var var_3924: uint;

    private var var_4463: uint;

    private var _timer: Timer;

    public function SectorControlProxy() {
        this.var_1487 = new Vector.<class_1008>();
        super(NAME, new class_1941());
        this.var_3767 = new class_1786();
        class_50.method_5621(this);
    }

    override public function onRemove(): void {
        super.onRemove();
        facade.removeCommand(SectorControlWindowNotifications.SELECTION_REMOVE);
    }

    override public function onRegister(): void {
        super.onRegister();
        facade.registerCommand(SectorControlWindowNotifications.SELECTION_REMOVE, class_1938);
    }

    public function reset(): void {
        data = new class_1941();
    }

    private function getVO(): class_1941 {
        return data as class_1941;
    }

    public function method_664(param1: String, param2: int): void {
        this.getVO().var_1997[param1] = param2;
    }

    public function method_3110(param1: String): int {
        if (this.getVO().var_1997[param1] != null && this.getVO().var_1997[param1] != undefined) {
            return this.getVO().var_1997[param1];
        }
        return int.MIN_VALUE;
    }

    public function method_202(param1: String): void {
        delete this.getVO().var_1997[param1];
    }

    public function method_5895(): void {
        this.getVO().var_1997 = new Dictionary();
    }

    public function get method_2009(): class_1940 {
        return this.var_4587;
    }

    public function set method_2009(param1: class_1940): void {
        this.var_4587 = param1;
    }

    public function updateMatchOverview(param1: class_469): void {
        var _loc4_: * = null;
        var _loc5_: * = null;
        this.var_1866 = param1.minLevel;
        this.var_1022 = param1.name_119;
        this.var_3971 = param1.var_3044;
        this.var_442 = param1.var_1413;
        var _loc2_: Vector.<class_694> = param1.var_2830;
        var _loc3_: uint = _loc2_.length;
        this.var_1487.length = 0;
        var _loc6_: int = 0;
        while (_loc6_ < _loc3_) {
            _loc5_ = _loc2_[_loc6_];
            (_loc4_ = new class_1008()).matchID = _loc5_.name_93;
            _loc4_.var_3699 = _loc5_.var_3699;
            _loc4_.var_2994 = _loc5_.var_2994;
            _loc4_.totalTickets = _loc5_.totalTickets;
            _loc4_.var_572 = this.method_343(_loc5_);
            _loc4_.var_726 = _loc5_.var_726;
            _loc4_.var_5021 = _loc5_.var_2025;
            _loc4_.var_3044 = param1.var_3044;
            this.var_1487.push(_loc4_);
            _loc6_++;
        }
        facade.sendNotification(SectorControlWindowNotifications.const_2672, this.var_1487);
        facade.sendNotification(SectorControlWindowNotifications.const_2907, [param1.minLevel, param1.name_119]);
        facade.sendNotification(SectorControlWindowNotifications.UPDATE_MIN_PLAYERS_PER_TEAM, this.var_3971);
    }

    private function method_343(param1: class_694): uint {
        var _loc2_: * = 0;
        if (param1.name_93 == this.var_442) {
            _loc2_ = 0;
        } else {
            _loc2_ = uint(param1.var_572);
        }
        return _loc2_;
    }

    public function method_4632(param1: class_691): void {
        var _loc3_: * = null;
        var _loc4_: Boolean = false;
        facade.sendNotification(SectorControlWindowNotifications.const_2018, param1);
        var _loc2_: class_1008 = this.method_3841(param1.name_93);
        if (_loc2_) {
            _loc3_ = new class_1939();
            _loc3_.var_4325 = _loc2_.var_3699 >= _loc2_.var_3044;
            _loc4_ = !!this.var_4618 ? this.var_4618.matchID == param1.name_93 : false;
            _loc3_.var_4218 = _loc4_;
            sendNotification(SectorControlWindowNotifications.UPDATE_MESSAGE_LABLE, _loc3_);
            if (param1.name_93 != this.var_1441) {
                this.var_1441 = param1.name_93;
                this.method_2937(param1.var_1823);
            }
        }
    }

    private function method_3841(param1: int): class_1008 {
        var _loc2_: int = int(this.var_1487.length);
        var _loc3_: int = 0;
        while (_loc3_ < _loc2_) {
            if (param1 == this.var_1487[_loc3_].matchID) {
                return this.var_1487[_loc3_];
            }
            _loc3_++;
        }
        return null;
    }

    public function method_3566(param1: Vector.<class_479>): void {
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc2_: Boolean = false;
        for each(_loc3_ in param1) {
            if ((_loc4_ = this.getVO().var_2316[_loc3_.faction.faction]) == null || _loc4_.x != _loc3_.var_2004 || _loc4_.y != _loc3_.var_3339) {
                _loc2_ = true;
            }
            this.getVO().var_2316[_loc3_.faction.faction] = new class_73(_loc3_.var_2004, _loc3_.var_3339);
        }
        facade.sendNotification(class_391.const_228, this.getVO().var_2316);
    }

    public function method_88(param1: Vector.<class_946>): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        for each(_loc2_ in param1) {
            _loc3_ = this.getVO().var_1578[_loc2_.faction.faction];
            if (_loc3_ != null && Number(_loc3_.x) - Number(_loc2_.var_4992) > 1) {
                facade.sendNotification(class_391.const_3181, new class_73(_loc2_.faction.faction, Number(_loc3_.x) - Number(_loc2_.var_4992)));
            }
            this.getVO().var_1578[_loc2_.faction.faction] = new class_73(_loc2_.var_4992, _loc2_.var_5007);
        }
        facade.sendNotification(class_391.const_595, this.getVO().var_1578);
    }

    public function method_2912(param1: Vector.<class_932>): void {
        var _loc2_: * = null;
        var _loc3_: Number = NaN;
        for each(_loc2_ in param1) {
            if (this.getVO().var_1093[_loc2_.faction.faction] == null) {
                this.getVO().var_1093[_loc2_.faction.faction] = new Dictionary();
            }
            _loc3_ = Math.round(Number(_loc2_.var_4240) * 100);
            this.getVO().var_1093[_loc2_.faction.faction][_loc2_.var_4258.var_2008] = _loc3_;
        }
        facade.sendNotification(class_391.const_683, this.getVO().var_1093);
    }

    public function method_2853(param1: String): void {
        if (this.var_3767.var_4941 != param1) {
            this.var_3767 = new class_1786(param1);
            facade.sendNotification(class_391.const_2951, this.var_3767);
        }
    }

    public function method_3062(param1: class_1786): void {
        if (param1.var_4941 == null || this.var_3767.var_4941 != param1.var_4941) {
            return;
        }
        this.var_3767 = param1;
        facade.sendNotification(class_391.const_2951, this.var_3767);
    }

    private function method_2937(param1: int): void {
        this.method_1026();
        if (param1 >= 0) {
            this.method_4409(param1);
            this.startTimer();
            this.method_2059();
        }
    }

    public function startTimer(): void {
        if (this._timer) {
            this._timer.start();
        }
    }

    public function method_1026(): void {
        if (this._timer) {
            this._timer.stop();
        }
        facade.sendNotification(SectorControlWindowNotifications.const_986);
    }

    public function method_864(): void {
        this.method_1026();
        this.var_3924 = this.var_4463;
        this.startTimer();
    }

    public function method_849(): void {
        this.method_1026();
        this.method_1028();
    }

    public function method_4409(param1: uint): void {
        this.var_4463 = param1;
        this.var_3924 = param1;
        if (this._timer == null) {
            this._timer = new Timer(1000);
            this._timer.addEventListener(TimerEvent.TIMER, this.method_2059);
        }
    }

    protected function method_1028(): void {
        if (this._timer) {
            this._timer.removeEventListener(TimerEvent.TIMER, this.method_2059);
            this._timer = null;
        }
    }

    protected function method_2059(param1: TimerEvent = null): void {
        ++this.var_3924;
        facade.sendNotification(SectorControlWindowNotifications.const_2257, this.method_4937);
    }

    public function get method_4937(): String {
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc6_: * = null;
        var _loc1_: String = "";
        var _loc2_: uint = Number(this.var_3924) % 60;
        if (_loc2_ < 10) {
            _loc3_ = "0" + _loc2_.toString();
        } else {
            _loc3_ = _loc2_.toString();
        }
        var _loc5_: uint;
        if ((_loc5_ = Math.floor(Number(this.var_3924) / 60)) < 10) {
            _loc4_ = "0" + _loc5_.toString();
        } else {
            _loc4_ = _loc5_.toString();
        }
        var _loc7_: uint;
        if ((_loc7_ = Math.floor(Number(this.var_3924) / 3600)) > 24) {
            _loc7_ %= 24;
        }
        if (_loc7_ < 10) {
            _loc6_ = "0" + _loc7_.toString();
        } else {
            _loc6_ = _loc7_.toString();
        }
        return _loc6_ + ":" + _loc4_ + ":" + _loc3_;
    }

    public function updateTimer(param1: Number): void {
        this.var_3970 += param1;
        this.var_1865 += param1;
        if (this.var_3970 > 5000) {
            this.var_3970 -= 5000;
            if (this.getVO().var_1578[class_81.factionID] != null && Number(this.getVO().var_1578[class_81.factionID].x) / Number(this.getVO().var_1578[class_81.factionID].y) < 0.05) {
                class_82.playSoundEffect(class_126.const_1749);
            }
        }
        if (this.var_1865 > 3000) {
            this.var_1865 -= 3000;
            facade.sendNotification(class_391.const_2383);
        }
    }

    public function get name_119(): uint {
        return this.var_1022;
    }

    public function get minLevel(): uint {
        return this.var_1866;
    }

    public function get method_2588(): Boolean {
        return this.var_991;
    }

    public function set method_2588(param1: Boolean): void {
        this.var_991 = param1;
    }

    public function get method_3856(): int {
        return this.var_442;
    }

    public function set method_5402(param1: class_1008): void {
        this.var_4618 = param1;
    }
}
}
