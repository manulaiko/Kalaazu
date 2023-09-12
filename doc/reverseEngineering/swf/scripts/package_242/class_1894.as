package package_242 {

import com.bigpoint.utils.ui.class_1498;

import flash.geom.Point;

public interface class_1894 extends class_1498 {


    function dropAccept(param1: Function): void;

    function dropNotAccept(param1: Function, param2: Point = null): void;

    function dispose(): void;

    function get snapToDropTarget(): Boolean;

    function get x(): Number;

    function get y(): Number;

    function set x(param1: Number): void;

    function set y(param1: Number): void;

    function get dropOffset(): Point;
}
}
