package package_177 {

import flash.geom.Vector3D;

public class class_1076 {


    private var var_4462: Array;

    private var var_299: XML;

    private var _rotation: Vector3D;

    public function class_1076(param1: Array, param2: XML) {
        this.var_4462 = new Array();
        this._rotation = new Vector3D();
        super();
        this.var_4462 = param1;
        this.var_299 = param2;
        this.rotation.x = Number(param2.@rotationX) || false;
        this.rotation.y = Number(param2.@rotationY) || false;
        this.rotation.z = Number(param2.@rotationZ) || false;
    }

    public function get droneIds(): Array {
        return this.var_4462;
    }

    public function get method_4465(): XML {
        return this.var_299;
    }

    public function get rotation(): Vector3D {
        return this._rotation;
    }
}
}
