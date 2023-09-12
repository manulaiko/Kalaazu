package package_166 {

import flash.events.MouseEvent;
import flash.utils.getDefinitionByName;

import mx.binding.Binding;
import mx.binding.BindingManager;
import mx.binding.IBindingClient;
import mx.binding.IWatcherSetupUtil2;
import mx.controls.ProgressBar;
import mx.core.DeferredInstanceFromFunction;
import mx.core.IFlexModuleFactory;
import mx.core.mx_internal;
import mx.events.FlexEvent;

import net.bigpoint.darkorbit.mvc.common.view.components.DOButtonBase;
import net.bigpoint.darkorbit.mvc.common.view.skins.DOButtonBaseSkin;
import net.bigpoint.darkorbit.mvc.common.view.skins.DOViewContainerSkin;

import package_250.class_1539;
import package_250.class_1540;

import spark.components.Group;
import spark.components.HGroup;
import spark.components.Label;
import spark.components.SkinnableContainer;
import spark.components.VGroup;

public class class_1026 extends class_1025 implements IBindingClient {

    private static var _watcherSetupUtil: IWatcherSetupUtil2;


    private var __moduleFactoryInitialized: Boolean = false;

    mx_internal var _bindings: Array;

    mx_internal var _watchers: Array;

    mx_internal var _bindingsByDestination: Object;

    mx_internal var _bindingsBeginWithWord: Object;

    public function class_1026() {
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
        bindings = this.method_5608();
        watchers = [];
        target = this;
        if (_watcherSetupUtil == null) {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_battlestationswindow_view_ratings_components_RatingsViewWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
        }
        _watcherSetupUtil.setup(this, function (param1: String): * {
            return target[param1];
        }, function (param1: String): * {
            return class_1026[param1];
        }, bindings, watchers);
        mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
        mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
        this.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_4099);
        this.addEventListener("creationComplete", this.method_362);
        var_1 = 0;
        while (var_1 < bindings.length) {
            Binding(bindings[var_1]).execute();
            var_1++;
        }
    }

    public static function set watcherSetupUtil(param1: IWatcherSetupUtil2): void {
        class_1026._watcherSetupUtil = param1;
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

    private function method_4099(): Array {
        return [this.method_1510()];
    }

    private function method_1510(): Group {
        var _loc1_: Group = new Group();
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 100;
        _loc1_.horizontalCenter = 0;
        _loc1_.verticalCenter = 0;
        _loc1_.mxmlContent = [this.method_3337()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_3337(): VGroup {
        var _loc1_: VGroup = new VGroup();
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 100;
        _loc1_.horizontalCenter = 0;
        _loc1_.mxmlContent = [this.method_5852(), this.method_5466(), this.method_2153(), this.method_4390()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_5852(): Label {
        var _loc1_: Label = new Label();
        _loc1_.setStyle("fontSize", 13);
        _loc1_.setStyle("fontFamily", "EurostileTHea");
        _loc1_.setStyle("color", 16763904);
        _loc1_.setStyle("paddingBottom", -10);
        _loc1_.id = "ratingsTitleLabel";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        ratingsTitleLabel = _loc1_;
        BindingManager.executeBindings(this, "ratingsTitleLabel", ratingsTitleLabel);
        return _loc1_;
    }

    private function method_5466(): SkinnableContainer {
        var _loc1_: SkinnableContainer = new SkinnableContainer();
        _loc1_.styleName = "ratingsBackground";
        _loc1_.width = 221;
        _loc1_.height = 81;
        _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_478);
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_478(): Array {
        return [this.method_4811()];
    }

    private function method_4811(): HGroup {
        var _loc1_: HGroup = new HGroup();
        _loc1_.percentWidth = 100;
        _loc1_.gap = 0;
        _loc1_.horizontalCenter = 0;
        _loc1_.left = 4;
        _loc1_.mxmlContent = [this.method_4096(), this.method_1379(), this.method_1647(), this.method_4667(), this.method_5585(), this.method_2897()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_4096(): class_1542 {
        var _loc1_: class_1542 = new class_1542();
        _loc1_.id = "attackRating";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        attackRating = _loc1_;
        BindingManager.executeBindings(this, "attackRating", attackRating);
        return _loc1_;
    }

    private function method_1379(): class_1542 {
        var _loc1_: class_1542 = new class_1542();
        _loc1_.id = "defenceRating";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        defenceRating = _loc1_;
        BindingManager.executeBindings(this, "defenceRating", defenceRating);
        return _loc1_;
    }

    private function method_1647(): class_1542 {
        var _loc1_: class_1542 = new class_1542();
        _loc1_.id = "repairRating";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        repairRating = _loc1_;
        BindingManager.executeBindings(this, "repairRating", repairRating);
        return _loc1_;
    }

    private function method_4667(): class_1542 {
        var _loc1_: class_1542 = new class_1542();
        _loc1_.id = "honourRating";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        honourRating = _loc1_;
        BindingManager.executeBindings(this, "honourRating", honourRating);
        return _loc1_;
    }

    private function method_5585(): class_1542 {
        var _loc1_: class_1542 = new class_1542();
        _loc1_.id = "epRating";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        epRating = _loc1_;
        BindingManager.executeBindings(this, "epRating", epRating);
        return _loc1_;
    }

    private function method_2897(): class_1542 {
        var _loc1_: class_1542 = new class_1542();
        _loc1_.id = "damageBoosterRating";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        damageBoosterRating = _loc1_;
        BindingManager.executeBindings(this, "damageBoosterRating", damageBoosterRating);
        return _loc1_;
    }

    private function method_2153(): Label {
        var _loc1_: Label = new Label();
        _loc1_.setStyle("fontSize", 13);
        _loc1_.setStyle("fontFamily", "EurostileTHea");
        _loc1_.setStyle("color", 16763904);
        _loc1_.setStyle("paddingBottom", -4);
        _loc1_.id = "deflectorStatusTitle";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        deflectorStatusTitle = _loc1_;
        BindingManager.executeBindings(this, "deflectorStatusTitle", deflectorStatusTitle);
        return _loc1_;
    }

    private function method_4390(): SkinnableContainer {
        var _loc1_: SkinnableContainer = new SkinnableContainer();
        _loc1_.percentWidth = 100;
        _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_5648);
        _loc1_.setStyle("skinClass", DOViewContainerSkin);
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_5648(): Array {
        return [this.method_1971()];
    }

    private function method_1971(): VGroup {
        var _loc1_: VGroup = new VGroup();
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 100;
        _loc1_.gap = -5;
        _loc1_.top = 3;
        _loc1_.mxmlContent = [this.method_3444(), this.method_3480(), this.method_2505(), this.method_3175()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_3444(): HGroup {
        var _loc1_: HGroup = new HGroup();
        _loc1_.percentWidth = 100;
        _loc1_.paddingBottom = 6;
        _loc1_.verticalAlign = "bottom";
        _loc1_.mxmlContent = [this.method_1160(), this.method_3056()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_1160(): Label {
        var _loc1_: Label = new Label();
        _loc1_.percentWidth = 70;
        _loc1_.setStyle("paddingLeft", 4);
        _loc1_.setStyle("fontSize", 11);
        _loc1_.setStyle("fontFamily", "EurostileT");
        _loc1_.setStyle("color", 15327423);
        _loc1_.id = "deflectorTimeLabel";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        deflectorTimeLabel = _loc1_;
        BindingManager.executeBindings(this, "deflectorTimeLabel", deflectorTimeLabel);
        return _loc1_;
    }

    private function method_3056(): Label {
        var _loc1_: Label = new Label();
        _loc1_.percentWidth = 30;
        _loc1_.setStyle("paddingRight", 4);
        _loc1_.setStyle("textAlign", "right");
        _loc1_.setStyle("fontSize", 10);
        _loc1_.setStyle("fontFamily", "EurostileT");
        _loc1_.setStyle("color", 16777215);
        _loc1_.id = "deflectorTimeValue";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        deflectorTimeValue = _loc1_;
        BindingManager.executeBindings(this, "deflectorTimeValue", deflectorTimeValue);
        return _loc1_;
    }

    private function method_3480(): ProgressBar {
        var _loc1_: ProgressBar = new ProgressBar();
        _loc1_.label = "";
        _loc1_.horizontalCenter = 0;
        _loc1_.mode = "manual";
        _loc1_.percentWidth = 100;
        _loc1_.height = 16;
        _loc1_.setStyle("barSkin", class_1540);
        _loc1_.setStyle("trackSkin", class_1539);
        _loc1_.id = "deflectorTimeProgressBar";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        deflectorTimeProgressBar = _loc1_;
        BindingManager.executeBindings(this, "deflectorTimeProgressBar", deflectorTimeProgressBar);
        return _loc1_;
    }

    private function method_2505(): HGroup {
        var _loc1_: HGroup = new HGroup();
        _loc1_.percentWidth = 100;
        _loc1_.paddingBottom = 12;
        _loc1_.verticalAlign = "bottom";
        _loc1_.mxmlContent = [this.method_4633(), this.method_2710()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_4633(): Label {
        var _loc1_: Label = new Label();
        _loc1_.percentWidth = 60;
        _loc1_.setStyle("paddingLeft", 4);
        _loc1_.setStyle("fontSize", 11);
        _loc1_.setStyle("fontFamily", "EurostileT");
        _loc1_.setStyle("color", 15327423);
        _loc1_.id = "deflectorTimeRegRateLabel";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        deflectorTimeRegRateLabel = _loc1_;
        BindingManager.executeBindings(this, "deflectorTimeRegRateLabel", deflectorTimeRegRateLabel);
        return _loc1_;
    }

    private function method_2710(): Label {
        var _loc1_: Label = new Label();
        _loc1_.percentWidth = 40;
        _loc1_.setStyle("paddingRight", 4);
        _loc1_.setStyle("textAlign", "right");
        _loc1_.setStyle("fontSize", 10);
        _loc1_.setStyle("fontFamily", "EurostileT");
        _loc1_.setStyle("color", 16777215);
        _loc1_.id = "deflectorTimeRegRateValue";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        deflectorTimeRegRateValue = _loc1_;
        BindingManager.executeBindings(this, "deflectorTimeRegRateValue", deflectorTimeRegRateValue);
        return _loc1_;
    }

    private function method_3175(): DOButtonBase {
        var _loc1_: DOButtonBase = new DOButtonBase();
        _loc1_.percentWidth = 100;
        _loc1_.enabled = true;
        _loc1_.styleName = "scalableGreenConfirmButton";
        _loc1_.mouseChildren = false;
        _loc1_.buttonMode = true;
        _loc1_.setStyle("fontSize", 14);
        _loc1_.setStyle("color", 16777215);
        _loc1_.setStyle("skinClass", DOButtonBaseSkin);
        _loc1_.addEventListener("click", this.method_6298);
        _loc1_.id = "deflectorToggleButton";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        deflectorToggleButton = _loc1_;
        BindingManager.executeBindings(this, "deflectorToggleButton", deflectorToggleButton);
        return _loc1_;
    }

    public function method_6298(param1: MouseEvent): void {
        method_472(param1);
    }

    public function method_362(param1: FlexEvent): void {
        handleCreationComplete();
    }

    private function method_5608(): Array {
        var var_5: Array = [];
        var_5[0] = new Binding(this, function (): String {
            var _loc1_: * = _regenerationTooltipText;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, null, "deflectorTimeRegRateLabel.toolTip");
        var_5[1] = new Binding(this, function (): String {
            var _loc1_: * = _regenerationTooltipText;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, null, "deflectorTimeRegRateValue.toolTip");
        return var_5;
    }
}
}
