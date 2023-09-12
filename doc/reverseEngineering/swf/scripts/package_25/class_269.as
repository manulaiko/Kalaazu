package package_25 {

import com.greensock.TweenLite;

import flash.display.Bitmap;
import flash.display.BitmapData;

import net.bigpoint.darkorbit.map.model.class_90;
import net.bigpoint.darkorbit.settings.Settings;

import package_11.class_65;

import package_9.ResourceManager;

public class class_269 extends Bitmap {


    private var _width: int = 0;

    private var _height: int = 0;

    private var _resKey: String;

    private var var_1008: int;

    public function class_269() {
        super();
    }

    public function update(param1: class_90, param2: int, param3: int): void {
        var _loc4_: int = 0;
        var _loc5_: * = null;
        this._width = param2;
        this._height = param3;
        if (this.var_1008 != param1.mapID) {
            this.var_1008 = param1.mapID;
            this._resKey = null;
            bitmapData = null;
        }
        if (Settings.displayMiniMapBackgroundImage.value) {
            _loc4_ = 700;
            if (param2 <= 400) {
                _loc4_ = 300;
            }
            _loc5_ = !!String(param1.method_3763.@minimap).length ? "minimap-" + String(param1.method_3763.@minimap) : "";
            if (!ResourceManager.name_15.method_5888(_loc5_)) {
                _loc5_ = "minimap-" + param1.mapID + "-" + _loc4_;
            }
            if (!ResourceManager.name_15.method_5888(_loc5_)) {
                _loc5_ = "minimap-" + param1.mapID;
            }
            if (this._resKey != _loc5_) {
                this._resKey = _loc5_;
                ResourceManager.name_15.load(this._resKey, this.method_4454);
            } else {
                this.method_3857();
            }
        } else {
            this._resKey = null;
            bitmapData = new BitmapData(1, 1, false, 592137);
            this.method_3857();
        }
    }

    private function method_4454(param1: class_65): void {
        if (bitmapData) {
            bitmapData.dispose();
        }
        var _loc2_: * = bitmapData == null;
        bitmapData = param1.getBitmap().bitmapData.clone();
        smoothing = true;
        this.method_3857();
        if (_loc2_) {
            alpha = 0;
            TweenLite.to(this, 0.3, {"alpha": 1});
        }
        param1.dispose();
    }

    private function method_3857(): void {
        if (bitmapData) {
            var _loc1_: * = Number(this._width) / 0;
            scaleY = Number(this._width) / 0;
            scaleX = _loc1_;
        }
    }
}
}
