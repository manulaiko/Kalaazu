package package_332 {

import flash.utils.Dictionary;
import flash.utils.setTimeout;

import net.bigpoint.darkorbit.class_126;
import net.bigpoint.darkorbit.mvc.gui.abstract.model.DOAbstractProxy;

import package_184.class_2283;

import package_38.class_437;
import package_38.class_444;
import package_38.class_549;

import package_401.EpicFightNotifications;

public class EpicFightMessageProxy extends DOAbstractProxy {

    public static const NAME: String = "EpicFightMessageProxy";


    private var var_646: Dictionary;

    private var var_1873: int = -1;

    public function EpicFightMessageProxy() {
        this.var_646 = new Dictionary();
        super(NAME, new Vector.<class_2283>());
        this.var_646[class_444.ID] = this.method_892;
        this.var_646[class_437.ID] = this.method_2144;
    }

    private function get model(): Vector.<class_2283> {
        return data as Vector.<class_2283>;
    }

    public function method_4900(param1: class_549): void {
        this.model.push(this.method_1748(param1));
        this.update();
    }

    private function update(): void {
        var _loc3_: int = 0;
        var _loc4_: int = 0;
        var _loc5_: int = 0;
        var _loc1_: Vector.<class_2283> = this.model;
        _loc1_.sort(class_2283.method_6348);
        var _loc2_: int = _loc1_.length;
        if (_loc1_.length > 0) {
            _loc3_ = -1;
            _loc4_ = int(_loc1_[0].method_2152);
            _loc5_ = 0;
            while (_loc5_ < _loc2_) {
                if (_loc1_[_loc5_].method_2152 < _loc4_) {
                    _loc3_ = _loc5_;
                    break;
                }
                _loc5_++;
            }
            if (_loc4_ > 0) {
                if (_loc3_ != -1) {
                    _loc1_.splice(_loc3_, _loc2_ - _loc3_);
                }
            } else {
                _loc1_.splice(0, _loc2_ - 1);
            }
            if (this.var_1873 == -1) {
                this.method_604();
            }
        }
    }

    private function method_604(): void {
        var _loc1_: * = null;
        if (this.model.length > 0) {
            _loc1_ = this.model.shift();
            this.var_1873 = setTimeout(this.method_604, _loc1_.duration);
            sendNotification(EpicFightNotifications.SHOW_MESSAGE, _loc1_);
        } else {
            this.var_1873 = -1;
        }
    }

    private function method_1748(param1: class_549): class_2283 {
        return this.var_646[param1.type.method_1330()](param1);
    }

    private function method_2144(param1: class_549): class_2283 {
        var _loc2_: class_437 = param1.type as class_437;
        var _loc3_: int = -1;
        if (_loc2_.type == class_437.const_1387) {
            _loc3_ = 0;
        }
        return new class_2283(class_126.instance.var_3943[_loc2_.type], param1.duration, class_2283.const_2666, _loc3_);
    }

    private function method_892(param1: class_549): class_2283 {
        var _loc2_: class_444 = param1.type as class_444;
        var _loc3_: int = _loc2_.type == class_444.const_2272 ? 0 : int(class_2283.const_2666);
        var _loc4_: int = -1;
        if (_loc2_.type == class_444.const_2272 && _loc2_.number <= 5 && _loc2_.number >= 1) {
            _loc4_ = 0;
        }
        var _loc5_: String = String(class_126.instance.var_51[_loc2_.type]).replace(/%NUMBER%/, _loc2_.number);
        return new class_2283(_loc5_, param1.duration, _loc3_, _loc4_);
    }
}
}
