package package_12 {

import flash.events.MouseEvent;
import flash.utils.getDefinitionByName;

import mx.binding.Binding;
import mx.binding.BindingManager;
import mx.binding.IBindingClient;
import mx.binding.IWatcherSetupUtil2;
import mx.core.DeferredInstanceFromFunction;
import mx.core.IFlexModuleFactory;
import mx.core.mx_internal;
import mx.events.FlexEvent;
import mx.events.PropertyChangeEvent;

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.mvc.questWindow.model.vo.HighscoreVO;

import spark.components.Label;
import spark.components.SkinnableContainer;

public class class_77 extends SkinnableContainer implements IBindingClient {

    private static var _watcherSetupUtil: IWatcherSetupUtil2;


    private var var_1122: Label;

    private var __moduleFactoryInitialized: Boolean = false;

    private var var_2032: String;

    private var name_5: Boolean;

    private var var_2098: int;

    public var name_120: String;

    public var dataVO: HighscoreVO = null;

    private var hovered: Boolean = false;

    mx_internal var _bindings: Array;

    mx_internal var _watchers: Array;

    mx_internal var _bindingsByDestination: Object;

    mx_internal var _bindingsBeginWithWord: Object;

    public function class_77() {
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
        bindings = this.method_4426();
        watchers = [];
        target = this;
        if (_watcherSetupUtil == null) {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_questWindow_view_challengesSection_renderers_HighscoreTableSkinableRowContentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
        }
        _watcherSetupUtil.setup(this, function (param1: String): * {
            return target[param1];
        }, function (param1: String): * {
            return class_77[param1];
        }, bindings, watchers);
        mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
        mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
        this.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_379);
        this.addEventListener("creationComplete", this.method_6147);
        this.addEventListener("rollOver", this.method_5172);
        this.addEventListener("rollOut", this.method_3737);
        var_1 = 0;
        while (var_1 < bindings.length) {
            Binding(bindings[var_1]).execute();
            var_1++;
        }
    }

    public static function set watcherSetupUtil(param1: IWatcherSetupUtil2): void {
        class_77._watcherSetupUtil = param1;
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

    private function creationCompleteHandler(param1: FlexEvent): void {
        this.rowLabel.setStyle("color", getStyle("fontColorActive"));
    }

    private function method_1058(): void {
        this.hovered = true;
        this.method_1328();
    }

    private function method_3409(): void {
        this.hovered = false;
        this.method_1328();
    }

    public function method_1328(): void {
        if (Boolean(this.hovered) && this.columnIndex == 1) {
            this.rowLabel.setStyle("color", getStyle("fontColorHover"));
            this.rowLabel.toolTip = class_88.getItem("ttip_questwin_link_eppp");
        } else if (this.dataVO != null && Boolean(this.dataVO.isHero)) {
            this.rowLabel.setStyle("color", getStyle("fontColor"));
        } else {
            this.rowLabel.setStyle("color", getStyle("fontColorActive"));
        }
    }

    private function method_379(): Array {
        return [this.method_1195()];
    }

    private function method_1195(): Label {
        var _loc1_: Label = new Label();
        _loc1_.percentWidth = 100;
        _loc1_.verticalCenter = 0;
        _loc1_.setStyle("fontSize", 11);
        _loc1_.setStyle("fontFamily", "EurostileT");
        _loc1_.setStyle("verticalAlign", "middle");
        _loc1_.id = "rowLabel";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.rowLabel = _loc1_;
        BindingManager.executeBindings(this, "rowLabel", this.rowLabel);
        return _loc1_;
    }

    public function method_6147(param1: FlexEvent): void {
        this.creationCompleteHandler(param1);
    }

    public function method_5172(param1: MouseEvent): void {
        this.method_1058();
    }

    public function method_3737(param1: MouseEvent): void {
        this.method_3409();
    }

    private function method_4426(): Array {
        var var_5: Array = [];
        var_5[0] = new Binding(this, null, null, "rowLabel.text", "label");
        var_5[1] = new Binding(this, function (): String {
            return "left" == undefined ? null : String("left");
        }, function (param1: String): void {
            rowLabel.setStyle("textAlign", param1);
        }, "rowLabel.textAlign");
        var_5[2] = new Binding(this, function (): Number {
            return Number(getStyle("paddingTop")) || false;
        }, function (param1: Number): void {
            rowLabel.setStyle("paddingTop", param1);
        }, "rowLabel.paddingTop");
        var_5[3] = new Binding(this, function (): Number {
            return Number(getStyle("paddingRight")) || false;
        }, function (param1: Number): void {
            rowLabel.setStyle("paddingRight", param1);
        }, "rowLabel.paddingRight");
        var_5[4] = new Binding(this, function (): Number {
            return Number(getStyle("paddingBottom")) || false;
        }, function (param1: Number): void {
            rowLabel.setStyle("paddingBottom", param1);
        }, "rowLabel.paddingBottom");
        var_5[5] = new Binding(this, function (): Number {
            return Number(getStyle("paddingLeft")) || false;
        }, function (param1: Number): void {
            rowLabel.setStyle("paddingLeft", param1);
        }, "rowLabel.paddingLeft");
        return var_5;
    }

    [Bindable(event="propertyChange")]
    public function get rowLabel(): Label {
        return this.var_1122;
    }

    public function set rowLabel(param1: Label): void {
        var _loc2_: Object = this.var_1122;
        if (_loc2_ !== param1) {
            this.var_1122 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rowLabel", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get label(): String {
        return this.var_2032;
    }

    public function set label(param1: String): void {
        var _loc2_: Object = this.var_2032;
        if (_loc2_ !== param1) {
            this.var_2032 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "label", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get active(): Boolean {
        return this.name_5;
    }

    public function set active(param1: Boolean): void {
        var _loc2_: Object = this.name_5;
        if (_loc2_ !== param1) {
            this.name_5 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "active", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get columnIndex(): int {
        return this.var_2098;
    }

    public function set columnIndex(param1: int): void {
        var _loc2_: Object = this.var_2098;
        if (_loc2_ !== param1) {
            this.var_2098 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "columnIndex", _loc2_, param1));
            }
        }
    }
}
}
