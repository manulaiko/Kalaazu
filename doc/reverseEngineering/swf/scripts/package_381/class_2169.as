package package_381 {

import flash.geom.Point;

import net.bigpoint.darkorbit.map.model.traits.class_319;
import net.bigpoint.darkorbit.map.view3D.class_1211;

import package_125.class_352;

import package_200.Settings3D;

import package_22.class_198;
import package_22.class_222;

import package_27.class_82;

import package_36.class_1819;

import package_9.class_50;

import package_99.class_266;

public class class_2169 extends class_2160 {


    private var _effect: class_1819;

    private var name_25: class_222;

    private var laserDamageTypeID: int;

    public function class_2169(param1: class_1211, param2: class_1819) {
        this._effect = param2;
        var _loc3_: * = null;
        if (Settings3D.effects.high.value) {
            switch (this._effect.method_938) {
                case class_352.LASER:
                case class_352.ECI:
                case class_352.SINGULARITY:
                    _loc3_ = "impact_hull_laser.zip";
                    this.laserDamageTypeID = class_266.getRandomCount(0, 2);
                    this.name_25 = class_198.method_1020(class_222.const_964, this.laserDamageTypeID);
                    break;
                case class_352.ROCKET:
                    _loc3_ = "impact_hull_rocket.zip";
                    this.name_25 = class_198.method_1020(class_222.const_2635, 0);
                    break;
                case "I":
                    this.laserDamageTypeID = class_266.getRandomCount(0, 2);
                    this.name_25 = class_198.method_1020(class_222.const_964, this.laserDamageTypeID);
                    break;
                case class_352.MINE:
                    _loc3_ = "impact_hull_rocket.zip";
                    this.name_25 = class_198.method_1020(class_222.const_2635, 1);
                    break;
                case class_352.PLASMA:
                    _loc3_ = "impact_hull_laser.zip";
                    this.name_25 = class_198.method_1020(class_222.const_2635, 2);
                    break;
                case "H":
            }
        }
        super(param2, !!_loc3_ ? _loc3_ : null, param2.source.position, param2.source, true);
        var _loc4_: class_319;
        var _loc5_: int = !!(_loc4_ = this._effect.source.method_1954(class_319) as class_319) ? int(_loc4_.clickRadius) : 50;
        var _loc6_: Number = Math.random();
        var _loc7_: Point = Point.polar(_loc5_ * _loc6_ * 0.5, _loc6_ * 10);
        method_1632.setTo(_loc7_.x, 0, Math.abs(_loc7_.y));
    }

    override protected function method_1460(): void {
        var _loc2_: int = 0;
        super.method_1460();
        var _loc1_: int = int(class_266.getRandomCount(0, 360));
        view.rotationY = _loc1_;
        if (this.name_25 != null) {
            _loc2_ = int(this.name_25.method_3142());
            if (_loc2_ != -1) {
                class_82.playSoundEffect(_loc2_, false, false, this._effect.source.position.x, this._effect.source.position.y);
            }
            if (this._effect.method_938 == "I") {
                class_50.getInstance().shakeScreen();
                class_82.playSoundEffect(7);
            }
        }
    }
}
}
