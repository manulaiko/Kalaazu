package package_75 {

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.MovieClip;
import flash.geom.Matrix;

import net.bigpoint.darkorbit.fui.UISystem;
import net.bigpoint.darkorbit.fui.system.manager.IMouseManager;
import net.bigpoint.darkorbit.map.model.ship.class_86;
import net.bigpoint.darkorbit.map.model.traits.class_319;

import package_14.class_52;

import package_35.Effect;
import package_35.class_338;

import package_9.ResourceManager;
import package_9.class_50;

public class MouseCursorChangeEffect extends Effect implements class_52 {

    private static const const_2357: String = "MouseCursorChangeEffect";


    private var _libId: String;

    private var _linkageID: String;

    private var _active: Boolean = false;

    public function MouseCursorChangeEffect(param1: String, param2: String) {
        super(class_338.const_1807, const_2311);
        this._libId = param1;
        this._linkageID = param2;
    }

    override public function activate(): Boolean {
        var _loc1_: Boolean = super.activate();
        class_50.method_5621(this);
        this._active = true;
        this.method_1549();
        return _loc1_;
    }

    override public function method_5571(param1: Effect): void {
        this._libId = MouseCursorChangeEffect(param1)._libId;
        this._linkageID = MouseCursorChangeEffect(param1)._linkageID;
        this.method_1549();
    }

    override public function deactivate(): void {
        this._active = false;
        class_50.removeObserver(this);
        this.mouseManager.hideCustomCursor();
        this.mouseManager.unregisterMouseCursor(const_2357);
    }

    public function updateTimer(param1: Number): void {
        var _loc2_: Boolean = false;
        var _loc3_: class_50 = class_50.getInstance();
        var _loc4_: class_319;
        if ((!!(_loc4_ = _loc3_.method_1772.method_5321.method_495) ? _loc4_.owner as class_86 : null) != null && null != _loc3_.map.method_1203().method_3338()) {
            _loc2_ = true;
        }
        if (_loc2_) {
            this.mouseManager.showCustomCursor(const_2357);
        } else {
            this.mouseManager.hideCustomCursor();
        }
    }

    private function method_1549(): void {
        var _loc1_: * = null;
        var _loc2_: * = null;
        var _loc3_: * = null;
        if (this._active) {
            if (ResourceManager.isLoaded(this._libId)) {
                _loc1_ = ResourceManager.getMovieClip(this._libId, this._linkageID);
                _loc2_ = new BitmapData(32, 32, true, 0);
                _loc3_ = new Matrix();
                _loc3_.translate(16, 16);
                _loc2_.draw(_loc1_, _loc3_);
                this.mouseManager.hideCustomCursor();
                this.mouseManager.unregisterMouseCursor(const_2357);
                this.mouseManager.registerMouseCursor(const_2357, new Bitmap(_loc2_));
            } else {
                ResourceManager.loadAndCall(this._libId, this.method_1549, []);
            }
        }
    }

    private function get mouseManager(): IMouseManager {
        return UISystem.getInstance().mouseManager;
    }
}
}
