package package_168 {

import flash.utils.getDefinitionByName;

import mx.binding.Binding;
import mx.binding.BindingManager;
import mx.binding.IBindingClient;
import mx.binding.IWatcherSetupUtil2;
import mx.collections.ArrayList;
import mx.collections.IList;
import mx.core.ClassFactory;
import mx.core.IFlexModuleFactory;
import mx.core.mx_internal;
import mx.events.PropertyChangeEvent;

import package_20.class_1545;
import package_20.class_1546;
import package_20.class_1547;

import package_76.class_1110;

import spark.components.DataGrid;
import spark.components.gridClasses.GridColumn;

public class class_1038 extends DataGrid implements IBindingClient {

    private static var _watcherSetupUtil: IWatcherSetupUtil2;


    public var _JackpotDataGrid_GridColumn1: GridColumn;

    public var _JackpotDataGrid_GridColumn2: GridColumn;

    public var _JackpotDataGrid_GridColumn3: GridColumn;

    private var __moduleFactoryInitialized: Boolean = false;

    private var var_3087: String;

    private var var_3268: String;

    private var var_4966: String;

    mx_internal var _bindings: Array;

    mx_internal var _watchers: Array;

    mx_internal var _bindingsByDestination: Object;

    mx_internal var _bindingsBeginWithWord: Object;

    public function class_1038() {
        var bindings: Array;
        var watchers: Array;
        var var_1: uint;
        var target: Object = null;
        var watcherSetupUtilClass: Object = null;
        this.var_3087 = class_1110.method_5670(10066329, "Stats");
        this.var_3268 = class_1110.method_5670(16509188, "opponent");
        this.var_4966 = class_1110.method_5670(16509188, "hero");
        this.mx_internal::_bindings = [];
        this.mx_internal::_watchers = [];
        this.mx_internal::_bindingsByDestination = {};
        this.mx_internal::_bindingsBeginWithWord = {};
        super();
        bindings = this.method_1774();
        watchers = [];
        target = this;
        if (_watcherSetupUtil == null) {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_jackpotBattle_resultWin_view_components_JackpotDataGridWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
        }
        _watcherSetupUtil.setup(this, function (param1: String): * {
            return target[param1];
        }, function (param1: String): * {
            return class_1038[param1];
        }, bindings, watchers);
        mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
        mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
        this.columns = this.method_3395();
        var_1 = 0;
        while (var_1 < bindings.length) {
            Binding(bindings[var_1]).execute();
            var_1++;
        }
    }

    public static function set watcherSetupUtil(param1: IWatcherSetupUtil2): void {
        class_1038._watcherSetupUtil = param1;
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

    public function set method_3150(param1: String): void {
        this._statsHeadline = param1;
    }

    public function set method_4588(param1: String): void {
        this._opponentHeadline = param1;
    }

    public function set method_1511(param1: String): void {
        this._heroHeadline = param1;
    }

    override public function set dataProvider(param1: IList): void {
        super.dataProvider = param1;
    }

    private function method_3395(): ArrayList {
        var _loc1_: ArrayList = new ArrayList();
        _loc1_.source = [this.method_2260(), this.method_5315(), this.method_5328()];
        return _loc1_;
    }

    private function method_2260(): GridColumn {
        var _loc1_: GridColumn = new GridColumn();
        _loc1_.dataField = "stats";
        _loc1_.itemRenderer = this.method_3633();
        this._JackpotDataGrid_GridColumn1 = _loc1_;
        BindingManager.executeBindings(this, "_JackpotDataGrid_GridColumn1", this._JackpotDataGrid_GridColumn1);
        return _loc1_;
    }

    private function method_3633(): ClassFactory {
        var _loc1_: ClassFactory = new ClassFactory();
        _loc1_.generator = class_1545;
        return _loc1_;
    }

    private function method_5315(): GridColumn {
        var _loc1_: GridColumn = new GridColumn();
        _loc1_.dataField = "hero";
        _loc1_.itemRenderer = this.method_772();
        this._JackpotDataGrid_GridColumn2 = _loc1_;
        BindingManager.executeBindings(this, "_JackpotDataGrid_GridColumn2", this._JackpotDataGrid_GridColumn2);
        return _loc1_;
    }

    private function method_772(): ClassFactory {
        var _loc1_: ClassFactory = new ClassFactory();
        _loc1_.generator = class_1547;
        return _loc1_;
    }

    private function method_5328(): GridColumn {
        var _loc1_: GridColumn = new GridColumn();
        _loc1_.dataField = "opponent";
        _loc1_.itemRenderer = this.method_3254();
        this._JackpotDataGrid_GridColumn3 = _loc1_;
        BindingManager.executeBindings(this, "_JackpotDataGrid_GridColumn3", this._JackpotDataGrid_GridColumn3);
        return _loc1_;
    }

    private function method_3254(): ClassFactory {
        var _loc1_: ClassFactory = new ClassFactory();
        _loc1_.generator = class_1546;
        return _loc1_;
    }

    private function method_1774(): Array {
        var var_5: Array = [];
        var_5[0] = new Binding(this, function (): String {
            var _loc1_: * = _statsHeadline;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, null, "_JackpotDataGrid_GridColumn1.headerText");
        var_5[1] = new Binding(this, function (): String {
            var _loc1_: * = _heroHeadline;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, null, "_JackpotDataGrid_GridColumn2.headerText");
        var_5[2] = new Binding(this, function (): String {
            var _loc1_: * = _opponentHeadline;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, null, "_JackpotDataGrid_GridColumn3.headerText");
        return var_5;
    }

    [Bindable(event="propertyChange")]
    private function get _statsHeadline(): String {
        return this.var_3087;
    }

    private function set _statsHeadline(param1: String): void {
        var _loc2_: Object = this.var_3087;
        if (_loc2_ !== param1) {
            this.var_3087 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_statsHeadline", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    private function get _opponentHeadline(): String {
        return this.var_3268;
    }

    private function set _opponentHeadline(param1: String): void {
        var _loc2_: Object = this.var_3268;
        if (_loc2_ !== param1) {
            this.var_3268 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_opponentHeadline", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    private function get _heroHeadline(): String {
        return this.var_4966;
    }

    private function set _heroHeadline(param1: String): void {
        var _loc2_: Object = this.var_4966;
        if (_loc2_ !== param1) {
            this.var_4966 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_heroHeadline", _loc2_, param1));
            }
        }
    }
}
}
