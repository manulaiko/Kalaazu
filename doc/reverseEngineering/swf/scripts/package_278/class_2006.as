package package_278 {

import flash.display.Bitmap;

import net.bigpoint.darkorbit.mvc.mapElements.assets.MapAssetNotification;
import net.bigpoint.darkorbit.mvc.mapElements.common.model.assetProxy.MapAssetLoadVo;

import package_17.class_62;

import package_26.class_333;
import package_26.class_94;

public class class_2006 extends class_1687 {

    private static const const_708: int = 2;

    private static const const_2239: String = "not_set";


    private var var_1662: class_2318;

    private var var_2536: class_2318;

    private var var_206: class_2318;

    private var var_165: class_333;

    private var var_2615: class_333;

    private var var_4181: class_333;

    private var var_2068: Bitmap;

    private var var_675: class_62;

    public function class_2006() {
        this.var_675 = class_62.getInstance();
        this.init();
        super();
    }

    override protected function method_511(): void {
        super.method_511();
    }

    private function init(): void {
        this.var_1662 = new class_2318();
        this.var_2536 = new class_2318();
        this.var_206 = new class_2318();
        this.var_675.method_2407(MapAssetNotification.LOAD_GRAPHICS_FOR_MAPASSET, new MapAssetLoadVo(this.initBars, "ui", new <String>["empty_bar.png"], Bitmap));
    }

    private function initBars(param1: Bitmap): void {
        this.var_2068 = param1;
        this.var_675.method_2407(MapAssetNotification.LOAD_GRAPHICS_FOR_MAPASSET, new MapAssetLoadVo(this.method_2347, "ui", new <String>["hp_bar.png"], Bitmap));
    }

    private function method_4077(param1: Bitmap): void {
        this.var_2536.base = new Bitmap(this.var_2068.bitmapData);
        this.var_2536.method_3294 = param1;
        this.var_2536.x = this.var_206.x;
        this.var_2536.y = this.var_206.y + this.var_206.height + const_708;
        this.var_4181 = class_94.getInstance().method_1211(this.var_2536, const_2239 + "nano");
        addChild(this.var_2536);
    }

    private function method_1105(param1: Bitmap): void {
        this.var_206.base = new Bitmap(this.var_2068.bitmapData);
        this.var_206.method_3294 = param1;
        this.var_206.x = this.var_1662.x;
        this.var_206.y = this.var_1662.y + this.var_1662.height + const_708;
        this.var_165 = class_94.getInstance().method_1211(this.var_206, const_2239 + "shield");
        addChild(this.var_206);
        this.var_675.method_2407(MapAssetNotification.LOAD_GRAPHICS_FOR_MAPASSET, new MapAssetLoadVo(this.method_4077, "ui", new <String>["nanohull_bar.png"], Bitmap));
    }

    private function method_2347(param1: Bitmap): void {
        this.var_1662.base = new Bitmap(this.var_2068.bitmapData);
        this.var_1662.method_3294 = param1;
        this.var_1662.x = 25;
        this.var_1662.y = 0;
        this.var_2615 = class_94.getInstance().method_1211(this.var_1662, const_2239 + "hp");
        addChild(this.var_1662);
        this.var_675.method_2407(MapAssetNotification.LOAD_GRAPHICS_FOR_MAPASSET, new MapAssetLoadVo(this.method_1105, "ui", new <String>["shield_bar.png"], Bitmap));
    }

    public function get method_42(): class_2318 {
        return this.var_1662;
    }

    public function get method_4259(): class_2318 {
        return this.var_2536;
    }

    public function get method_4971(): class_2318 {
        return this.var_206;
    }

    public function get method_5347(): class_333 {
        return this.var_165;
    }

    public function get method_875(): class_333 {
        return this.var_2615;
    }

    public function get method_6264(): class_333 {
        return this.var_4181;
    }
}
}
