package package_12 {

import flash.events.Event;
import flash.utils.getDefinitionByName;

import mx.binding.Binding;
import mx.binding.BindingManager;
import mx.binding.IBindingClient;
import mx.binding.IWatcherSetupUtil2;
import mx.core.IFlexModuleFactory;
import mx.core.mx_internal;
import mx.events.PropertyChangeEvent;

import net.bigpoint.darkorbit.mvc.questWindow.model.vo.HighscoreVO;

import spark.components.gridClasses.GridItemRenderer;

public class class_49 extends GridItemRenderer implements IBindingClient {

    private static var _watcherSetupUtil: IWatcherSetupUtil2;


    private var var_846: class_77;

    private var __moduleFactoryInitialized: Boolean = false;

    mx_internal var _bindings: Array;

    mx_internal var _watchers: Array;

    mx_internal var _bindingsByDestination: Object;

    mx_internal var _bindingsBeginWithWord: Object;

    public function class_49() {
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
        bindings = this.method_4222();
        watchers = [];
        target = this;
        if (_watcherSetupUtil == null) {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_questWindow_view_challengesSection_renderers_HighscoreCellRendererWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
        }
        _watcherSetupUtil.setup(this, function (param1: String): * {
            return target[param1];
        }, function (param1: String): * {
            return class_49[param1];
        }, bindings, watchers);
        mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
        mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
        this.clipAndEnableScrolling = true;
        this.mxmlContent = [this.method_1068()];
        var_1 = 0;
        while (var_1 < bindings.length) {
            Binding(bindings[var_1]).execute();
            var_1++;
        }
    }

    public static function set watcherSetupUtil(param1: IWatcherSetupUtil2): void {
        class_49._watcherSetupUtil = param1;
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

    private function method_1328(): void {
        this.rendererContent.method_1328();
    }

    private function method_1068(): class_77 {
        var _loc1_: class_77 = new class_77();
        _loc1_.styleName = "skinnedDataGridRow";
        _loc1_.percentWidth = 105555550;
        _loc1_.addEventListener("render", this.method_4855);
        _loc1_.id = "rendererContent";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.rendererContent = _loc1_;
        BindingManager.executeBindings(this, "rendererContent", this.rendererContent);
        return _loc1_;
    }

    public function method_4855(param1: Event): void {
        this.method_1328();
    }

    private function method_4222(): Array {
        var var_5: Array = [];
        var_5[0] = new Binding(this, function (): String {
            var _loc1_: * = HighscoreVO(data).getField(column.dataField);
            return _loc1_ == undefined ? null : String(_loc1_);
        }, null, "rendererContent.label");
        var_5[1] = new Binding(this, function (): Boolean {
            return HighscoreVO(data).active;
        }, null, "rendererContent.active");
        var_5[2] = new Binding(this, function (): int {
            return column.columnIndex;
        }, null, "rendererContent.columnIndex");
        var_5[3] = new Binding(this, function (): HighscoreVO {
            return HighscoreVO(data);
        }, null, "rendererContent.dataVO");
        return var_5;
    }

    [Bindable(event="propertyChange")]
    public function get rendererContent(): class_77 {
        return this.var_846;
    }

    public function set rendererContent(param1: class_77): void {
        var _loc2_: Object = this.var_846;
        if (_loc2_ !== param1) {
            this.var_846 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rendererContent", _loc2_, param1));
            }
        }
    }
}
}
