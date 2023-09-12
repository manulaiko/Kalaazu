package package_479 {

import away3d.arcane;

import package_294.class_2429;

import package_436.PlaneGeometry;

import package_466.class_2598;

public class PlaneShapeSubParser extends class_2692 {


    private var name_69: PlaneGeometry;

    public function PlaneShapeSubParser() {
        super();
        this.name_69 = new PlaneGeometry(10, 10, 1, 1, false);
    }

    public static function get identifier(): * {
        return class_2598.PlaneShapeSubParser;
    }

    override public function method_3173(): class_2429 {
        return this.name_69;
    }

    override protected function method_196(): Boolean {
        if (var_117) {
            this.name_69.width = _data.width;
            this.name_69.height = _data.height;
        }
        return super.method_196();
    }
}
}
