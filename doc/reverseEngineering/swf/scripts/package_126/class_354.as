package package_126 {

import net.bigpoint.darkorbit.map.model.class_90;
import net.bigpoint.darkorbit.map.model.traits.class_306;
import net.bigpoint.darkorbit.mvc.common.model.assets.UberAssetsLib;

import package_10.class_305;

import package_22.class_198;
import package_22.class_222;

import package_29.class_85;

import package_36.class_184;
import package_36.class_207;
import package_36.class_399;

import package_9.class_50;

public class class_354 extends class_85 {

    public static const const_3066: int = 2;


    public var typeID: int;

    public var hash: String;

    public var var_310: int;

    public var explodeType: int;

    public var var_536: int;

    public function class_354(param1: int, param2: int, param3: int, param4: String, param5: int = 0, param6: int = 0) {
        super(class_90.method_3817(param4), new class_305(param1, param2));
        this.typeID = param3;
        this.hash = param4;
        this.var_310 = param5;
        this.var_536 = param6;
        UberAssetsLib.instance.fillTraits(this, "mine_" + param3, UberAssetsLib.LIB_DEFAULT);
        var _loc7_: class_306;
        if (_loc7_ = method_1954(class_306) as class_306) {
            this.explodeType = int(_loc7_.descriptor.display2D.@explodeType);
            _loc7_.decorators.push({"id": "mine"});
        }
    }

    public function bang(): void {
        var _loc2_: * = null;
        var _loc1_: class_90 = class_50.getInstance().map;
        if (this.typeID == class_354.const_3066) {
            _loc1_.effects.method_5565(new class_399(this, false));
        } else {
            _loc2_ = class_198.method_1020(class_222.const_1974, this.explodeType);
            _loc1_.effects.method_269(new class_184(x, y, z, _loc2_));
            if (this.var_536 > 0) {
                _loc1_.effects.method_269(new class_207(0, x, y, true));
            }
        }
    }
}
}
