package package_147 {

import flash.utils.getDefinitionByName;

import mx.binding.Binding;
import mx.binding.BindingManager;
import mx.binding.IBindingClient;
import mx.binding.IWatcherSetupUtil2;
import mx.collections.ArrayList;
import mx.core.IFlexModuleFactory;
import mx.core.mx_internal;
import mx.events.FlexEvent;
import mx.events.PropertyChangeEvent;
import mx.events.ResizeEvent;

import net.bigpoint.as3toolbox.bplocale.class_88;

import spark.components.DataGrid;
import spark.components.gridClasses.GridColumn;

public class class_1507 extends DataGrid implements IBindingClient {

    private static var _watcherSetupUtil: IWatcherSetupUtil2;


    private var var_3636: GridColumn;

    private var var_981: GridColumn;

    private var var_1032: GridColumn;

    private var var_3266: GridColumn;

    private var __moduleFactoryInitialized: Boolean = false;

    mx_internal var _bindings: Array;

    mx_internal var _watchers: Array;

    mx_internal var _bindingsByDestination: Object;

    mx_internal var _bindingsBeginWithWord: Object;

    public function class_1507() {
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
        bindings = this.method_2007();
        watchers = [];
        target = this;
        if (_watcherSetupUtil == null) {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_questWindow_view_challengesSection_components_HighscoreDataGridWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
        }
        _watcherSetupUtil.setup(this, function (param1: String): * {
            return target[param1];
        }, function (param1: String): * {
            return class_1507[param1];
        }, bindings, watchers);
        mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
        mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
        this.resizableColumns = false;
        this.columns = this.method_5040();
        this.addEventListener("creationComplete", this.method_1551);
        this.addEventListener("resize", this.method_1995);
        var_1 = 0;
        while (var_1 < bindings.length) {
            Binding(bindings[var_1]).execute();
            var_1++;
        }
    }

    public static function set watcherSetupUtil(param1: IWatcherSetupUtil2): void {
        class_1507._watcherSetupUtil = param1;
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
        this.resizeHandler();
    }

    private function resizeHandler(param1: ResizeEvent = null): void {
        this.column1.width = Number(this.width) * 0.08;
        this.column2.width = Number(this.width) * 0.35;
        this.column3.width = Number(this.width) * 0.3;
        this.column4.width = Number(this.width) * 0.265;
    }

    private function method_5040(): ArrayList {
        var _loc1_: ArrayList = new ArrayList();
        _loc1_.source = [this.method_610(), this.method_5168(), this.method_4493(), this.method_3069()];
        return _loc1_;
    }

    private function method_610(): GridColumn {
        var _loc1_: GridColumn = new GridColumn();
        _loc1_.dataField = "position";
        _loc1_.headerText = "#";
        this.column1 = _loc1_;
        BindingManager.executeBindings(this, "column1", this.column1);
        return _loc1_;
    }

    private function method_5168(): GridColumn {
        var _loc1_: GridColumn = new GridColumn();
        _loc1_.dataField = "playername";
        this.column2 = _loc1_;
        BindingManager.executeBindings(this, "column2", this.column2);
        return _loc1_;
    }

    private function method_4493(): GridColumn {
        var _loc1_: GridColumn = new GridColumn();
        _loc1_.dataField = "points";
        this.column3 = _loc1_;
        BindingManager.executeBindings(this, "column3", this.column3);
        return _loc1_;
    }

    private function method_3069(): GridColumn {
        var _loc1_: GridColumn = new GridColumn();
        _loc1_.dataField = "difference";
        this.column4 = _loc1_;
        BindingManager.executeBindings(this, "column4", this.column4);
        return _loc1_;
    }

    public function method_1551(param1: FlexEvent): void {
        this.creationCompleteHandler(param1);
    }

    public function method_1995(param1: ResizeEvent): void {
        this.resizeHandler(param1);
    }

    private function method_2007(): Array {
        var var_5: Array = [];
        var_5[0] = new Binding(this, function (): String {
            var _loc1_: * = class_88.getItem("label_header_playername");
            return _loc1_ == undefined ? null : String(_loc1_);
        }, null, "column2.headerText");
        var_5[1] = new Binding(this, function (): String {
            var _loc1_: * = class_88.getItem("label_header_points");
            return _loc1_ == undefined ? null : String(_loc1_);
        }, null, "column3.headerText");
        var_5[2] = new Binding(this, function (): String {
            var _loc1_: * = class_88.getItem("label_header_difference");
            return _loc1_ == undefined ? null : String(_loc1_);
        }, null, "column4.headerText");
        return var_5;
    }

    [Bindable(event="propertyChange")]
    public function get column1(): GridColumn {
        return this.var_3636;
    }

    public function set column1(param1: GridColumn): void {
        var _loc2_: Object = this.var_3636;
        if (_loc2_ !== param1) {
            this.var_3636 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "column1", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get column2(): GridColumn {
        return this.var_981;
    }

    public function set column2(param1: GridColumn): void {
        var _loc2_: Object = this.var_981;
        if (_loc2_ !== param1) {
            this.var_981 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "column2", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get column3(): GridColumn {
        return this.var_1032;
    }

    public function set column3(param1: GridColumn): void {
        var _loc2_: Object = this.var_1032;
        if (_loc2_ !== param1) {
            this.var_1032 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "column3", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get column4(): GridColumn {
        return this.var_3266;
    }

    public function set column4(param1: GridColumn): void {
        var _loc2_: Object = this.var_3266;
        if (_loc2_ !== param1) {
            this.var_3266 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "column4", _loc2_, param1));
            }
        }
    }
}
}
