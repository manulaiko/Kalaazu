package package_142 {

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.DisplayObjectContainer;

public class class_1497 extends class_970 {


    private var var_4953: BitmapData;

    private var var_314: BitmapData;

    private var var_878: BitmapData;

    public function class_1497(param1: DisplayObjectContainer, param2: BitmapData, param3: BitmapData, param4: BitmapData, param5: BitmapData = null) {
        super(param1);
        this.method_1128(background, this.var_4953 = param2);
        this.method_1128(rollOverState, this.var_314 = param3);
        this.method_1128(mouseDownState, this.var_314);
        this.method_1128(selectedState, this.var_878 = param5);
        if (param5) {
            this.method_1128(selectedState, this.var_878 = param5);
        }
    }

    private function method_1128(param1: DisplayObjectContainer, param2: BitmapData): void {
        if (param2) {
            param1.addChild(new Bitmap(param2));
        }
    }
}
}
