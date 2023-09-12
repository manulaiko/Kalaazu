package net.bigpoint.darkorbit.map.view2D.backgrounds.view {

import flash.utils.setTimeout;

import net.bigpoint.darkorbit.mvc.display.IDisplayObject;
import net.bigpoint.darkorbit.settings.Settings;

import package_361.class_2089;

public class class_2087 {


    private var _view: IDisplayObject;

    private var _data: class_2089;

    private var var_2812: Boolean = false;

    public function class_2087(param1: IDisplayObject, param2: class_2089 = null) {
        super();
        this._view = param1;
        this._data = param2;
        Settings.qualityBackground.changed.add(this.method_3401);
        setTimeout(this.method_3401, 1);
    }

    public static function compare(param1: class_2087, param2: class_2087): int {
        if (param1.data.depth > param2.data.depth) {
            return 1;
        }
        if (param1.data.depth < param2.data.depth) {
            return -1;
        }
        return 0;
    }

    public function get view(): IDisplayObject {
        return this._view;
    }

    public function get data(): class_2089 {
        return this._data;
    }

    public function method_822(param1: int, param2: int): Boolean {
        return false;
    }

    public final function dispose(): void {
        Settings.qualityBackground.changed.remove(this.method_3401);
        this.unloadView();
    }

    public function update(param1: int, param2: int, param3: int, param4: int): void {
    }

    public function method_3361(param1: int, param2: int): void {
    }

    private final function method_3401(): void {
        var _loc1_: Boolean = Boolean(this.method_3258());
        if (this.var_2812 != _loc1_) {
            this.var_2812 = _loc1_;
            if (_loc1_) {
                this.method_352();
            } else {
                this.unloadView();
            }
        }
    }

    protected function method_352(): void {
    }

    protected function unloadView(): void {
        if (this.view.numChildren > 0) {
            while (this.view.numChildren) {
                this.view.method_33(0);
            }
        }
    }

    protected function method_3258(): Boolean {
        return true;
    }
}
}
