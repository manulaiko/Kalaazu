package package_425 {

import flash.display.Shape;

public class class_2361 extends Shape {


    public function class_2361(param1: Number = 100) {
        var size: Number = param1;
        super();
        with (graphics) {
            lineStyle(2, 16711680);
            moveTo(0, 0);
            lineTo(size, 0);
            lineTo(size - 20, -15);
            moveTo(size, 0);
            lineTo(size - 20, 15);
            lineStyle(2, 65280);
            moveTo(0, 0);
            lineTo(0, size);
            lineTo(-15, size - 20);
            moveTo(0, size);
            lineTo(15, size - 20);
        }
    }
}
}
