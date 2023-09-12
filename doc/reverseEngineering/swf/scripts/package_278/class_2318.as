package package_278 {

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Sprite;

public class class_2318 extends Sprite {


    private var var_764: Bitmap;

    private var var_2357: Bitmap;

    private var var_1646: Bitmap;

    private var var_1993: Number;

    private const const_315: int = 62;

    private const const_1481: int = 5;

    public function class_2318(param1: int = 62, param2: int = 5) {
        super();
        this.var_2357 = new Bitmap(new BitmapData(param1, param2, false, 16777215));
    }

    public function set method_3294(param1: Bitmap): void {
        this.var_1646 = param1;
        this.var_1646.mask = this.var_2357;
        addChild(this.var_1646);
        addChild(this.var_2357);
        this.method_514 = this.var_1993;
    }

    public function set base(param1: Bitmap): void {
        this.var_764 = param1;
        addChild(this.var_764);
    }

    public function get base(): Bitmap {
        return this.var_764;
    }

    public function get method_3294(): Bitmap {
        return this.var_1646;
    }

    public function get method_514(): Number {
        return this.var_1993;
    }

    public function set method_514(param1: Number): void {
        this.var_1993 = param1;
        this.var_2357.scaleX = this.var_1993;
    }
}
}
