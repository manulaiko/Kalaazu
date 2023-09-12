package package_176 {

import net.bigpoint.as3toolbox.filecollection.class_66;
import net.bigpoint.darkorbit.mvc.common.model.assets.AssetsProxy;
import net.bigpoint.darkorbit.mvc.gui.abstract.model.DOAbstractProxy;
import net.bigpoint.darkorbit.settings.Settings;

import package_17.class_62;

import package_24.class_75;

public class class_1847 extends DOAbstractProxy {

    public static const NAME: String = "TargetedOffersProxy";


    private var var_189: String;

    private var var_4843: Number;

    public function class_1847(param1: Number, param2: String, param3: Vector.<String>) {
        super(NAME, param3);
        this.var_4843 = param1;
        this.var_189 = param2;
    }

    public function get paymentLink(): String {
        return this.var_189;
    }

    public function get name_73(): Number {
        return this.var_4843;
    }

    private function method_441(param1: String): String {
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc8_: * = null;
        param1 = param1.substr(param1.lastIndexOf("_") + 1, param1.length);
        var _loc2_: class_66 = (class_62.getInstance().retrieveProxy(AssetsProxy.NAME) as AssetsProxy).getFileCollectionByInstanceName(AssetsProxy.ITEMS);
        var _loc3_: class_75 = _loc2_.method_1958[param1] as class_75;
        if (_loc3_) {
            _loc5_ = "null";
            _loc6_ = _loc3_.var_1542;
            _loc7_ = _loc3_.id;
            _loc8_ = _loc3_.location.path;
            _loc4_ = _loc5_ + "/do_img/global/" + _loc8_ + _loc7_ + ".flv?__cv=" + _loc6_;
        }
        return _loc4_;
    }

    public function method_4107(): Array {
        var _loc2_: * = null;
        var _loc1_: Array = new Array();
        for each(_loc2_ in data) {
            _loc1_.push(this.method_441(_loc2_));
        }
        return _loc1_;
    }
}
}
