package package_359 {

import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.utils.setTimeout;

import net.bigpoint.darkorbit.map.common.IDisposable;
import net.bigpoint.darkorbit.map.common.class_2362;
import net.bigpoint.darkorbit.mvc.display.class_1200;
import net.bigpoint.darkorbit.mvc.mapElements.assets.MapAssetNotification;
import net.bigpoint.darkorbit.mvc.mapElements.assets.viewBuilder.model.ViewCreateDTO;
import net.bigpoint.darkorbit.mvc.mapElements.assets.viewBuilder.view.IAnimatedViewContainer;
import net.bigpoint.darkorbit.settings.Settings;

import package_17.class_62;

import package_19.class_68;
import package_19.class_70;

public class class_2363 extends Sprite implements IDisposable, class_2362 {


    public const ready: class_68 = new class_70();

    private var _view: IAnimatedViewContainer;

    private var var_2785: Vector.<String>;

    private var _descriptor: XML;

    public function class_2363(param1: XML) {
        super();
        this._descriptor = param1;
        if (this._descriptor.attribute("includeIn").length() > 0) {
            this.var_2785 = Vector.<String>(String(this._descriptor.@includeIn).split(","));
        }
    }

    public function init(): void {
        var _loc1_: * = null;
        var _loc2_: * = null;
        if (String(this._descriptor.@descriptorResKey).length > 0) {
            _loc1_ = String(this._descriptor.@descriptorResKey);
        } else {
            _loc2_ = this._descriptor;
        }
        class_62.getInstance().sendNotification(MapAssetNotification.LOAD_MAPASSET_VIEW, new ViewCreateDTO(_loc1_, this.initView, class_1200.method_2722, _loc2_));
    }

    public function disposeView(param1: Boolean = false): void {
        if (this._view) {
            removeChild(this._view.view as DisplayObject);
            this._view.dispose();
            this._view = null;
        }
        Settings.autoQualityReduction.changed.remove(this.method_4425);
    }

    private function initView(param1: IAnimatedViewContainer): void {
        this._view = param1;
        addChild(this._view.view as DisplayObject);
        Settings.autoQualityReduction.changed.add(this.method_4425);
        this.method_4425();
        setTimeout(this.ready.dispatch, 1);
    }

    private function method_4425(): void {
        if (this._view) {
            this._view.userQuality = Settings.qualityBackground.value;
            this._view.reductionLevel = Settings.autoQualityReduction.value;
        }
    }

    public function handleStateChange(param1: String): void {
        visible = this.var_2785 == null || this.var_2785.indexOf(param1) != -1;
    }

    public function get view(): IAnimatedViewContainer {
        return this._view;
    }
}
}
