package package_339 {

import mx.core.IFlexModuleFactory;
import mx.graphics.SolidColor;

import spark.primitives.Rect;
import spark.skins.SparkSkin;

public class class_1907 extends SparkSkin {


    private var __moduleFactoryInitialized: Boolean = false;

    public function class_1907() {
        super();
        mx_internal::_document = this;
        this.name = "DOCustomProgressBarSkin";
        this.mxmlContent = [this.method_5242()];
    }

    override public function set moduleFactory(param1: IFlexModuleFactory): void {
        super.moduleFactory = param1;
        if (this.__moduleFactoryInitialized) {
            return;
        }
        this.__moduleFactoryInitialized = true;
    }

    override public function initialize(): void {
        super.initialize();
    }

    private function method_5242(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 0;
        _loc1_.right = 0;
        _loc1_.top = 1;
        _loc1_.bottom = 1;
        _loc1_.height = 2;
        _loc1_.fill = this.method_4685();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function method_4685(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        _loc1_.color = 3048122;
        return _loc1_;
    }
}
}
