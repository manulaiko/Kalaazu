package package_175 {

import net.bigpoint.darkorbit.gui.class_58;

import org.puremvc.as3.multicore.interfaces.IProxy;
import org.puremvc.as3.multicore.patterns.proxy.Proxy;

import package_174.class_1060;

import package_38.class_577;

public class StarmapBattleStationIconProxy extends Proxy implements IProxy {

    public static const NAME: String = "StarmapBattleStationIconProxy";


    private var var_43: Vector.<class_1060>;

    public function StarmapBattleStationIconProxy() {
        this.var_43 = new Vector.<class_1060>();
        super(NAME);
    }

    public function method_4784(param1: Vector.<class_577>, param2: Number): void {
        var _loc3_: * = null;
        var _loc4_: Number = NaN;
        this.var_43 = new Vector.<class_1060>();
        for each(_loc3_ in param1) {
            _loc4_ = param2 - Number(_loc3_.name_135);
            this.var_43.push(new class_1060(_loc3_.mapId, _loc3_.name_146, _loc3_.name_102, _loc3_.status, _loc3_.name_135, _loc4_, _loc3_.clanName, _loc3_.name_8, _loc3_.var_2646.faction));
        }
        class_58.instance.method_4214();
    }

    public function method_1794(param1: int): class_1060 {
        var _loc2_: int = int(this.var_43.length);
        var _loc3_: int = 0;
        while (_loc3_ != _loc2_) {
            if (this.var_43[_loc3_].mapId == param1) {
                return this.var_43[_loc3_];
            }
            _loc3_++;
        }
        return null;
    }
}
}
