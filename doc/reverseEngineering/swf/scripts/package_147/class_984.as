package package_147 {

import flash.display.Bitmap;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.utils.getDefinitionByName;

import mx.binding.Binding;
import mx.binding.BindingManager;
import mx.binding.IBindingClient;
import mx.binding.IWatcherSetupUtil2;
import mx.collections.ArrayList;
import mx.core.DeferredInstanceFromFunction;
import mx.core.IFlexModuleFactory;
import mx.core.mx_internal;
import mx.events.FlexEvent;
import mx.events.PropertyChangeEvent;

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.mvc.common.view.components.DOButtonBase;
import net.bigpoint.darkorbit.mvc.common.view.components.DOViewContainerBase;
import net.bigpoint.darkorbit.mvc.common.view.skins.DOButtonBaseSkin;
import net.bigpoint.darkorbit.mvc.common.view.skins.DOOuterViewContainerSkin;
import net.bigpoint.darkorbit.mvc.common.view.skins.DOViewContainerSkin;
import net.bigpoint.darkorbit.mvc.questWindow.model.vo.HighscoreVO;
import net.bigpoint.darkorbit.mvc.questWindow.model.vo.QuestListItemVO;
import net.bigpoint.darkorbit.net.class_59;
import net.bigpoint.darkorbit.settings.Settings;

import package_148.class_985;

import package_244.class_1505;

import package_65.class_203;

import package_80.QuestProxy;

import package_9.ResourceManager;

import spark.components.Group;
import spark.components.HGroup;
import spark.components.Image;
import spark.components.Label;
import spark.components.Scroller;
import spark.components.SkinnableContainer;
import spark.components.VGroup;
import spark.events.GridEvent;

public class class_984 extends SkinnableContainer implements IBindingClient {

    private static var _watcherSetupUtil: IWatcherSetupUtil2;


    private var var_3748: DOButtonBase;

    private var var_4317: DOButtonBase;

    private var var_3607: Label;

    private var var_5056: Group;

    private var var_2856: Label;

    private var var_345: VGroup;

    private var var_3479: DOViewContainerBase;

    private var var_2361: class_1507;

    private var var_729: Label;

    private var var_3309: HGroup;

    private var var_66: Label;

    private var var_1098: Label;

    private var var_3962: DOViewContainerBase;

    private var var_3857: SkinnableContainer;

    private var var_1309: class_1505;

    private var var_433: SkinnableContainer;

    private var __moduleFactoryInitialized: Boolean = false;

    public var var_115: int;

    public var var_1727: int;

    public var var_3118: Boolean;

    private var var_4708: ArrayList;

    mx_internal var _bindings: Array;

    mx_internal var _watchers: Array;

    mx_internal var _bindingsByDestination: Object;

    mx_internal var _bindingsBeginWithWord: Object;

    public function class_984() {
        var bindings: Array;
        var watchers: Array;
        var var_1: uint;
        var target: Object = null;
        var watcherSetupUtilClass: Object = null;
        this.var_4708 = new ArrayList([]);
        this.mx_internal::_bindings = [];
        this.mx_internal::_watchers = [];
        this.mx_internal::_bindingsByDestination = {};
        this.mx_internal::_bindingsBeginWithWord = {};
        super();
        mx_internal::_document = this;
        bindings = this.method_6063();
        watchers = [];
        target = this;
        if (_watcherSetupUtil == null) {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_questWindow_view_challengesSection_components_ChallengesSectionViewWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
        }
        _watcherSetupUtil.setup(this, function (param1: String): * {
            return target[param1];
        }, function (param1: String): * {
            return class_984[param1];
        }, bindings, watchers);
        mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
        mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
        this.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_3321);
        this.addEventListener("creationComplete", this.method_2002);
        var_1 = 0;
        while (var_1 < bindings.length) {
            Binding(bindings[var_1]).execute();
            var_1++;
        }
    }

    public static function set watcherSetupUtil(param1: IWatcherSetupUtil2): void {
        class_984._watcherSetupUtil = param1;
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

    public function method_2764(param1: ArrayList): void {
        this.objectivesList = param1;
    }

    private function method_485(param1: Event): void {
    }

    public function method_761(param1: class_203, param2: QuestListItemVO): void {
        var _loc3_: int = 0;
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: * = null;
        this.var_115 = param1.id;
        this.var_1727 = param1.method_2963().id;
        this.var_3118 = param2.method_1333();
        if (this.var_3118) {
            this.acceptButton.visible = false;
            this.abortButton.visible = true;
        } else {
            this.acceptButton.visible = true;
            this.abortButton.visible = false;
        }
        this.questSubTypeIcons.removeAllElements();
        if (param2.questSubTypeList != null) {
            _loc3_ = 0;
            while (_loc3_ < param2.questSubTypeList.length) {
                _loc4_ = String(QuestProxy.const_2738[param2.questSubTypeList[_loc3_].icon]);
                _loc5_ = ResourceManager.getBitmap("questWin", _loc4_ + "_framed");
                (_loc6_ = new Image()).source = _loc5_;
                this.questSubTypeIcons.addElement(_loc6_);
                _loc6_.toolTip = class_88.getItem(QuestProxy.const_2044[param2.questSubTypeList[_loc3_].icon]);
                _loc3_++;
            }
        }
        this.method_1322(param1.title);
        this.method_3699(param1.description);
    }

    private function method_1322(param1: String): void {
        this.challengeTitle.text = param1;
    }

    private function method_3699(param1: String): void {
        this.challengeDescScrollerGroup.verticalScrollPosition = 0;
        this.challengeDesc.text = String(param1);
    }

    private function method_3218(param1: MouseEvent): void {
        var _loc2_: class_985 = new class_985(class_985.ACCEPT_QUEST);
        _loc2_.questID = this.var_115;
        _loc2_.rootCaseID = this.var_1727;
        this.abortButton.visible = true;
        this.acceptButton.visible = false;
        dispatchEvent(_loc2_);
    }

    private function method_1514(param1: MouseEvent): void {
        var _loc2_: class_985 = new class_985(class_985.ABORT_QUEST);
        _loc2_.questID = this.var_115;
        _loc2_.rootCaseID = this.var_1727;
        dispatchEvent(_loc2_);
    }

    private function method_2093(param1: GridEvent): void {
        var _loc2_: ArrayList = (param1.currentTarget as class_1507).dataProvider as ArrayList;
        if (param1.rowIndex < 0 || param1.rowIndex >= _loc2_.length) {
            return;
        }
        var _loc3_: HighscoreVO = _loc2_.getItemAt(param1.rowIndex) as HighscoreVO;
        var _loc4_: String = Settings.dynamicHost + _loc3_.name_120 + "/?lang=" + Settings.language;
        class_59.call(class_59.const_1192, [_loc4_, false]);
    }

    private function method_1952(param1: GridEvent): void {
    }

    private function method_5244(param1: GridEvent): void {
    }

    public function method_3758(param1: QuestListItemVO): void {
        this.var_3118 = param1.method_1333();
        if (this.var_3118) {
            this.acceptButton.visible = false;
            this.abortButton.visible = true;
        } else {
            this.acceptButton.visible = true;
            this.abortButton.visible = false;
        }
    }

    private function method_3321(): Array {
        return [this.method_4589()];
    }

    private function method_4589(): VGroup {
        var _loc1_: VGroup = new VGroup();
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 100;
        _loc1_.mxmlContent = [this.method_3884(), this.method_6349()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_3884(): DOViewContainerBase {
        var _loc1_: DOViewContainerBase = new DOViewContainerBase();
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 100;
        _loc1_.styleName = "questWindowOuter";
        _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_4657);
        _loc1_.setStyle("skinClass", DOOuterViewContainerSkin);
        _loc1_.id = "groupDepth3bBackground";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.groupDepth3bBackground = _loc1_;
        BindingManager.executeBindings(this, "groupDepth3bBackground", this.groupDepth3bBackground);
        return _loc1_;
    }

    private function method_4657(): Array {
        return [this.method_3376()];
    }

    private function method_3376(): VGroup {
        var _loc1_: VGroup = new VGroup();
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 100;
        _loc1_.horizontalAlign = "center";
        _loc1_.mxmlContent = [this.method_5335(), this.method_1723(), this.method_5682(), this.method_5058(), this.method_2877()];
        _loc1_.id = "groupDepth3b";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.groupDepth3b = _loc1_;
        BindingManager.executeBindings(this, "groupDepth3b", this.groupDepth3b);
        return _loc1_;
    }

    private function method_5335(): DOViewContainerBase {
        var _loc1_: DOViewContainerBase = new DOViewContainerBase();
        _loc1_.horizontalCenter = 0;
        _loc1_.percentWidth = 97;
        _loc1_.percentHeight = 40;
        _loc1_.styleName = "questWindowInvisible";
        _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_4792);
        _loc1_.setStyle("skinClass", DOOuterViewContainerSkin);
        _loc1_.id = "selectedChallengeDescription";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.selectedChallengeDescription = _loc1_;
        BindingManager.executeBindings(this, "selectedChallengeDescription", this.selectedChallengeDescription);
        return _loc1_;
    }

    private function method_4792(): Array {
        return [this.method_5377()];
    }

    private function method_5377(): VGroup {
        var _loc1_: VGroup = new VGroup();
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 100;
        _loc1_.mxmlContent = [this.method_677(), this.method_5481()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_677(): Label {
        var _loc1_: Label = new Label();
        _loc1_.percentWidth = 100;
        _loc1_.text = "";
        _loc1_.setStyle("fontSize", 20);
        _loc1_.setStyle("fontFamily", "EurostileTHea");
        _loc1_.setStyle("paddingTop", 10);
        _loc1_.setStyle("color", 16763648);
        _loc1_.setStyle("textAlign", "left");
        _loc1_.id = "challengeTitle";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.challengeTitle = _loc1_;
        BindingManager.executeBindings(this, "challengeTitle", this.challengeTitle);
        return _loc1_;
    }

    private function method_5481(): Scroller {
        var _loc1_: Scroller = new Scroller();
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 100;
        _loc1_.styleName = "skinnedScroller";
        _loc1_.viewport = this.method_4064();
        _loc1_.setStyle("horizontalScrollPolicy", "off");
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_4064(): Group {
        var _loc1_: Group = new Group();
        _loc1_.mxmlContent = [this.method_5972()];
        _loc1_.id = "challengeDescScrollerGroup";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.challengeDescScrollerGroup = _loc1_;
        BindingManager.executeBindings(this, "challengeDescScrollerGroup", this.challengeDescScrollerGroup);
        return _loc1_;
    }

    private function method_5972(): Label {
        var _loc1_: Label = new Label();
        _loc1_.width = 360;
        _loc1_.text = "";
        _loc1_.setStyle("fontSize", 14);
        _loc1_.setStyle("fontFamily", "EurostileT");
        _loc1_.setStyle("color", 16777215);
        _loc1_.setStyle("textAlign", "left");
        _loc1_.setStyle("paddingRight", 10);
        _loc1_.id = "challengeDesc";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.challengeDesc = _loc1_;
        BindingManager.executeBindings(this, "challengeDesc", this.challengeDesc);
        return _loc1_;
    }

    private function method_1723(): HGroup {
        var _loc1_: HGroup = new HGroup();
        _loc1_.verticalAlign = "bottom";
        _loc1_.percentWidth = 96;
        _loc1_.paddingBottom = -5;
        _loc1_.mxmlContent = [this.method_3417(), this.method_5904()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_3417(): Label {
        var _loc1_: Label = new Label();
        _loc1_.percentWidth = 50;
        _loc1_.setStyle("fontFamily", "EurostileTHea");
        _loc1_.setStyle("fontSize", 14);
        _loc1_.setStyle("color", 16763648);
        _loc1_.setStyle("textAlign", "left");
        _loc1_.id = "objectivesLabel";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.objectivesLabel = _loc1_;
        BindingManager.executeBindings(this, "objectivesLabel", this.objectivesLabel);
        return _loc1_;
    }

    private function method_5904(): HGroup {
        var _loc1_: HGroup = new HGroup();
        _loc1_.horizontalAlign = "right";
        _loc1_.percentWidth = 50;
        _loc1_.id = "questSubTypeIcons";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.questSubTypeIcons = _loc1_;
        BindingManager.executeBindings(this, "questSubTypeIcons", this.questSubTypeIcons);
        return _loc1_;
    }

    private function method_5682(): SkinnableContainer {
        var _loc1_: SkinnableContainer = new SkinnableContainer();
        _loc1_.percentWidth = 97;
        _loc1_.percentHeight = 30;
        _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_4028);
        _loc1_.setStyle("skinClass", DOViewContainerSkin);
        _loc1_.id = "selectedChallengeObjectivesBg";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.selectedChallengeObjectivesBg = _loc1_;
        BindingManager.executeBindings(this, "selectedChallengeObjectivesBg", this.selectedChallengeObjectivesBg);
        return _loc1_;
    }

    private function method_4028(): Array {
        return [this.method_4415()];
    }

    private function method_4415(): class_1505 {
        var _loc1_: class_1505 = new class_1505();
        _loc1_.left = 8;
        _loc1_.top = -2;
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 100;
        _loc1_.id = "selectedChallengeObjectives";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.selectedChallengeObjectives = _loc1_;
        BindingManager.executeBindings(this, "selectedChallengeObjectives", this.selectedChallengeObjectives);
        return _loc1_;
    }

    private function method_5058(): Label {
        var _loc1_: Label = new Label();
        _loc1_.percentWidth = 100;
        _loc1_.setStyle("fontSize", 15);
        _loc1_.setStyle("fontFamily", "EurostileT");
        _loc1_.setStyle("paddingLeft", 10);
        _loc1_.setStyle("paddingTop", 5);
        _loc1_.setStyle("paddingBottom", -3);
        _loc1_.setStyle("color", 16763648);
        _loc1_.setStyle("textAlign", "left");
        _loc1_.id = "rankingTitle";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.rankingTitle = _loc1_;
        BindingManager.executeBindings(this, "rankingTitle", this.rankingTitle);
        return _loc1_;
    }

    private function method_2877(): SkinnableContainer {
        var _loc1_: SkinnableContainer = new SkinnableContainer();
        _loc1_.percentWidth = 97;
        _loc1_.percentHeight = 25;
        _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_2741);
        _loc1_.setStyle("skinClass", DOViewContainerSkin);
        _loc1_.id = "selectedChallengeHighscoreTable";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.selectedChallengeHighscoreTable = _loc1_;
        BindingManager.executeBindings(this, "selectedChallengeHighscoreTable", this.selectedChallengeHighscoreTable);
        return _loc1_;
    }

    private function method_2741(): Array {
        return [this.method_6296()];
    }

    private function method_6296(): class_1507 {
        var _loc1_: class_1507 = new class_1507();
        _loc1_.percentWidth = 100;
        _loc1_.styleName = "skinnedDataGrid";
        _loc1_.percentHeight = 100;
        _loc1_.addEventListener("gridClick", this.method_797);
        _loc1_.addEventListener("gridRollOver", this.method_3063);
        _loc1_.addEventListener("gridRollOut", this.method_2264);
        _loc1_.id = "highscoreDataGrid";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.highscoreDataGrid = _loc1_;
        BindingManager.executeBindings(this, "highscoreDataGrid", this.highscoreDataGrid);
        return _loc1_;
    }

    public function method_797(param1: GridEvent): void {
        this.method_2093(param1);
    }

    public function method_3063(param1: GridEvent): void {
        this.method_1952(param1);
    }

    public function method_2264(param1: GridEvent): void {
        this.method_5244(param1);
    }

    private function method_6349(): DOViewContainerBase {
        var _loc1_: DOViewContainerBase = new DOViewContainerBase();
        _loc1_.percentWidth = 100;
        _loc1_.styleName = "questWindowOuter";
        _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_1166);
        _loc1_.setStyle("skinClass", DOOuterViewContainerSkin);
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_1166(): Array {
        return [this.method_1518(), this.method_3581(), this.method_6275()];
    }

    private function method_1518(): Label {
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

    private function method_3581(): DOButtonBase {
        var _loc1_: DOButtonBase = new DOButtonBase();
        _loc1_.width = 200;
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
        this.acceptButton = _loc1_;
        BindingManager.executeBindings(this, "acceptButton", this.acceptButton);
        return _loc1_;
    }

    public function method_5467(param1: MouseEvent): void {
        this.method_3218(param1);
    }

    private function method_6275(): DOButtonBase {
        var _loc1_: DOButtonBase = new DOButtonBase();
        _loc1_.width = 200;
        _loc1_.right = 0;
        _loc1_.styleName = "questWindowAbortQuest";
        _loc1_.setStyle("fontSize", 14);
        _loc1_.setStyle("color", 16777215);
        _loc1_.setStyle("skinClass", DOButtonBaseSkin);
        _loc1_.addEventListener("click", this.method_5559);
        _loc1_.id = "abortButton";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.abortButton = _loc1_;
        BindingManager.executeBindings(this, "abortButton", this.abortButton);
        return _loc1_;
    }

    public function method_5559(param1: MouseEvent): void {
        this.method_1514(param1);
    }

    public function method_2002(param1: FlexEvent): void {
        this.method_485(param1);
    }

    private function method_6063(): Array {
        var var_5: Array = [];
        var_5[0] = new Binding(this, function (): String {
            var _loc1_: * = class_88.getItem("label_objectives");
            return _loc1_ == undefined ? null : String(_loc1_);
        }, null, "objectivesLabel.text");
        var_5[1] = new Binding(this, function (): String {
            var _loc1_: * = class_88.getItem("label_ranking");
            return _loc1_ == undefined ? null : String(_loc1_);
        }, null, "rankingTitle.text");
        var_5[2] = new Binding(this, function (): String {
            var _loc1_: * = class_88.getItem("label_questslots_free").replace("%AMOUNT%", "X");
            return _loc1_ == undefined ? null : String(_loc1_);
        }, null, "questsLeft.text");
        var_5[3] = new Binding(this, function (): String {
            var _loc1_: * = class_88.getItem("btn_challenge_accept");
            return _loc1_ == undefined ? null : String(_loc1_);
        }, null, "acceptButton.label");
        var_5[4] = new Binding(this, function (): String {
            var _loc1_: * = class_88.getItem("label_close");
            return _loc1_ == undefined ? null : String(_loc1_);
        }, null, "abortButton.label");
        return var_5;
    }

    [Bindable(event="propertyChange")]
    public function get abortButton(): DOButtonBase {
        return this.var_3748;
    }

    public function set abortButton(param1: DOButtonBase): void {
        var _loc2_: Object = this.var_3748;
        if (_loc2_ !== param1) {
            this.var_3748 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "abortButton", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get acceptButton(): DOButtonBase {
        return this.var_4317;
    }

    public function set acceptButton(param1: DOButtonBase): void {
        var _loc2_: Object = this.var_4317;
        if (_loc2_ !== param1) {
            this.var_4317 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "acceptButton", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get challengeDesc(): Label {
        return this.var_3607;
    }

    public function set challengeDesc(param1: Label): void {
        var _loc2_: Object = this.var_3607;
        if (_loc2_ !== param1) {
            this.var_3607 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "challengeDesc", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get challengeDescScrollerGroup(): Group {
        return this.var_5056;
    }

    public function set challengeDescScrollerGroup(param1: Group): void {
        var _loc2_: Object = this.var_5056;
        if (_loc2_ !== param1) {
            this.var_5056 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "challengeDescScrollerGroup", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get challengeTitle(): Label {
        return this.var_2856;
    }

    public function set challengeTitle(param1: Label): void {
        var _loc2_: Object = this.var_2856;
        if (_loc2_ !== param1) {
            this.var_2856 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "challengeTitle", _loc2_, param1));
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
    public function get highscoreDataGrid(): class_1507 {
        return this.var_2361;
    }

    public function set highscoreDataGrid(param1: class_1507): void {
        var _loc2_: Object = this.var_2361;
        if (_loc2_ !== param1) {
            this.var_2361 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "highscoreDataGrid", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get objectivesLabel(): Label {
        return this.var_729;
    }

    public function set objectivesLabel(param1: Label): void {
        var _loc2_: Object = this.var_729;
        if (_loc2_ !== param1) {
            this.var_729 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "objectivesLabel", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get questSubTypeIcons(): HGroup {
        return this.var_3309;
    }

    public function set questSubTypeIcons(param1: HGroup): void {
        var _loc2_: Object = this.var_3309;
        if (_loc2_ !== param1) {
            this.var_3309 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "questSubTypeIcons", _loc2_, param1));
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
    public function get rankingTitle(): Label {
        return this.var_1098;
    }

    public function set rankingTitle(param1: Label): void {
        var _loc2_: Object = this.var_1098;
        if (_loc2_ !== param1) {
            this.var_1098 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rankingTitle", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get selectedChallengeDescription(): DOViewContainerBase {
        return this.var_3962;
    }

    public function set selectedChallengeDescription(param1: DOViewContainerBase): void {
        var _loc2_: Object = this.var_3962;
        if (_loc2_ !== param1) {
            this.var_3962 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "selectedChallengeDescription", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get selectedChallengeHighscoreTable(): SkinnableContainer {
        return this.var_3857;
    }

    public function set selectedChallengeHighscoreTable(param1: SkinnableContainer): void {
        var _loc2_: Object = this.var_3857;
        if (_loc2_ !== param1) {
            this.var_3857 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "selectedChallengeHighscoreTable", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get selectedChallengeObjectives(): class_1505 {
        return this.var_1309;
    }

    public function set selectedChallengeObjectives(param1: class_1505): void {
        var _loc2_: Object = this.var_1309;
        if (_loc2_ !== param1) {
            this.var_1309 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "selectedChallengeObjectives", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get selectedChallengeObjectivesBg(): SkinnableContainer {
        return this.var_433;
    }

    public function set selectedChallengeObjectivesBg(param1: SkinnableContainer): void {
        var _loc2_: Object = this.var_433;
        if (_loc2_ !== param1) {
            this.var_433 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "selectedChallengeObjectivesBg", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    private function get objectivesList(): ArrayList {
        return this.var_4708;
    }

    private function set objectivesList(param1: ArrayList): void {
        var _loc2_: Object = this.var_4708;
        if (_loc2_ !== param1) {
            this.var_4708 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "objectivesList", _loc2_, param1));
            }
        }
    }
}
}
