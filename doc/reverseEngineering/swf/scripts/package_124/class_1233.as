package package_124 {

import com.greensock.TweenMax;

import net.bigpoint.darkorbit.managers.keyboardManager.KeyboardMapper;

import package_192.class_1784;

import package_37.ICommand;
import package_37.class_170;

import package_38.class_510;

public class class_1233 extends class_170 {


    public function class_1233() {
        super();
    }

    public static function run(param1: ICommand): void {
        var _loc2_: class_510 = param1 as class_510;
        if (Boolean(var_574) && false) {
            KeyboardMapper.getInstance().cleanup();
            KeyboardMapper.getInstance().method_1900(new class_1784(_loc2_));
        } else {
            TweenMax.delayedCall(0.5, run, [param1]);
        }
    }
}
}
