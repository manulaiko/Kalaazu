package package_3 {

import flash.utils.getDefinitionByName;

import mx.binding.Binding;
import mx.binding.BindingManager;
import mx.binding.IBindingClient;
import mx.binding.IWatcherSetupUtil2;
import mx.core.IFlexModuleFactory;
import mx.core.mx_internal;
import mx.events.PropertyChangeEvent;

import spark.components.Label;
import spark.components.gridClasses.GridItemRenderer;

public class class_2289 extends GridItemRenderer implements IBindingClient {

    private static var _watcherSetupUtil: IWatcherSetupUtil2;


    public var _TDMAbstractToolTipGridRenderer_Label1: Label;

    private var __moduleFactoryInitialized: Boolean = false;

    protected var var_79: String;

    protected var var_4269: uint;

    protected var _456118863_fontSize: uint = 11;

    protected var _90883374_font: String = "EurostileT";

    protected var var_3314: String = "left";

    mx_internal var _bindings: Array;

    mx_internal var _watchers: Array;

    mx_internal var _bindingsByDestination: Object;

    mx_internal var _bindingsBeginWithWord: Object;

    public function class_2289() {
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
        bindings = this.method_6290();
        watchers = [];
        target = this;
        if (_watcherSetupUtil == null) {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_tdm_matchresultWindow_view_window_components_tooltip_TDMAbstractToolTipGridRendererWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
        }
        _watcherSetupUtil.setup(this, function (param1: String): * {
            return target[param1];
        }, function (param1: String): * {
            return class_2289[param1];
        }, bindings, watchers);
        mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
        mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
        this.percentWidth = 100;
        this.mxmlContent = [this.method_1642()];
        var_1 = 0;
        while (var_1 < bindings.length) {
            Binding(bindings[var_1]).execute();
            var_1++;
        }
    }

    public static function set watcherSetupUtil(param1: IWatcherSetupUtil2): void {
        class_2289._watcherSetupUtil = param1;
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

    private function method_1642(): Label {
        var _loc1_: Label = new Label();
        _loc1_.percentWidth = 100;
        _loc1_.setStyle("paddingLeft", 5);
        _loc1_.setStyle("paddingRight", 5);
        _loc1_.setStyle("paddingTop", 5);
        _loc1_.id = "_TDMAbstractToolTipGridRenderer_Label1";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this._TDMAbstractToolTipGridRenderer_Label1 = _loc1_;
        BindingManager.executeBindings(this, "_TDMAbstractToolTipGridRenderer_Label1", this._TDMAbstractToolTipGridRenderer_Label1);
        return _loc1_;
    }

    private function method_6290(): Array {
        var var_5: Array = [];
        var_5[0] = new Binding(this, function (): Number {
            return _fontSize;
        }, function (param1: Number): void {
            _TDMAbstractToolTipGridRenderer_Label1.setStyle("fontSize", param1);
        }, "_TDMAbstractToolTipGridRenderer_Label1.fontSize");
        var_5[1] = new Binding(this, function (): String {
            var _loc1_: * = _font;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, function (param1: String): void {
            _TDMAbstractToolTipGridRenderer_Label1.setStyle("fontFamily", param1);
        }, "_TDMAbstractToolTipGridRenderer_Label1.fontFamily");
        var_5[2] = new Binding(this, function (): uint {
            return _color;
        }, function (param1: uint): void {
            _TDMAbstractToolTipGridRenderer_Label1.setStyle("color", param1);
        }, "_TDMAbstractToolTipGridRenderer_Label1.color");
        var_5[3] = new Binding(this, function (): String {
            var _loc1_: * = _textAlign;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, function (param1: String): void {
            _TDMAbstractToolTipGridRenderer_Label1.setStyle("textAlign", param1);
        }, "_TDMAbstractToolTipGridRenderer_Label1.textAlign");
        var_5[4] = new Binding(this, function (): String {
            var _loc1_: * = _text;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, null, "_TDMAbstractToolTipGridRenderer_Label1.text");
        return var_5;
    }

    [Bindable(event="propertyChange")]
    protected function get _text(): String {
        return this.var_79;
    }

    protected function set _text(param1: String): void {
        var _loc2_: Object = this.var_79;
        if (_loc2_ !== param1) {
            this.var_79 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_text", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    protected function get _color(): uint {
        return this.var_4269;
    }

    protected function set _color(param1: uint): void {
        var _loc2_: Object = this.var_4269;
        if (_loc2_ !== param1) {
            this.var_4269 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_color", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    protected function get _fontSize(): uint {
        return this._456118863_fontSize;
    }

    protected function set _fontSize(param1: uint): void {
        var _loc2_: Object = this._456118863_fontSize;
        if (_loc2_ !== param1) {
            this._456118863_fontSize = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_fontSize", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    protected function get _font(): String {
        return this._90883374_font;
    }

    protected function set _font(param1: String): void {
        var _loc2_: Object = this._90883374_font;
        if (_loc2_ !== param1) {
            this._90883374_font = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_font", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    protected function get _textAlign(): String {
        return this.var_3314;
    }

    protected function set _textAlign(param1: String): void {
        var _loc2_: Object = this.var_3314;
        if (_loc2_ !== param1) {
            this.var_3314 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_textAlign", _loc2_, param1));
            }
        }
    }
}
}
