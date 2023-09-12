package package_208 {

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.class_126;

import package_38.class_836;

import package_72.class_190;

public class class_1389 extends class_1231 {


    public function class_1389() {
        super();
    }

    public static function run(param1: class_836): void {
        var _loc4_: * = null;
        var _loc7_: int = 0;
        var _loc8_: * = null;
        var _loc9_: * = null;
        var _loc10_: int = 0;
        var _loc11_: * = null;
        var _loc2_: int = int(param1.var_2168);
        var _loc3_: int = int(param1.var_4444);
        _loc4_ = class_1231.method_4924(_loc2_);
        var _loc5_: int = int(param1.var_4863);
        var _loc6_: Vector.<int> = param1.var_4237;
        if (_loc4_ != null) {
            switch (_loc5_) {
                case class_836.const_87:
                    class_1231.method_2887(_loc3_);
                    _loc4_.var_99 = _loc3_;
                    _loc4_.targetList = _loc6_;
                    _loc7_ = int(_loc4_.targetList.length);
                    _loc8_ = class_126.instance.method_1789;
                    _loc9_ = "";
                    _loc10_ = 0;
                    while (_loc10_ < _loc7_) {
                        if ((_loc11_ = _loc8_[_loc4_.targetList[_loc10_]]) != null) {
                            _loc9_ += ", " + _loc11_;
                        }
                        _loc10_++;
                    }
                    _loc9_ = _loc9_.substring(2);
                    if (_loc4_.targetList.length > 1) {
                        _loc4_.name_94 = class_88.getItem("q2_condition_KILL_NPC").replace(/%npc%/, _loc9_);
                        break;
                    }
                    _loc4_.name_94 = class_88.getItem("q2_condition_KILL_NPCS").replace(/%npcs%/, _loc9_);
                    break;
                case class_836.PVP:
            }
        }
        class_1231.method_4720(_loc2_);
    }
}
}
