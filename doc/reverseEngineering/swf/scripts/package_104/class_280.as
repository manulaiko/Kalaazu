package package_104 {

import flash.geom.Point;

public class class_280 extends class_274 {

    public static const ID: String = "proActionHorizontalGridLayout";

    private static const const_2571: Object = {};

    {
        const_2571[0] = new Point(1, 0);
        const_2571[1] = new Point(2, 0);
        const_2571[2] = new Point(3, 0);
        const_2571[3] = new Point(0, 1);
        const_2571[4] = new Point(1, 1);
        const_2571[5] = new Point(3, 1);
        const_2571[6] = new Point(4, 1);
        const_2571[7] = new Point(1, 2);
        const_2571[8] = new Point(2, 2);
        const_2571[9] = new Point(3, 2);
        const_2571[10] = new Point(5, 1);
    }

    public function class_280() {
        super();
    }

    override public function method_1821(param1: int, param2: int): Point {
        var _loc3_: Point = (const_2571[param2] as Point).clone();
        _loc3_.x *= param1 + _xOffset;
        _loc3_.y *= param1 + _yOffset;
        return _loc3_;
    }

    override public function method_1064(param1: int, param2: int): Point {
        var _loc3_: int = param2 * param1;
        return new Point(0, _loc3_);
    }

    override public function get id(): String {
        return ID;
    }
}
}
