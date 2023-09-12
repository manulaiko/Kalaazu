package package_479 {

import package_294.class_2429;

import package_436.CylinderGeometry;

import package_466.class_2598;

public class CylinderShapeSubParser extends class_2692 {


    private var name_69: CylinderGeometry;

    public function CylinderShapeSubParser() {
        super();
        this.name_69 = new CylinderGeometry(10, 10, 10);
    }

    public static function get identifier(): * {
        return class_2598.CylinderShapeSubParser;
    }

    override public function method_3173(): class_2429 {
        return this.name_69;
    }

    override protected function method_196(): Boolean {
        if (var_117) {
            this.name_69 = new CylinderGeometry(_data.topRadius, _data.bottomRadius, _data.height, _data.segmentsW, 1, _data.topClosed, _data.bottomClosed);
        }
        return super.method_196();
    }
}
}
