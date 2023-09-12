package package_124 {

import com.bigpoint.utils.class_73;

import net.bigpoint.darkorbit.map.model.ship.class_86;

import org.puremvc.as3.multicore.interfaces.INotification;

import package_35.Effect;
import package_35.EffectManager;
import package_35.class_338;
import package_35.class_348;

import package_38.class_764;

import package_75.class_1856;
import package_75.class_370;

import package_84.class_243;

public class class_1464 extends class_243 {


    public function class_1464() {
        super();
    }

    override public function execute(param1: INotification): void {
        super.execute(param1);
        var _loc2_: int = 16777215;
        var _loc3_: class_764 = param1.getBody() as class_764;
        var _loc4_: class_86;
        if ((_loc4_ = map.method_327(_loc3_.var_4163) as class_86) == null) {
            return;
        }
        var _loc5_: EffectManager = name_47.map.effects;
        switch (_loc3_.type) {
            case class_764.DAMAGE:
                _loc2_ = 16711680;
                break;
            case class_764.SHIELD:
                _loc5_.method_5084(new class_370(_loc4_, Effect.const_925));
                _loc2_ = 3379148;
                break;
            case class_764.const_143:
                _loc5_.method_5084(new class_348(class_338.const_2376, _loc4_));
                _loc2_ = 65280;
        }
        _loc5_.method_5084(new class_1856(new class_73(_loc3_.x, _loc3_.y), Number(_loc3_.radius) * 2, _loc2_, false, 4, false));
    }
}
}
