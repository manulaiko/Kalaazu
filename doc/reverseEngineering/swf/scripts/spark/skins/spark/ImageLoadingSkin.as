package spark.skins.spark {

import flash.utils.getDefinitionByName;

import mx.binding.Binding;
import mx.binding.BindingManager;
import mx.binding.IBindingClient;
import mx.binding.IWatcherSetupUtil2;
import mx.core.IFlexModuleFactory;
import mx.core.mx_internal;
import mx.events.PropertyChangeEvent;
import mx.graphics.GradientEntry;
import mx.graphics.LinearGradient;
import mx.graphics.LinearGradientStroke;
import mx.graphics.SolidColor;
import mx.graphics.SolidColorStroke;

import spark.components.Group;
import spark.components.supportClasses.Range;
import spark.components.supportClasses.Skin;
import spark.primitives.Rect;

public class ImageLoadingSkin extends Skin implements IBindingClient {

    private static var _watcherSetupUtil: IWatcherSetupUtil2;


    public var _ImageLoadingSkin_Group1: Group;

    private var __moduleFactoryInitialized: Boolean = false;

    mx_internal var _bindings: Array;

    mx_internal var _watchers: Array;

    mx_internal var _bindingsByDestination: Object;

    mx_internal var _bindingsBeginWithWord: Object;

    private var _213507019hostComponent: Range;

    public function ImageLoadingSkin() {
        var bindings: Array;
        var watchers: Array;
        var var_1: uint;
        var target: Object = null;
        var watcherSetupUtilClass: Object = null;
        this.mx_internal::_bindings = [];
        this.mx_internal::_watchers = [];
        this.mx_internal::_bindingsByDestination = {};
        this.mx_internal::_bindingsBeginWithWord = {};
        super();
        mx_internal::_document = this;
        bindings = this._ImageLoadingSkin_bindingsSetup();
        watchers = [];
        target = this;
        if (_watcherSetupUtil == null) {
            watcherSetupUtilClass = getDefinitionByName("_spark_skins_spark_ImageLoadingSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
        }
        _watcherSetupUtil.setup(this, function (param1: String): * {
            return target[param1];
        }, function (param1: String): * {
            return ImageLoadingSkin[param1];
        }, bindings, watchers);
        mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
        mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
        this.minHeight = 9;
        this.minWidth = 36;
        this.mxmlContent = [this._ImageLoadingSkin_Rect1_c(), this._ImageLoadingSkin_Rect2_c(), this._ImageLoadingSkin_Rect3_c(), this._ImageLoadingSkin_Rect4_c(), this._ImageLoadingSkin_Rect5_c(), this._ImageLoadingSkin_Group1_i()];
        var_1 = 0;
        while (var_1 < bindings.length) {
            Binding(bindings[var_1]).execute();
            var_1++;
        }
    }

    public static function set watcherSetupUtil(param1: IWatcherSetupUtil2): void {
        ImageLoadingSkin._watcherSetupUtil = param1;
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

    private function _ImageLoadingSkin_Rect1_c(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 1;
        _loc1_.right = 1;
        _loc1_.top = 1;
        _loc1_.bottom = 1;
        _loc1_.stroke = this._ImageLoadingSkin_SolidColorStroke1_c();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function _ImageLoadingSkin_SolidColorStroke1_c(): SolidColorStroke {
        var _loc1_: SolidColorStroke = new SolidColorStroke();
        _loc1_.color = 6513507;
        _loc1_.alpha = 1;
        return _loc1_;
    }

    private function _ImageLoadingSkin_Rect2_c(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 2;
        _loc1_.right = 2;
        _loc1_.top = 2;
        _loc1_.bottom = 2;
        _loc1_.fill = this._ImageLoadingSkin_LinearGradient1_c();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function _ImageLoadingSkin_LinearGradient1_c(): LinearGradient {
        var _loc1_: LinearGradient = new LinearGradient();
        _loc1_.rotation = 90;
        _loc1_.entries = [this._ImageLoadingSkin_GradientEntry1_c(), this._ImageLoadingSkin_GradientEntry2_c()];
        return _loc1_;
    }

    private function _ImageLoadingSkin_GradientEntry1_c(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 10132122;
        _loc1_.alpha = 1;
        return _loc1_;
    }

    private function _ImageLoadingSkin_GradientEntry2_c(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 12434877;
        _loc1_.alpha = 1;
        return _loc1_;
    }

    private function _ImageLoadingSkin_Rect3_c(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 2;
        _loc1_.top = 2;
        _loc1_.bottom = 2;
        _loc1_.width = 1;
        _loc1_.fill = this._ImageLoadingSkin_SolidColor1_c();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function _ImageLoadingSkin_SolidColor1_c(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        _loc1_.color = 0;
        _loc1_.alpha = 0.12;
        return _loc1_;
    }

    private function _ImageLoadingSkin_Rect4_c(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.right = 2;
        _loc1_.top = 2;
        _loc1_.bottom = 2;
        _loc1_.width = 1;
        _loc1_.fill = this._ImageLoadingSkin_SolidColor2_c();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function _ImageLoadingSkin_SolidColor2_c(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        _loc1_.color = 0;
        _loc1_.alpha = 0.12;
        return _loc1_;
    }

    private function _ImageLoadingSkin_Rect5_c(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 3;
        _loc1_.top = 2;
        _loc1_.right = 3;
        _loc1_.height = 1;
        _loc1_.fill = this._ImageLoadingSkin_SolidColor3_c();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function _ImageLoadingSkin_SolidColor3_c(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        _loc1_.color = 0;
        _loc1_.alpha = 0.12;
        return _loc1_;
    }

    private function _ImageLoadingSkin_Group1_i(): Group {
        var _loc1_: Group = new Group();
        _loc1_.percentHeight = 100;
        _loc1_.mxmlContent = [this._ImageLoadingSkin_Rect6_c(), this._ImageLoadingSkin_Rect7_c(), this._ImageLoadingSkin_Rect8_c()];
        _loc1_.id = "_ImageLoadingSkin_Group1";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this._ImageLoadingSkin_Group1 = _loc1_;
        BindingManager.executeBindings(this, "_ImageLoadingSkin_Group1", this._ImageLoadingSkin_Group1);
        return _loc1_;
    }

    private function _ImageLoadingSkin_Rect6_c(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 2;
        _loc1_.right = 2;
        _loc1_.top = 2;
        _loc1_.bottom = 2;
        _loc1_.fill = this._ImageLoadingSkin_LinearGradient2_c();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function _ImageLoadingSkin_LinearGradient2_c(): LinearGradient {
        var _loc1_: LinearGradient = new LinearGradient();
        _loc1_.rotation = 90;
        _loc1_.entries = [this._ImageLoadingSkin_GradientEntry3_c(), this._ImageLoadingSkin_GradientEntry4_c()];
        return _loc1_;
    }

    private function _ImageLoadingSkin_GradientEntry3_c(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 16777215;
        _loc1_.alpha = 1;
        return _loc1_;
    }

    private function _ImageLoadingSkin_GradientEntry4_c(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 14211288;
        _loc1_.alpha = 1;
        return _loc1_;
    }

    private function _ImageLoadingSkin_Rect7_c(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 2;
        _loc1_.right = 2;
        _loc1_.top = 2;
        _loc1_.bottom = 2;
        _loc1_.stroke = this._ImageLoadingSkin_LinearGradientStroke1_c();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function _ImageLoadingSkin_LinearGradientStroke1_c(): LinearGradientStroke {
        var _loc1_: LinearGradientStroke = new LinearGradientStroke();
        _loc1_.rotation = 90;
        _loc1_.entries = [this._ImageLoadingSkin_GradientEntry5_c(), this._ImageLoadingSkin_GradientEntry6_c()];
        return _loc1_;
    }

    private function _ImageLoadingSkin_GradientEntry5_c(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 16777215;
        _loc1_.alpha = 0.9;
        return _loc1_;
    }

    private function _ImageLoadingSkin_GradientEntry6_c(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 16777215;
        _loc1_.alpha = 0.5;
        return _loc1_;
    }

    private function _ImageLoadingSkin_Rect8_c(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.right = 1;
        _loc1_.top = 2;
        _loc1_.bottom = 2;
        _loc1_.width = 1;
        _loc1_.fill = this._ImageLoadingSkin_SolidColor4_c();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function _ImageLoadingSkin_SolidColor4_c(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        _loc1_.color = 0;
        _loc1_.alpha = 0.35;
        return _loc1_;
    }

    private function _ImageLoadingSkin_bindingsSetup(): Array {
        var var_5: Array = [];
        var_5[0] = new Binding(this, function (): Number {
            return hostComponent.value;
        }, null, "_ImageLoadingSkin_Group1.percentWidth");
        return var_5;
    }

    [Bindable(event="propertyChange")]
    public function get hostComponent(): Range {
        return this._213507019hostComponent;
    }

    public function set hostComponent(param1: Range): void {
        var _loc2_: Object = this._213507019hostComponent;
        if (_loc2_ !== param1) {
            this._213507019hostComponent = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hostComponent", _loc2_, param1));
            }
        }
    }
}
}
