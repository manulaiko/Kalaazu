package starling.utils {

import flash.geom.Matrix;
import flash.geom.Matrix3D;
import flash.geom.Point;

import starling.errors.AbstractClassError;

public class MatrixUtil {

    private static var sRawData: Vector.<Number> = new <Number>[1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1];


    public function MatrixUtil() {
        super();
        throw new AbstractClassError();
    }

    public static function convertTo3D(param1: Matrix, param2: Matrix3D = null): Matrix3D {
        if (param2 == null) {
            param2 = new Matrix3D();
        }
        sRawData[0] = param1.a;
        sRawData[1] = param1.b;
        sRawData[4] = param1.c;
        sRawData[5] = param1.d;
        sRawData[12] = param1.tx;
        sRawData[13] = param1.ty;
        param2.copyRawDataFrom(sRawData);
        return param2;
    }

    public static function transformCoords(param1: Matrix, param2: Number, param3: Number, param4: Point = null): Point {
        if (param4 == null) {
            param4 = new Point();
        }
        param4.x = param1.a * param2 + param1.c * param3 + param1.tx;
        param4.y = param1.d * param3 + param1.b * param2 + param1.ty;
        return param4;
    }

    public static function skew(param1: Matrix, param2: Number, param3: Number): void {
        var _loc4_: Number = Math.sin(param2);
        var _loc5_: Number = Math.cos(param2);
        var _loc6_: Number = Math.sin(param3);
        var _loc7_: Number = Math.cos(param3);
        param1.setTo(param1.a * _loc7_ - param1.b * _loc4_, param1.a * _loc6_ + param1.b * _loc5_, param1.c * _loc7_ - param1.d * _loc4_, param1.c * _loc6_ + param1.d * _loc5_, param1.tx * _loc7_ - param1.ty * _loc4_, param1.tx * _loc6_ + param1.ty * _loc5_);
    }

    public static function prependMatrix(param1: Matrix, param2: Matrix): void {
        param1.setTo(param1.a * param2.a + param1.c * param2.b, param1.b * param2.a + param1.d * param2.b, param1.a * param2.c + param1.c * param2.d, param1.b * param2.c + param1.d * param2.d, param1.tx + param1.a * param2.tx + param1.c * param2.ty, param1.ty + param1.b * param2.tx + param1.d * param2.ty);
    }

    public static function prependTranslation(param1: Matrix, param2: Number, param3: Number): void {
        param1.tx += param1.a * param2 + param1.c * param3;
        param1.ty += param1.b * param2 + param1.d * param3;
    }

    public static function prependScale(param1: Matrix, param2: Number, param3: Number): void {
        param1.setTo(param1.a * param2, param1.b * param2, param1.c * param3, param1.d * param3, param1.tx, param1.ty);
    }

    public static function prependRotation(param1: Matrix, param2: Number): void {
        var _loc3_: Number = Math.sin(param2);
        var _loc4_: Number = Math.cos(param2);
        param1.setTo(param1.a * _loc4_ + param1.c * _loc3_, param1.b * _loc4_ + param1.d * _loc3_, param1.c * _loc4_ - param1.a * _loc3_, param1.d * _loc4_ - param1.b * _loc3_, param1.tx, param1.ty);
    }

    public static function prependSkew(param1: Matrix, param2: Number, param3: Number): void {
        var _loc4_: Number = Math.sin(param2);
        var _loc5_: Number = Math.cos(param2);
        var _loc6_: Number = Math.sin(param3);
        var _loc7_: Number = Math.cos(param3);
        param1.setTo(param1.a * _loc7_ + param1.c * _loc6_, param1.b * _loc7_ + param1.d * _loc6_, param1.c * _loc5_ - param1.a * _loc4_, param1.d * _loc5_ - param1.b * _loc4_, param1.tx, param1.ty);
    }
}
}
