package package_288 {

import flash.display.Bitmap;
import flash.display.BitmapData;

public class class_2078 extends Bitmap implements class_2076 {


    private var var_803: Number;

    private var var_3058: BitmapData;

    public function class_2078() {
        super(this.var_3058 = new BitmapData(1, 1, false, 0));
    }

    public function dispose(): void {
        this.var_3058.dispose();
    }

    public function get speed(): Number {
        return this.var_803;
    }

    public function set speed(param1: Number): void {
        this.var_803 = param1;
    }

    public function set color(param1: uint): void {
        this.var_3058.floodFill(0, 0, param1);
    }
}
}
