package package_298 {

import flash.geom.Rectangle;

public class class_2647 {


    private var var_1852: XML;

    private var var_4950: Number;

    private var var_2343: Vector.<Rectangle>;

    public function class_2647(param1: XML) {
        this.var_2343 = new Vector.<Rectangle>();
        super();
        this.var_1852 = param1;
        this.method_1184();
    }

    private function method_1184(): void {
        var _loc1_: * = null;
        var _loc2_: Number = NaN;
        var _loc3_: Number = NaN;
        var _loc4_: Number = NaN;
        var _loc5_: Number = NaN;
        var _loc6_: * = null;
        this.var_4950 = this.var_1852.children().length();
        for each(_loc1_ in this.var_1852.SubTexture) {
            _loc2_ = parseFloat(_loc1_.attribute("x"));
            _loc3_ = parseFloat(_loc1_.attribute("y"));
            _loc4_ = parseFloat(_loc1_.attribute("width"));
            _loc5_ = parseFloat(_loc1_.attribute("height"));
            _loc6_ = new Rectangle(_loc2_, _loc3_, _loc4_, _loc5_);
            this.var_2343.push(_loc6_);
        }
    }

    public function get method_5567(): Number {
        return this.var_4950;
    }

    public function get method_885(): Vector.<Rectangle> {
        return this.var_2343;
    }
}
}
