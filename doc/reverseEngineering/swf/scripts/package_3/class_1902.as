package package_3 {

import flash.utils.getDefinitionByName;

import mx.binding.Binding;
import mx.binding.BindingManager;
import mx.binding.IBindingClient;
import mx.binding.IWatcherSetupUtil2;
import mx.collections.ArrayList;
import mx.core.ClassFactory;
import mx.core.IFlexModuleFactory;
import mx.core.IToolTip;
import mx.core.ScrollPolicy;
import mx.core.mx_internal;

import net.bigpoint.as3toolbox.bplocale.class_88;

import package_151.class_989;

import package_76.class_1110;

import package_8.VectorCollection;

import package_92.class_996;

import spark.components.DataGrid;
import spark.components.gridClasses.GridColumn;

public class class_1902 extends DataGrid implements IBindingClient, IToolTip {

    private static var _watcherSetupUtil: IWatcherSetupUtil2;


    public var _TDMResultWindowToolTip_GridColumn1: GridColumn;

    public var _TDMResultWindowToolTip_GridColumn2: GridColumn;

    private var __moduleFactoryInitialized: Boolean = false;

    private var _rewards: class_989;

    mx_internal var _bindings: Array;

    mx_internal var _watchers: Array;

    mx_internal var _bindingsByDestination: Object;

    mx_internal var _bindingsBeginWithWord: Object;

    public function class_1902() {
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
        bindings = this.method_1887();
        watchers = [];
        target = this;
        if (_watcherSetupUtil == null) {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_tdm_matchresultWindow_view_window_components_tooltip_TDMResultWindowToolTipWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
        }
        _watcherSetupUtil.setup(this, function (param1: String): * {
            return target[param1];
        }, function (param1: String): * {
            return class_1902[param1];
        }, bindings, watchers);
        mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
        mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
        this.styleName = "skinnedListTDM";
        this.variableRowHeight = true;
        this.percentWidth = 100;
        this.percentHeight = 100;
        this.columns = this.method_2135();
        var_1 = 0;
        while (var_1 < bindings.length) {
            Binding(bindings[var_1]).execute();
            var_1++;
        }
    }

    public static function set watcherSetupUtil(param1: IWatcherSetupUtil2): void {
        class_1902._watcherSetupUtil = param1;
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

    public function get text(): String {
        return "";
    }

    public function set text(param1: String): void {
    }

    public function setTitle(param1: String): void {
        (skin as class_2).headerText = param1;
    }

    public function method_4749(param1: String): void {
        (skin as class_2).method_4861 = param1;
    }

    public function set rewards(param1: class_989): void {
        this._rewards = param1;
        dataProvider = new VectorCollection(this._rewards.method_4087);
    }

    private function method_2135(): ArrayList {
        var _loc1_: ArrayList = new ArrayList();
        _loc1_.source = [this.method_2932(), this.method_2374()];
        return _loc1_;
    }

    private function method_2932(): GridColumn {
        var _loc1_: GridColumn = new GridColumn();
        _loc1_.dataField = "stats";
        _loc1_.minWidth = 150;
        _loc1_.itemRenderer = this.method_2355();
        this._TDMResultWindowToolTip_GridColumn1 = _loc1_;
        BindingManager.executeBindings(this, "_TDMResultWindowToolTip_GridColumn1", this._TDMResultWindowToolTip_GridColumn1);
        return _loc1_;
    }

    private function method_2355(): ClassFactory {
        var _loc1_: ClassFactory = new ClassFactory();
        _loc1_.generator = class_2290;
        return _loc1_;
    }

    private function method_2374(): GridColumn {
        var _loc1_: GridColumn = new GridColumn();
        _loc1_.dataField = "hero";
        _loc1_.minWidth = 150;
        _loc1_.itemRenderer = this.method_1479();
        this._TDMResultWindowToolTip_GridColumn2 = _loc1_;
        BindingManager.executeBindings(this, "_TDMResultWindowToolTip_GridColumn2", this._TDMResultWindowToolTip_GridColumn2);
        return _loc1_;
    }

    private function method_1479(): ClassFactory {
        var _loc1_: ClassFactory = new ClassFactory();
        _loc1_.generator = class_2291;
        return _loc1_;
    }

    private function method_1887(): Array {
        var var_5: Array = [];
        var_5[0] = new Binding(this, function (): String {
            var _loc1_: * = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, function (param1: String): void {
            this.setStyle("verticalScrollPolicy", param1);
        }, "this.verticalScrollPolicy");
        var_5[1] = new Binding(this, function (): String {
            var _loc1_: * = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, function (param1: String): void {
            this.setStyle("horizontalScrollPolicy", param1);
        }, "this.horizontalScrollPolicy");
        var_5[2] = new Binding(this, function (): String {
            var _loc1_: * = class_1110.method_5670(class_996.const_1166, class_88.getItem(class_996.const_1139));
            return _loc1_ == undefined ? null : String(_loc1_);
        }, null, "_TDMResultWindowToolTip_GridColumn1.headerText");
        var_5[3] = new Binding(this, function (): String {
            var _loc1_: * = class_1110.method_5670(class_996.const_1166, class_88.getItem(class_996.const_610));
            return _loc1_ == undefined ? null : String(_loc1_);
        }, null, "_TDMResultWindowToolTip_GridColumn2.headerText");
        return var_5;
    }
}
}
