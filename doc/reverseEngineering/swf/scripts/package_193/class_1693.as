package package_193 {

import flash.display.BitmapData;
import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.filters.GlowFilter;
import flash.geom.Point;

import net.bigpoint.darkorbit.class_126;

import package_100.class_270;

import package_120.class_2010;
import package_120.class_431;

import package_9.ResourceManager;

public class class_1693 extends class_270 {

    private static const const_121: Array = [new GlowFilter(16777215)];


    private var var_1303: DisplayObject;

    public function class_1693() {
        super(new Sprite(), false, false);
    }

    override public function method_6037(): void {
        super.method_6037();
        class_1197(owner).radius.changed.add(this.update);
        class_1197(owner).zoneTypeSpecification.changed.add(this.update);
        class_1197(owner).zoneTargetTypeSpecification.changed.add(this.update);
    }

    override public function method_2753(): void {
        class_1197(owner).radius.changed.remove(this.update);
        class_1197(owner).zoneTypeSpecification.changed.remove(this.update);
        class_1197(owner).zoneTargetTypeSpecification.changed.remove(this.update);
        super.method_2753();
    }

    override protected function update(): void {
        var _loc1_: * = null;
        var _loc12_: * = null;
        var _loc13_: int = 0;
        super.update();
        _loc1_ = _icon as Sprite;
        var _loc2_: class_1197 = owner as class_1197;
        var _loc3_: Point = new Point(Number(_loc2_.position.x) * Number(_scale), Number(_loc2_.position.y) * Number(_scale));
        var _loc4_: uint = uint(class_2010.method_5013(_loc2_));
        var _loc5_: uint = uint(class_2010.method_1388(_loc2_));
        var _loc6_: Number = Number(class_2010.method_3220(_loc2_));
        var _loc7_: uint = uint(class_2010.method_4696(_loc2_));
        var _loc8_: Number = Number(class_2010.method_1501(_loc2_));
        var _loc9_: Number = Number(class_2010.method_3772(_loc2_));
        _loc1_.graphics.clear();
        _loc1_.graphics.lineStyle(_loc9_, _loc7_, Math.min(_loc8_, 1));
        if (_loc4_ == class_2010.const_1607) {
            _loc12_ = ResourceManager.getBitmapData("poizone_patterns", _loc2_.method_807);
            _loc1_.graphics.beginBitmapFill(_loc12_, null, true);
        } else {
            _loc1_.graphics.beginFill(_loc5_, _loc6_);
        }
        if (!(_loc2_.method_807 == class_431.const_1104 || _loc2_.method_807 == class_431.const_16)) {
            _loc1_.alpha = 0.7;
        }
        var _loc10_: uint = Number(_loc2_.method_4219.value) * Number(_scale);
        var _loc11_: Number = Number(_loc2_.radius.value) * Number(_scale);
        if (_loc2_.name_149) {
            if (_loc2_.method_807 == class_431.const_2513) {
                _loc1_.graphics.drawEllipse(_loc3_.x - _loc11_ - Math.round(_loc10_ / 2), _loc3_.y - _loc11_ - Math.round(_loc10_ / 2), _loc11_ * 2 + _loc10_, _loc11_ * 2 + _loc10_);
                _loc1_.graphics.drawEllipse(_loc3_.x + _loc11_, _loc3_.y + _loc11_, -(_loc11_ * 2), -(_loc11_ * 2));
            } else {
                _loc1_.graphics.drawRect(0, 0, 100000 * Number(_scale), 100000 * Number(_scale));
                _loc1_.graphics.drawEllipse(_loc3_.x + _loc11_, _loc3_.y + _loc11_, -(_loc11_ * 2), -(_loc11_ * 2));
            }
        } else {
            _loc1_.graphics.drawEllipse(_loc3_.x - _loc11_, _loc3_.y - _loc11_, _loc11_ * 2, _loc11_ * 2);
        }
        _loc1_.graphics.endFill();
        if (this.var_1303) {
            _loc1_.removeChild(this.var_1303);
            this.var_1303 = null;
        }
        if (_loc2_.method_807 == class_431.const_1104) {
            if ((_loc13_ = int(class_126.method_4731(_loc2_.zoneTypeSpecification.value))) != -1) {
                this.var_1303 = ResourceManager.getBitmap("icons", "fraction" + _loc13_);
                if (this.var_1303 != null) {
                    this.var_1303.x = _loc3_.x - Number(this.var_1303.width) / 2;
                    this.var_1303.y = _loc3_.y - Number(this.var_1303.height) / 2;
                    this.var_1303.filters = const_121;
                    _loc1_.addChild(this.var_1303);
                }
            }
        }
    }
}
}
