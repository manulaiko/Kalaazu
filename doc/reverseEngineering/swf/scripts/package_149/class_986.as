package package_149 {

import flash.utils.getDefinitionByName;

import mx.binding.Binding;
import mx.binding.BindingManager;
import mx.binding.IBindingClient;
import mx.binding.IWatcherSetupUtil2;
import mx.core.IFlexModuleFactory;
import mx.core.mx_internal;

import net.bigpoint.darkorbit.mvc.questWindow.model.vo.QuestListItemVO;

import spark.components.supportClasses.ItemRenderer;

public class class_986 extends ItemRenderer implements IBindingClient {

    private static var _watcherSetupUtil: IWatcherSetupUtil2;


    public var _QuestListItemRenderer_QuestListItemRendererContent1: class_1509;

    private var __moduleFactoryInitialized: Boolean = false;

    mx_internal var _bindings: Array;

    mx_internal var _watchers: Array;

    mx_internal var _bindingsByDestination: Object;

    mx_internal var _bindingsBeginWithWord: Object;

    public function class_986() {
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
        bindings = this.method_3955();
        watchers = [];
        target = this;
        if (_watcherSetupUtil == null) {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_questWindow_view_questsSection_renderers_questList_QuestListItemRendererWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
        }
        _watcherSetupUtil.setup(this, function (param1: String): * {
            return target[param1];
        }, function (param1: String): * {
            return class_986[param1];
        }, bindings, watchers);
        mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
        mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
        this.mxmlContent = [this.method_5359()];
        var_1 = 0;
        while (var_1 < bindings.length) {
            Binding(bindings[var_1]).execute();
            var_1++;
        }
    }

    public static function set watcherSetupUtil(param1: IWatcherSetupUtil2): void {
        class_986._watcherSetupUtil = param1;
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

    [Bindable(event="dataChange")]
    private function get questListItemVO(): QuestListItemVO {
        return data as QuestListItemVO;
    }

    private function method_5359(): class_1509 {
        var _loc1_: class_1509 = new class_1509();
        _loc1_.percentHeight = 100;
        _loc1_.percentWidth = 100;
        _loc1_.id = "_QuestListItemRenderer_QuestListItemRendererContent1";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this._QuestListItemRenderer_QuestListItemRendererContent1 = _loc1_;
        BindingManager.executeBindings(this, "_QuestListItemRenderer_QuestListItemRendererContent1", this._QuestListItemRenderer_QuestListItemRendererContent1);
        return _loc1_;
    }

    private function method_3955(): Array {
        var var_5: Array = [];
        var_5[0] = new Binding(this, function (): QuestListItemVO {
            return questListItemVO;
        }, null, "_QuestListItemRenderer_QuestListItemRendererContent1.questListItemVO");
        return var_5;
    }
}
}
