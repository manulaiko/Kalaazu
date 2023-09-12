package package_124 {

import mx.collections.ArrayList;

import net.bigpoint.darkorbit.class_126;
import net.bigpoint.darkorbit.mvc.companyhierarchy.model.vo.class_1001;

import package_17.class_62;

import package_265.CompanyHierarchyProxy;

import package_37.class_170;

import package_38.class_500;
import package_38.class_631;

public class class_1230 extends class_170 {


    public function class_1230() {
        super();
    }

    public static function run(param1: class_631): void {
        var _loc4_: Boolean = false;
        var _loc5_: * = null;
        var _loc6_: int = 0;
        var _loc2_: Vector.<ArrayList> = new Vector.<ArrayList>();
        _loc2_.push(new ArrayList());
        _loc2_.push(new ArrayList());
        _loc2_.push(new ArrayList());
        _loc2_.push(new ArrayList());
        method_3908(param1.var_1998, "MMO", _loc2_);
        method_3908(param1.var_4976, "EIC", _loc2_);
        method_3908(param1.var_2220, "VRU", _loc2_);
        var _loc3_: int = int(param1.var_1014.rank);
        if (_loc3_ > 9) {
            _loc3_ = 0;
        }
        if (param1.var_1014.name_45 != -1) {
            if (_loc2_[param1.var_4243.faction].length <= 9) {
                _loc4_ = false;
                _loc6_ = 0;
                while (_loc6_ < _loc2_[param1.var_4243.faction].length) {
                    if ((_loc5_ = _loc2_[param1.var_4243.faction].getItemAt(_loc6_) as class_1001).name_45 == param1.var_1014.name_45) {
                        _loc4_ = true;
                    }
                    _loc6_++;
                }
                if (!_loc4_ && _loc3_ != 0) {
                    _loc2_[param1.var_4243.faction].addItemAt(new class_1001(param1.var_1014.rank, class_126.instance.method_2008[_loc3_], param1.var_1014.clanName, param1.var_1014.leaderName, param1.var_1014.var_4986, param1.var_1014.name_45, param1.var_1014.name_49), param1.var_1014.rank - 1);
                }
            }
            _loc2_[param1.var_4243.faction].addItem(new class_1001(param1.var_1014.rank, class_126.instance.method_2008[_loc3_], param1.var_1014.clanName, param1.var_1014.leaderName, param1.var_1014.var_4986, param1.var_1014.name_45, param1.var_1014.name_49));
        }
        (class_62.getInstance().retrieveProxy(CompanyHierarchyProxy.NAME) as CompanyHierarchyProxy).method_4480(_loc2_, param1.var_4243.faction);
    }

    private static function method_3908(param1: Vector.<class_500>, param2: String, param3: Vector.<ArrayList>): void {
        var _loc4_: * = null;
        var _loc5_: * = null;
        for each(_loc4_ in param1) {
            if ((_loc5_ = class_126.instance.method_2008[_loc4_.rank]) == null) {
                _loc5_ = class_126.instance.method_2008[0];
            }
            param3[class_126.instance.method_2919.indexOf(param2)].addItem(new class_1001(_loc4_.rank, _loc5_, _loc4_.clanName, _loc4_.leaderName, _loc4_.var_4986, _loc4_.name_45, _loc4_.name_49));
        }
    }
}
}
