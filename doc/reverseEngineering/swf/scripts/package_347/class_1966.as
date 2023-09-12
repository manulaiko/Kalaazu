package package_347 {

import com.bigpoint.utils.class_73;
import com.greensock.TweenMax;

import net.bigpoint.darkorbit.map.model.class_90;
import net.bigpoint.darkorbit.mvc.common.model.assets.UberAssetsLib;

import org.puremvc.as3.multicore.interfaces.INotification;

import package_133.class_1850;

import package_29.class_85;

import package_84.class_243;

import package_9.class_50;

import package_99.class_266;

public class class_1966 extends class_243 {


    public function class_1966() {
        super();
    }

    override public function execute(param1: INotification): void {
        super.execute(param1);
        var _loc2_: class_1850 = param1.getBody() as class_1850;
        if (_loc2_.isActive) {
            this.activate();
        } else {
            this.deactivate();
        }
    }

    private function activate(param1: int = 0): void {
        var _loc7_: * = null;
        var _loc9_: * = null;
        var _loc2_: class_90 = class_50.getInstance().map;
        if (_loc2_ == null) {
            if (param1 < 4) {
                TweenMax.delayedCall(5, this.activate, [param1 + 1]);
            }
            return;
        }
        var _loc3_: int = int(_loc2_.method_1480());
        var _loc4_: int = Number(_loc2_.method_5076) * 0.9;
        var _loc5_: int = Number(_loc2_.method_1901) * 0.9;
        var _loc8_: int = 0;
        while (_loc8_ < 5) {
            _loc7_ = new class_73(Number(class_266.method_2266(_loc3_ * (_loc8_ + _loc3_) * _loc5_)) * _loc4_, Number(class_266.method_2266(_loc3_ * (_loc8_ + _loc3_) * _loc4_)) * _loc5_);
            _loc9_ = new class_85(class_90.method_5486, _loc7_);
            UberAssetsLib.instance.fillTraits(_loc9_, "christmasTreeAsteroid", UberAssetsLib.LIB_DEFAULT);
            name_47.map.method_4903(_loc9_);
            _loc8_++;
        }
    }

    private function deactivate(): void {
    }
}
}
