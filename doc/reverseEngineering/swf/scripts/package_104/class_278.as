package package_104 {

import flash.geom.Point;

public class class_278 extends class_274 {

    public static const ID: String = "horizontalListLayout";


    public function class_278() {
        super();
    }

    override public function method_1821(param1: int, param2: int): Point {
        var _loc3_: int = param2 * param1;
        return new Point(_loc3_ + _xOffset, 0 + _yOffset);
    }

    override public function method_1064(param1: int, param2: int): Point {
        var _loc3_: int = param2 * param1;
        return new Point(_loc3_, 0);
    }

    override public function get id(): String {
        return ID;
    }
}
}
