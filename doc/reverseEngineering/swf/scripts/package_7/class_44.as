package package_7 {

import flash.utils.getDefinitionByName;

import mx.binding.Binding;
import mx.binding.BindingManager;
import mx.binding.IBindingClient;
import mx.binding.IWatcherSetupUtil2;
import mx.core.IFlexModuleFactory;
import mx.core.mx_internal;
import mx.events.PropertyChangeEvent;

import package_12.class_76;

import spark.components.gridClasses.GridItemRenderer;

public class class_44 extends GridItemRenderer implements IBindingClient {

    private static var _watcherSetupUtil: IWatcherSetupUtil2;


    public var _HighscoreTableSkinInnerClass4_HighscoreTableSkinableHeaderContent1: class_76;

    private var _88844982outerDocument: class_8;

    private var __moduleFactoryInitialized: Boolean = false;

    mx_internal var _bindings: Array;

    mx_internal var _watchers: Array;

    mx_internal var _bindingsByDestination: Object;

    mx_internal var _bindingsBeginWithWord: Object;

    public function class_44() {
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
        bindings = this.method_2184();
        watchers = [];
        target = this;
        if (_watcherSetupUtil == null) {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_questWindow_view_challengesSection_skins_HighscoreTableSkinInnerClass4WatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
        }
        _watcherSetupUtil.setup(this, function (param1: String): * {
            return target[param1];
        }, function (param1: String): * {
            return class_44[param1];
        }, bindings, watchers);
        mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
        mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
        this.mxmlContent = [this.method_6394()];
        var_1 = 0;
        while (var_1 < bindings.length) {
            Binding(bindings[var_1]).execute();
            var_1++;
        }
    }

    public static function set watcherSetupUtil(param1: IWatcherSetupUtil2): void {
        class_44._watcherSetupUtil = param1;
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

    private function method_6394(): class_76 {
        var _loc1_: class_76 = new class_76();
        _loc1_.styleName = "skinnedDataGridHeader";
        _loc1_.percentWidth = 100;
        _loc1_.id = "_HighscoreTableSkinInnerClass4_HighscoreTableSkinableHeaderContent1";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this._HighscoreTableSkinInnerClass4_HighscoreTableSkinableHeaderContent1 = _loc1_;
        BindingManager.executeBindings(this, "_HighscoreTableSkinInnerClass4_HighscoreTableSkinableHeaderContent1", this._HighscoreTableSkinInnerClass4_HighscoreTableSkinableHeaderContent1);
        return _loc1_;
    }

    private function method_2184(): Array {
        var var_5: Array = [];
        var_5[0] = new Binding(this, function (): String {
            var _loc1_: * = column.headerText;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, null, "_HighscoreTableSkinInnerClass4_HighscoreTableSkinableHeaderContent1.headerText");
        var_5[1] = new Binding(this, function (): int {
            return column.columnIndex;
        }, null, "_HighscoreTableSkinInnerClass4_HighscoreTableSkinableHeaderContent1.columnIndex");
        return var_5;
    }

    [Bindable(event="propertyChange")]
    public function get outerDocument(): class_8 {
        return this._88844982outerDocument;
    }

    public function set outerDocument(param1: class_8): void {
        var _loc2_: Object = this._88844982outerDocument;
        if (_loc2_ !== param1) {
            this._88844982outerDocument = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "outerDocument", _loc2_, param1));
            }
        }
    }
}
}
