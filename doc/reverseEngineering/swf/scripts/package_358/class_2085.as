package package_358 {

import flash.display.BitmapData;
import flash.display.GraphicsPathCommand;
import flash.geom.Matrix;

import package_120.class_2010;
import package_120.class_431;

import package_194.class_1198;
import package_194.class_1697;

public class class_2085 extends class_2080 {

    private static const const_674: int = 40;

    private static const const_3300: Vector.<int> = new <int>[GraphicsPathCommand.MOVE_TO, GraphicsPathCommand.LINE_TO, GraphicsPathCommand.LINE_TO, GraphicsPathCommand.LINE_TO, GraphicsPathCommand.LINE_TO, GraphicsPathCommand.LINE_TO, GraphicsPathCommand.LINE_TO, GraphicsPathCommand.LINE_TO, GraphicsPathCommand.LINE_TO];


    public function class_2085(param1: class_1697) {
        super(param1.owner as class_431);
    }

    override protected function method_224(param1: uint, param2: BitmapData, param3: Boolean): void {
        var _loc4_: Number = NaN;
        var _loc5_: Number = NaN;
        var _loc6_: * = null;
        var _loc7_: * = 0;
        var _loc8_: Number = NaN;
        graphics.clear();
        if (param1 == class_2010.const_1607) {
            _loc4_ = 1;
            _loc5_ = 1;
            if (!param3) {
                _loc4_ = Number(this.method_6043.width) / param2.width;
                _loc5_ = Number(this.method_6043.height) / param2.height;
            }
            (_loc6_ = new Matrix()).scale(_loc4_, _loc5_);
            graphics.beginBitmapFill(param2, _loc6_, param3);
        } else {
            graphics.lineStyle(class_2010.method_3772(method_1818), class_2010.method_4696(method_1818));
            _loc7_ = uint(class_2010.method_1388(method_1818));
            _loc8_ = Number(class_2010.method_5228(method_1818));
            graphics.beginFill(_loc7_, _loc8_);
        }
        if (false) {
            this.method_3103();
        } else {
            this.method_2749();
        }
        graphics.endFill();
    }

    private function method_3103(): void {
        var _loc1_: int = int(method_1818.method_4219.value);
        var _loc2_: int = Number(method_1818.position.x) - _loc1_;
        var _loc3_: int = Number(method_1818.position.y) - _loc1_;
        var _loc4_: int = method_1818.position.x + this.method_6043.width + _loc1_;
        var _loc5_: int = method_1818.position.y + this.method_6043.height + _loc1_;
        var _loc6_: Vector.<Number> = new <Number>[_loc2_, _loc3_, _loc4_, _loc3_, _loc4_, _loc5_, _loc2_, _loc5_, _loc2_, _loc3_];
        var _loc7_: int = int(method_1818.position.x);
        var _loc8_: int = int(method_1818.position.y);
        var _loc9_: int = method_1818.position.x + this.method_6043.width;
        var _loc10_: int = method_1818.position.y + this.method_6043.height;
        var _loc11_: Vector.<Number> = new <Number>[_loc7_ + const_674, _loc8_, _loc9_ - Number(const_674), _loc8_, _loc9_, _loc8_ + const_674, _loc9_, _loc10_ - Number(const_674), _loc9_ - Number(const_674), _loc10_, _loc7_ + const_674, _loc10_, _loc7_, _loc10_ - Number(const_674), _loc7_, _loc8_ + const_674, _loc7_ + const_674, _loc8_];
        graphics.drawPath(const_3300, _loc6_);
        graphics.drawPath(const_3300, _loc11_);
    }

    private function method_2749(): void {
        graphics.drawRect(method_1818.position.x, method_1818.position.y, this.method_6043.width, this.method_6043.height);
    }

    protected function get method_6043(): class_1198 {
        return method_1818 as class_1198;
    }
}
}
