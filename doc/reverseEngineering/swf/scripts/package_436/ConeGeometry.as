package package_436 {

public class ConeGeometry extends CylinderGeometry {


    public function ConeGeometry(param1: Number = 50, param2: Number = 100, param3: uint = 16, param4: uint = 1, param5: Boolean = true, param6: Boolean = true) {
        super(0, param1, param2, param3, param4, false, param5, true, param6);
    }

    public function get radius(): Number {
        return var_2912;
    }

    public function set radius(param1: Number): void {
        var_2912 = param1;
        method_2121();
    }
}
}
