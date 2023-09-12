package package_56 {

import flash.utils.getDefinitionByName;

import mx.binding.Binding;
import mx.binding.BindingManager;
import mx.binding.IBindingClient;
import mx.binding.IWatcherSetupUtil2;
import mx.controls.Text;
import mx.core.DeferredInstanceFromFunction;
import mx.core.IFlexModuleFactory;
import mx.core.mx_internal;
import mx.events.PropertyChangeEvent;

import net.bigpoint.darkorbit.class_18;
import net.bigpoint.darkorbit.mvc.common.view.components.DOViewContainerBase;
import net.bigpoint.darkorbit.mvc.common.view.components.DOWindow;
import net.bigpoint.darkorbit.mvc.common.view.skins.DOOuterViewContainerSkin;

import spark.components.Group;
import spark.components.VGroup;
import spark.components.VideoPlayer;
import spark.layouts.HorizontalAlign;

public class class_152 extends DOWindow implements IBindingClient {

    private static var _watcherSetupUtil: IWatcherSetupUtil2;


    public var _HelpVideoPopUp_Text1: Text;

    public var _HelpVideoPopUp_VGroup1: VGroup;

    public var _HelpVideoPopUp_VGroup2: VGroup;

    public var _HelpVideoPopUp_VideoPlayer1: VideoPlayer;

    private var __moduleFactoryInitialized: Boolean = false;

    private var var_1337: String;

    private var var_79: String;

    mx_internal var _bindings: Array;

    mx_internal var _watchers: Array;

    mx_internal var _bindingsByDestination: Object;

    mx_internal var _bindingsBeginWithWord: Object;

    public function class_152() {
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
        bindings = this.method_3530();
        watchers = [];
        target = this;
        if (_watcherSetupUtil == null) {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_helpwindow_view_HelpVideoPopUpWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
        }
        _watcherSetupUtil.setup(this, function (param1: String): * {
            return target[param1];
        }, function (param1: String): * {
            return class_152[param1];
        }, bindings, watchers);
        mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
        mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
        this.width = 600;
        this.height = 400;
        this.styleName = "questWindow";
        this.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_6080);
        var_1 = 0;
        while (var_1 < bindings.length) {
            Binding(bindings[var_1]).execute();
            var_1++;
        }
    }

    public static function set watcherSetupUtil(param1: IWatcherSetupUtil2): void {
        class_152._watcherSetupUtil = param1;
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

    public function set method_3597(param1: String): void {
        this._helpVideoURL = param1;
    }

    public function set text(param1: String): void {
        this._text = param1;
    }

    private function method_6080(): Array {
        return [this.method_3620()];
    }

    private function method_3620(): VGroup {
        var _loc1_: VGroup = new VGroup();
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 100;
        _loc1_.mxmlContent = [this.method_2552()];
        _loc1_.id = "_HelpVideoPopUp_VGroup1";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this._HelpVideoPopUp_VGroup1 = _loc1_;
        BindingManager.executeBindings(this, "_HelpVideoPopUp_VGroup1", this._HelpVideoPopUp_VGroup1);
        return _loc1_;
    }

    private function method_2552(): VGroup {
        var _loc1_: VGroup = new VGroup();
        _loc1_.percentWidth = 95;
        _loc1_.percentHeight = 90;
        _loc1_.mxmlContent = [this.method_5118(), this.method_630()];
        _loc1_.id = "_HelpVideoPopUp_VGroup2";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this._HelpVideoPopUp_VGroup2 = _loc1_;
        BindingManager.executeBindings(this, "_HelpVideoPopUp_VGroup2", this._HelpVideoPopUp_VGroup2);
        return _loc1_;
    }

    private function method_5118(): Group {
        var _loc1_: Group = new Group();
        _loc1_.percentWidth = 100;
        _loc1_.mxmlContent = [this.method_3661(), this.method_3328()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_3661(): DOViewContainerBase {
        var _loc1_: DOViewContainerBase = new DOViewContainerBase();
        _loc1_.styleName = "questWindowOuter";
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 100;
        _loc1_.setStyle("skinClass", DOOuterViewContainerSkin);
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_3328(): Text {
        var _loc1_: Text = new Text();
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 100;
        _loc1_.setStyle("fontSize", 11);
        _loc1_.setStyle("paddingTop", 4);
        _loc1_.setStyle("paddingBottom", 4);
        _loc1_.setStyle("paddingLeft", 6);
        _loc1_.setStyle("paddingRight", 6);
        _loc1_.id = "_HelpVideoPopUp_Text1";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this._HelpVideoPopUp_Text1 = _loc1_;
        BindingManager.executeBindings(this, "_HelpVideoPopUp_Text1", this._HelpVideoPopUp_Text1);
        return _loc1_;
    }

    private function method_630(): VideoPlayer {
        var _loc1_: VideoPlayer = new VideoPlayer();
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 100;
        _loc1_.loop = true;
        _loc1_.scaleMode = "letterbox";
        _loc1_.id = "_HelpVideoPopUp_VideoPlayer1";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this._HelpVideoPopUp_VideoPlayer1 = _loc1_;
        BindingManager.executeBindings(this, "_HelpVideoPopUp_VideoPlayer1", this._HelpVideoPopUp_VideoPlayer1);
        return _loc1_;
    }

    private function method_3530(): Array {
        var var_5: Array = [];
        var_5[0] = new Binding(this, function (): String {
            var _loc1_: * = HorizontalAlign.CENTER;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, null, "_HelpVideoPopUp_VGroup1.horizontalAlign");
        var_5[1] = new Binding(this, function (): String {
            var _loc1_: * = HorizontalAlign.CENTER;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, null, "_HelpVideoPopUp_VGroup2.horizontalAlign");
        var_5[2] = new Binding(this, function (): String {
            var _loc1_: * = _text;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, null, "_HelpVideoPopUp_Text1.text");
        var_5[3] = new Binding(this, function (): String {
            var _loc1_: * = class_18.const_1851;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, function (param1: String): void {
            _HelpVideoPopUp_Text1.setStyle("fontFamily", param1);
        }, "_HelpVideoPopUp_Text1.fontFamily");
        var_5[4] = new Binding(this, function (): Object {
            return _helpVideoURL;
        }, null, "_HelpVideoPopUp_VideoPlayer1.source");
        var_5[5] = new Binding(this, function (): uint {
            return class_18.WHITE;
        }, function (param1: uint): void {
            _HelpVideoPopUp_VideoPlayer1.setStyle("color", param1);
        }, "_HelpVideoPopUp_VideoPlayer1.color");
        return var_5;
    }

    [Bindable(event="propertyChange")]
    private function get _helpVideoURL(): String {
        return this.var_1337;
    }

    private function set _helpVideoURL(param1: String): void {
        var _loc2_: Object = this.var_1337;
        if (_loc2_ !== param1) {
            this.var_1337 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_helpVideoURL", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    private function get _text(): String {
        return this.var_79;
    }

    private function set _text(param1: String): void {
        var _loc2_: Object = this.var_79;
        if (_loc2_ !== param1) {
            this.var_79 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_text", _loc2_, param1));
            }
        }
    }
}
}
