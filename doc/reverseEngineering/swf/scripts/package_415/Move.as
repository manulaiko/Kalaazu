package package_415 {

import package_414.class_2337;

import package_416.class_2338;

import package_459.class_2551;

import package_460.class_2552;

public class Move extends class_2337 {


    public function Move() {
        super();
        priority = -10;
    }

    override public function update(param1: class_2338, param2: class_2551, param3: Number): void {
        var _loc4_: class_2552 = class_2552(param2);
        _loc4_.var_789 = _loc4_.x;
        _loc4_.var_2238 = _loc4_.y;
        _loc4_.x += Number(_loc4_.var_831) * param3;
        _loc4_.y += Number(_loc4_.var_3765) * param3;
    }
}
}
