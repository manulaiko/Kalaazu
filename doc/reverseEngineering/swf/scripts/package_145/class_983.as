package package_145 {

import flash.events.MouseEvent;
import flash.utils.getDefinitionByName;

import mx.binding.Binding;
import mx.binding.BindingManager;
import mx.binding.IBindingClient;
import mx.binding.IWatcherSetupUtil2;
import mx.core.DeferredInstanceFromFunction;
import mx.core.IFlexModuleFactory;
import mx.core.UIComponent;
import mx.core.mx_internal;
import mx.events.FlexEvent;
import mx.events.PropertyChangeEvent;
import mx.events.ToolTipEvent;

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.mvc.common.view.components.DOButtonBase;
import net.bigpoint.darkorbit.mvc.common.view.components.DOHtmlTooltip;
import net.bigpoint.darkorbit.mvc.common.view.components.DOViewContainerBase;
import net.bigpoint.darkorbit.mvc.common.view.skins.DOButtonBaseSkin;
import net.bigpoint.darkorbit.mvc.common.view.skins.DOOuterViewContainerSkin;
import net.bigpoint.darkorbit.mvc.common.view.skins.DOViewContainerSkin;

import package_243.class_1503;

import package_244.class_1505;

import spark.components.Group;
import spark.components.HGroup;
import spark.components.Label;
import spark.components.Scroller;
import spark.components.SkinnableContainer;
import spark.components.VGroup;

public class class_983 extends class_982 implements IBindingClient {

    private static var _watcherSetupUtil: IWatcherSetupUtil2;


    private var var_3890: Group;

    private var var_345: VGroup;

    private var var_3479: DOViewContainerBase;

    private var var_66: Label;

    private var var_1904: DOViewContainerBase;

    private var var_565: class_1505;

    private var var_3414: SkinnableContainer;

    private var var_636: class_1503;

    private var __moduleFactoryInitialized: Boolean = false;

    mx_internal var _bindings: Array;

    mx_internal var _watchers: Array;

    mx_internal var _bindingsByDestination: Object;

    mx_internal var _bindingsBeginWithWord: Object;

    public function class_983() {
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
        bindings = this.method_47();
        watchers = [];
        target = this;
        if (_watcherSetupUtil == null) {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_questWindow_view_questsSection_components_QuestSectionViewWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
        }
        _watcherSetupUtil.setup(this, function (param1: String): * {
            return target[param1];
        }, function (param1: String): * {
            return class_983[param1];
        }, bindings, watchers);
        mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
        mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
        this.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_5207);
        this.addEventListener("creationComplete", this.method_3512);
        var_1 = 0;
        while (var_1 < bindings.length) {
            Binding(bindings[var_1]).execute();
            var_1++;
        }
    }

    public static function set watcherSetupUtil(param1: IWatcherSetupUtil2): void {
        class_983._watcherSetupUtil = param1;
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

    private function method_187(param1: ToolTipEvent): void {
        var _loc2_: * = null;
        if (param1.target is UIComponent) {
            _loc2_ = new DOHtmlTooltip();
            _loc2_.htmlText = (param1.target as UIComponent).toolTip;
            param1.toolTip = _loc2_;
        }
    }

    private function method_5207(): Array {
        return [this.method_5989()];
    }

    private function method_5989(): VGroup {
        var _loc1_: VGroup = new VGroup();
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 100;
        _loc1_.mxmlContent = [this.method_6180(), this.method_5304()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_6180(): DOViewContainerBase {
        var _loc1_: DOViewContainerBase = new DOViewContainerBase();
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 100;
        _loc1_.styleName = "questWindowOuter";
        _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_5548);
        _loc1_.setStyle("skinClass", DOOuterViewContainerSkin);
        _loc1_.id = "groupDepth3bBackground";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.groupDepth3bBackground = _loc1_;
        BindingManager.executeBindings(this, "groupDepth3bBackground", this.groupDepth3bBackground);
        return _loc1_;
    }

    private function method_5548(): Array {
        return [this.method_1103()];
    }

    private function method_1103(): VGroup {
        var _loc1_: VGroup = new VGroup();
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 100;
        _loc1_.horizontalAlign = "center";
        _loc1_.mxmlContent = [this.method_6096(), this.method_2824(), this.method_4911(), this.method_824(), this.method_3813()];
        _loc1_.id = "groupDepth3b";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.groupDepth3b = _loc1_;
        BindingManager.executeBindings(this, "groupDepth3b", this.groupDepth3b);
        return _loc1_;
    }

    private function method_6096(): DOViewContainerBase {
        var _loc1_: DOViewContainerBase = new DOViewContainerBase();
        _loc1_.horizontalCenter = 0;
        _loc1_.percentWidth = 97;
        _loc1_.percentHeight = 40;
        _loc1_.styleName = "questWindowInvisible";
        _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_3814);
        _loc1_.setStyle("skinClass", DOOuterViewContainerSkin);
        _loc1_.id = "selectedQuestDescription";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.selectedQuestDescription = _loc1_;
        BindingManager.executeBindings(this, "selectedQuestDescription", this.selectedQuestDescription);
        return _loc1_;
    }

    private function method_3814(): Array {
        return [this.method_480()];
    }

    private function method_480(): VGroup {
        var _loc1_: VGroup = new VGroup();
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 100;
        _loc1_.mxmlContent = [this.method_3424(), this.method_3029()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_3424(): Label {
        var _loc1_: Label = new Label();
        _loc1_.percentWidth = 100;
        _loc1_.text = "";
        _loc1_.setStyle("fontSize", 20);
        _loc1_.setStyle("fontFamily", "EurostileTHea");
        _loc1_.setStyle("paddingTop", 10);
        _loc1_.setStyle("color", 16763648);
        _loc1_.setStyle("textAlign", "left");
        _loc1_.id = "questTitle";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        questTitle = _loc1_;
        BindingManager.executeBindings(this, "questTitle", questTitle);
        return _loc1_;
    }

    private function method_3029(): Scroller {
        var _loc1_: Scroller = new Scroller();
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 100;
        _loc1_.styleName = "skinnedScroller";
        _loc1_.viewport = this.method_285();
        _loc1_.setStyle("horizontalScrollPolicy", "off");
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_285(): Group {
        var _loc1_: Group = new Group();
        _loc1_.mxmlContent = [this.method_1636()];
        _loc1_.id = "questDescScrollerGroup";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        questDescScrollerGroup = _loc1_;
        BindingManager.executeBindings(this, "questDescScrollerGroup", questDescScrollerGroup);
        return _loc1_;
    }

    private function method_1636(): Label {
        var _loc1_: Label = new Label();
        _loc1_.width = 360;
        _loc1_.text = "";
        _loc1_.setStyle("fontSize", 14);
        _loc1_.setStyle("fontFamily", "EurostileT");
        _loc1_.setStyle("color", 16777215);
        _loc1_.setStyle("textAlign", "left");
        _loc1_.setStyle("paddingRight", 10);
        _loc1_.id = "questDesc";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        questDesc = _loc1_;
        BindingManager.executeBindings(this, "questDesc", questDesc);
        return _loc1_;
    }

    private function method_2824(): HGroup {
        var _loc1_: HGroup = new HGroup();
        _loc1_.verticalAlign = "bottom";
        _loc1_.percentWidth = 96;
        _loc1_.paddingBottom = -5;
        _loc1_.mxmlContent = [this.method_2926(), this.method_4179()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_2926(): Label {
        var _loc1_: Label = new Label();
        _loc1_.text = "Objectives";
        _loc1_.percentWidth = 50;
        _loc1_.setStyle("fontFamily", "EurostileTHea");
        _loc1_.setStyle("fontSize", 14);
        _loc1_.setStyle("color", 16763648);
        _loc1_.setStyle("textAlign", "left");
        _loc1_.id = "objectivesLabel";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        objectivesLabel = _loc1_;
        BindingManager.executeBindings(this, "objectivesLabel", objectivesLabel);
        return _loc1_;
    }

    private function method_4179(): HGroup {
        var _loc1_: HGroup = new HGroup();
        _loc1_.horizontalAlign = "right";
        _loc1_.percentWidth = 50;
        _loc1_.id = "questSubTypeIcons";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        questSubTypeIcons = _loc1_;
        BindingManager.executeBindings(this, "questSubTypeIcons", questSubTypeIcons);
        return _loc1_;
    }

    private function method_4911(): SkinnableContainer {
        var _loc1_: SkinnableContainer = new SkinnableContainer();
        _loc1_.percentWidth = 97;
        _loc1_.percentHeight = 30;
        _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_4195);
        _loc1_.setStyle("skinClass", DOViewContainerSkin);
        _loc1_.id = "selectedQuestObjectivesBg";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.selectedQuestObjectivesBg = _loc1_;
        BindingManager.executeBindings(this, "selectedQuestObjectivesBg", this.selectedQuestObjectivesBg);
        return _loc1_;
    }

    private function method_4195(): Array {
        return [this.method_6101()];
    }

    private function method_6101(): class_1505 {
        var _loc1_: class_1505 = new class_1505();
        _loc1_.left = 8;
        _loc1_.top = -2;
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 100;
        _loc1_.id = "selectedQuestObjectives";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.selectedQuestObjectives = _loc1_;
        BindingManager.executeBindings(this, "selectedQuestObjectives", this.selectedQuestObjectives);
        return _loc1_;
    }

    private function method_824(): Label {
        var _loc1_: Label = new Label();
        _loc1_.text = "Rewards";
        _loc1_.percentWidth = 96;
        _loc1_.setStyle("fontFamily", "EurostileTHea");
        _loc1_.setStyle("fontSize", 14);
        _loc1_.setStyle("color", 16763648);
        _loc1_.setStyle("paddingTop", 10);
        _loc1_.setStyle("textAlign", "left");
        _loc1_.setStyle("verticalAlign", "bottom");
        _loc1_.setStyle("paddingBottom", -5);
        _loc1_.id = "rewardsLabel";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        rewardsLabel = _loc1_;
        BindingManager.executeBindings(this, "rewardsLabel", rewardsLabel);
        return _loc1_;
    }

    private function method_3813(): class_1503 {
        var _loc1_: class_1503 = new class_1503();
        _loc1_.percentWidth = 97;
        _loc1_.percentHeight = 26;
        _loc1_.setStyle("skinClass", DOViewContainerSkin);
        _loc1_.id = "selectedQuestRewards";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.selectedQuestRewards = _loc1_;
        BindingManager.executeBindings(this, "selectedQuestRewards", this.selectedQuestRewards);
        return _loc1_;
    }

    private function method_5304(): DOViewContainerBase {
        var _loc1_: DOViewContainerBase = new DOViewContainerBase();
        _loc1_.percentWidth = 100;
        _loc1_.styleName = "questWindowOuter";
        _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_2396);
        _loc1_.setStyle("skinClass", DOOuterViewContainerSkin);
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_2396(): Array {
        return [this.method_1756(), this.method_1691(), this.method_6215()];
    }

    private function method_1756(): Label {
        var _loc1_: Label = new Label();
        _loc1_.verticalCenter = 0;
        _loc1_.setStyle("fontSize", 12);
        _loc1_.setStyle("fontFamily", "EurostileT");
        _loc1_.setStyle("color", 12632256);
        _loc1_.setStyle("textAlign", "left");
        _loc1_.id = "questsLeft";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.questsLeft = _loc1_;
        BindingManager.executeBindings(this, "questsLeft", this.questsLeft);
        return _loc1_;
    }

    private function method_1691(): Group {
        var _loc1_: Group = new Group();
        _loc1_.right = 0;
        _loc1_.mxmlContent = [this.method_5186()];
        _loc1_.addEventListener("toolTipCreate", this.method_3930);
        _loc1_.id = "acceptButtonTooltipGroup";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.acceptButtonTooltipGroup = _loc1_;
        BindingManager.executeBindings(this, "acceptButtonTooltipGroup", this.acceptButtonTooltipGroup);
        return _loc1_;
    }

    private function method_5186(): DOButtonBase {
        var _loc1_: DOButtonBase = new DOButtonBase();
        _loc1_.right = 0;
        _loc1_.styleName = "questWindowAcceptQuest";
        _loc1_.mouseChildren = false;
        _loc1_.buttonMode = true;
        _loc1_.setStyle("fontSize", 14);
        _loc1_.setStyle("color", 16777215);
        _loc1_.setStyle("skinClass", DOButtonBaseSkin);
        _loc1_.addEventListener("click", this.method_5467);
        _loc1_.id = "acceptButton";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        acceptButton = _loc1_;
        BindingManager.executeBindings(this, "acceptButton", acceptButton);
        return _loc1_;
    }

    public function method_5467(param1: MouseEvent): void {
        method_3218(param1);
    }

    public function method_3930(param1: ToolTipEvent): void {
        this.method_187(param1);
    }

    private function method_6215(): DOButtonBase {
        var _loc1_: DOButtonBase = new DOButtonBase();
        _loc1_.right = 0;
        _loc1_.styleName = "questWindowAbortQuest";
        _loc1_.mouseChildren = false;
        _loc1_.buttonMode = true;
        _loc1_.setStyle("fontSize", 14);
        _loc1_.setStyle("color", 16777215);
        _loc1_.setStyle("skinClass", DOButtonBaseSkin);
        _loc1_.addEventListener("click", this.method_5559);
        _loc1_.id = "abortButton";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        abortButton = _loc1_;
        BindingManager.executeBindings(this, "abortButton", abortButton);
        return _loc1_;
    }

    public function method_5559(param1: MouseEvent): void {
        method_1514(param1);
    }

    public function method_3512(param1: FlexEvent): void {
        method_485();
    }

    private function method_47(): Array {
        var var_5: Array = [];
        var_5[0] = new Binding(this, function (): String {
            var _loc1_: * = class_88.getItem("label_questslots_free_p").replace("%AMOUNT%", "X");
            return _loc1_ == undefined ? null : String(_loc1_);
        }, null, "questsLeft.text");
        var_5[1] = new Binding(this, function (): String {
            var _loc1_: * = class_88.getItem("btn_quest_accept");
            return _loc1_ == undefined ? null : String(_loc1_);
        }, null, "acceptButton.label");
        var_5[2] = new Binding(this, function (): String {
            var _loc1_: * = class_88.getItem("label_close");
            return _loc1_ == undefined ? null : String(_loc1_);
        }, null, "abortButton.label");
        return var_5;
    }

    [Bindable(event="propertyChange")]
    public function get acceptButtonTooltipGroup(): Group {
        return this.var_3890;
    }

    public function set acceptButtonTooltipGroup(param1: Group): void {
        var _loc2_: Object = this.var_3890;
        if (_loc2_ !== param1) {
            this.var_3890 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "acceptButtonTooltipGroup", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get groupDepth3b(): VGroup {
        return this.var_345;
    }

    public function set groupDepth3b(param1: VGroup): void {
        var _loc2_: Object = this.var_345;
        if (_loc2_ !== param1) {
            this.var_345 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "groupDepth3b", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get groupDepth3bBackground(): DOViewContainerBase {
        return this.var_3479;
    }

    public function set groupDepth3bBackground(param1: DOViewContainerBase): void {
        var _loc2_: Object = this.var_3479;
        if (_loc2_ !== param1) {
            this.var_3479 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "groupDepth3bBackground", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get questsLeft(): Label {
        return this.var_66;
    }

    public function set questsLeft(param1: Label): void {
        var _loc2_: Object = this.var_66;
        if (_loc2_ !== param1) {
            this.var_66 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "questsLeft", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get selectedQuestDescription(): DOViewContainerBase {
        return this.var_1904;
    }

    public function set selectedQuestDescription(param1: DOViewContainerBase): void {
        var _loc2_: Object = this.var_1904;
        if (_loc2_ !== param1) {
            this.var_1904 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "selectedQuestDescription", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get selectedQuestObjectives(): class_1505 {
        return this.var_565;
    }

    public function set selectedQuestObjectives(param1: class_1505): void {
        var _loc2_: Object = this.var_565;
        if (_loc2_ !== param1) {
            this.var_565 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "selectedQuestObjectives", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get selectedQuestObjectivesBg(): SkinnableContainer {
        return this.var_3414;
    }

    public function set selectedQuestObjectivesBg(param1: SkinnableContainer): void {
        var _loc2_: Object = this.var_3414;
        if (_loc2_ !== param1) {
            this.var_3414 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "selectedQuestObjectivesBg", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get selectedQuestRewards(): class_1503 {
        return this.var_636;
    }

    public function set selectedQuestRewards(param1: class_1503): void {
        var _loc2_: Object = this.var_636;
        if (_loc2_ !== param1) {
            this.var_636 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "selectedQuestRewards", _loc2_, param1));
            }
        }
    }
}
}
