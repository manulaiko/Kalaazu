package package_479 {

import away3d.arcane;

import flash.net.URLRequest;

import package_293.class_1751;
import package_293.class_2131;

import package_294.class_2429;

import package_368.class_2416;

import package_466.class_2598;

public class ExternalShapeSubParser extends class_2692 {


    private var name_69: class_2429;

    public function ExternalShapeSubParser() {
        super();
    }

    public static function get identifier(): * {
        return class_2598.ExternalShapeSubParser;
    }

    override public function method_3173(): class_2429 {
        return this.name_69;
    }

    override arcane function method_3765(param1: class_2416): void {
        var _loc4_: int = 0;
        var _loc5_: * = null;
        var _loc2_: Vector.<class_1751> = param1.assets;
        var _loc3_: int = _loc2_.length;
        while (_loc4_ < _loc3_) {
            if ((_loc5_ = _loc2_[_loc4_]).assetType == class_2131.GEOMETRY) {
                this.name_69 = _loc5_ as class_2429;
                return;
            }
            _loc4_++;
        }
        method_444("resolveDependencyFailure");
    }

    override arcane function resolveDependencyFailure(param1: class_2416): void {
        method_444("resolveDependencyFailure");
    }

    override protected function method_196(): Boolean {
        if (var_117) {
            if (true) {
                method_444("no external geometry url");
                return const_2971;
            }
            method_597("default", new URLRequest(_data.url));
        }
        return super.method_196();
    }
}
}
