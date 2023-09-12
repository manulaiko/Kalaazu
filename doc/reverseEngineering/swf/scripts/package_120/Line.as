package package_120 {

import flash.geom.Point;

public class Line {

    private static const const_950: String = "";

    public static const const_2031: String = "onSegment";

    public static const RIGHT: String = "right";

    public static const LEFT: String = "left";

    public static const FRONT: String = "front";

    public static const const_2302: String = "behind";


    private var var_2197: Point;

    private var var_2591: Point;

    public function Line(param1: Number, param2: Number, param3: Number, param4: Number) {
        this.var_2197 = new Point();
        this.var_2591 = new Point();
        super();
        this.var_2197.y = param4;
        this.var_2197.x = param3;
        this.var_2591.y = param2;
        this.var_2591.x = param1;
    }

    public function method_1769(): Point {
        return new Point(Number(this.var_2197.y) - Number(this.var_2591.y), -(Number(this.var_2197.x) - Number(this.var_2591.x)));
    }

    public function method_1678(param1: Point, param2: Boolean = false): String {
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: * = false;
        var _loc6_: Boolean = false;
        var _loc7_: Boolean = false;
        var _loc8_: Boolean = false;
        var _loc9_: Number = Point.distance(param1, this.var_2591.add(Point.polar(1, Math.atan2(Number(this.var_2591.y) - Number(this.var_2197.y), Number(this.var_2591.x) - Number(this.var_2197.x)) + 0)));
        var _loc10_: Number = Point.distance(param1, this.var_2591.add(Point.polar(-1, Math.atan2(Number(this.var_2591.y) - Number(this.var_2197.y), Number(this.var_2591.x) - Number(this.var_2197.x)) + 0)));
        _loc5_ = _loc9_ == _loc10_;
        if (_loc9_ < _loc10_) {
            _loc8_ = true;
        }
        _loc3_ = this.var_2591.add(Point.polar(1, Math.atan2(Number(this.var_2591.y) - Number(this.var_2197.y), Number(this.var_2591.x) - Number(this.var_2197.x)) + Math.PI));
        _loc4_ = this.var_2591.add(Point.polar(-1, Math.atan2(Number(this.var_2591.y) - Number(this.var_2197.y), Number(this.var_2591.x) - Number(this.var_2197.x)) + Math.PI));
        _loc9_ = Point.distance(param1, _loc3_.add(Point.polar(1, Math.atan2(Number(this.var_2591.y) - Number(this.var_2197.y), Number(this.var_2591.x) - Number(this.var_2197.x)) + Math.PI)));
        _loc10_ = Point.distance(param1, _loc4_.add(Point.polar(-1, Math.atan2(Number(this.var_2591.y) - Number(this.var_2197.y), Number(this.var_2591.x) - Number(this.var_2197.x)) + Math.PI)));
        if (_loc9_ < _loc10_) {
            _loc7_ = true;
        }
        _loc3_ = this.var_2197.add(Point.polar(1, Math.atan2(Number(this.var_2591.y) - Number(this.var_2197.y), Number(this.var_2591.x) - Number(this.var_2197.x)) + Math.PI));
        _loc4_ = this.var_2197.add(Point.polar(-1, Math.atan2(Number(this.var_2591.y) - Number(this.var_2197.y), Number(this.var_2591.x) - Number(this.var_2197.x)) + Math.PI));
        _loc9_ = Point.distance(param1, _loc3_.add(Point.polar(1, Math.atan2(Number(this.var_2591.y) - Number(this.var_2197.y), Number(this.var_2591.x) - Number(this.var_2197.x)) + Math.PI)));
        _loc10_ = Point.distance(param1, _loc4_.add(Point.polar(-1, Math.atan2(Number(this.var_2591.y) - Number(this.var_2197.y), Number(this.var_2591.x) - Number(this.var_2197.x)) + Math.PI)));
        if (_loc9_ > _loc10_) {
            _loc6_ = true;
        }
        if (!param2) {
            if (_loc5_) {
                return const_2031;
            }
            return _loc8_ ? FRONT : const_2302;
        }
        if (_loc5_ && _loc6_ && _loc7_) {
            return const_2031;
        }
        if (!_loc8_ && _loc6_ && _loc7_) {
            return const_2302;
        }
        if (_loc8_ && _loc6_ && _loc7_) {
            return FRONT;
        }
        if (_loc6_) {
            return LEFT;
        }
        if (_loc7_) {
            return RIGHT;
        }
        return const_950;
    }
}
}
