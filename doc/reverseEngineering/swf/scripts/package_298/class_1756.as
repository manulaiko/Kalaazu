package package_298 {

import com.bigpoint.utils.class_73;

import net.bigpoint.darkorbit.map.class_87;
import net.bigpoint.darkorbit.map.model.class_90;
import net.bigpoint.darkorbit.mvc.common.model.assets.UberAssetsLib;
import net.bigpoint.darkorbit.mvc.common.utils.ParserUtility;

import package_197.class_1743;
import package_197.class_2017;

import package_295.class_1752;

import package_373.class_2134;

public class class_1756 extends class_1752 implements class_1743 {


    private var var_1858: class_2134;

    private var _mapView: class_87;

    private var _map: class_90;

    private var var_5012: Vector.<class_2017>;

    public function class_1756(param1: class_87) {
        this.var_5012 = new Vector.<class_2017>();
        super();
        this._mapView = param1;
    }

    public function set map(param1: class_90): void {
        if (this._map) {
            this._map.const_1216.remove(this.reload);
        }
        this._map = param1;
        if (this._map) {
            this._map.const_1216.add(this.reload);
        }
        this.reload();
    }

    public function get method_818(): Vector.<class_2017> {
        return this.var_5012;
    }

    public function method_5468(param1: class_2017, param2: class_73): void {
        this._mapView.method_4683(param1.method_960.x, param1.method_960.y, param1.method_960.z, param2);
    }

    public function get method_3650(): Boolean {
        return this.var_1858 != null;
    }

    private function reload(): void {
        var _loc1_: * = null;
        var _loc2_: * = null;
        var _loc3_: * = null;
        if (this.var_1858) {
            this.var_1858.disposeView(true);
            this.var_1858 = null;
        }
        this.var_5012.length = 0;
        if (Boolean(this._map) && this._map.method_3763.display3D.length() > 0) {
            _loc1_ = UberAssetsLib.instance.getDescriptor(String(this._map.method_3763.display3D.@templateId), UberAssetsLib.LIB_MAPS);
            if (_loc1_) {
                this.var_1858 = new class_2134(_loc1_.display3D[0]);
                addChild(this.var_1858);
                _loc2_ = _loc1_.display3D[0].lensFlare;
                for each(_loc3_ in _loc2_) {
                    this.var_5012.push(new class_2017(int(_loc3_.attribute("id")), int(_loc3_.attribute("typeID")), new class_73(Number(_loc3_.attribute("x")), -Number(_loc3_.attribute("z")), -Number(_loc3_.attribute("y"))), ParserUtility.parseBooleanFromString(_loc3_.attribute("star")), String(_loc3_.attribute("blendMode"))));
                }
            }
        }
    }
}
}
