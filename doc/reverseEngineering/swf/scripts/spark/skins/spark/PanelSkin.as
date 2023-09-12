package spark.skins.spark {

import flash.utils.getDefinitionByName;

import mx.binding.Binding;
import mx.binding.BindingManager;
import mx.binding.IBindingClient;
import mx.binding.IWatcherSetupUtil2;
import mx.core.DeferredInstanceFromFunction;
import mx.core.FlexVersion;
import mx.core.IFlexModuleFactory;
import mx.core.IStateClient2;
import mx.core.mx_internal;
import mx.events.PropertyChangeEvent;
import mx.graphics.GradientEntry;
import mx.graphics.LinearGradient;
import mx.graphics.LinearGradientStroke;
import mx.graphics.SolidColor;
import mx.graphics.SolidColorStroke;
import mx.states.AddItems;
import mx.states.SetProperty;
import mx.states.State;

import spark.components.Group;
import spark.components.Label;
import spark.components.Panel;
import spark.layouts.HorizontalLayout;
import spark.layouts.VerticalLayout;
import spark.primitives.Rect;
import spark.primitives.RectangularDropShadow;
import spark.skins.SparkSkin;

public class PanelSkin extends SparkSkin implements IBindingClient, IStateClient2 {

    private static const exclusions: Array = ["background", "titleDisplay", "contentGroup", "controlBarGroup", "border"];

    private static const exclusions_4_0: Array = ["background", "titleDisplay", "contentGroup", "controlBarGroup"];

    private static var _watcherSetupUtil: IWatcherSetupUtil2;


    private var _747650929_PanelSkin_Group1: Group;

    public var _PanelSkin_Group8: Group;

    private var _1332194002background: Rect;

    private var _1427077073backgroundFill: SolidColor;

    private var _1383304148border: Rect;

    private var _1395787140borderStroke: SolidColorStroke;

    private var _631173356bottomGroup: Group;

    private var _1770004448bottomGroupMask: Group;

    private var _149872069bottomMaskRect: Rect;

    private var _809612678contentGroup: Group;

    private var _567321830contents: Group;

    private var _139410089controlBarGroup: Group;

    private var _906978543dropShadow: RectangularDropShadow;

    private var _110116675tbDiv: Rect;

    private var _881290991tbFill: Rect;

    private var _754825923tbHilite: Rect;

    private var _1893287094titleDisplay: Label;

    private var _988229078topGroup: Group;

    private var _181676086topGroupMask: Group;

    private var _1437106021topMaskRect: Rect;

    private var __moduleFactoryInitialized: Boolean = false;

    private var cornerRadius: Number;

    mx_internal var _bindings: Array;

    mx_internal var _watchers: Array;

    mx_internal var _bindingsByDestination: Object;

    mx_internal var _bindingsBeginWithWord: Object;

    private var _213507019hostComponent: Panel;

    public function PanelSkin() {
        var watchers: Array;
        var _PanelSkin_Group3_factory: DeferredInstanceFromFunction;
        var _PanelSkin_Group7_factory: DeferredInstanceFromFunction;
        var var_1: uint;
        var bindings: Array = null;
        var target: Object = null;
        var watcherSetupUtilClass: Object = null;
        this.mx_internal::_bindings = [];
        this.mx_internal::_watchers = [];
        this.mx_internal::_bindingsByDestination = {};
        this.mx_internal::_bindingsBeginWithWord = {};
        super();
        mx_internal::_document = this;
        bindings = this._PanelSkin_bindingsSetup();
        watchers = [];
        target = this;
        if (_watcherSetupUtil == null) {
            watcherSetupUtilClass = getDefinitionByName("_spark_skins_spark_PanelSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
        }
        _watcherSetupUtil.setup(this, function (param1: String): * {
            return target[param1];
        }, function (param1: String): * {
            return PanelSkin[param1];
        }, bindings, watchers);
        mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
        mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
        this.blendMode = "normal";
        this.mouseEnabled = false;
        this.minWidth = 131;
        this.minHeight = 127;
        this.mxmlContent = [this._PanelSkin_RectangularDropShadow1_i(), this._PanelSkin_Group1_i()];
        this.currentState = "normal";
        _PanelSkin_Group3_factory = new DeferredInstanceFromFunction(this._PanelSkin_Group3_i);
        _PanelSkin_Group7_factory = new DeferredInstanceFromFunction(this._PanelSkin_Group7_i);
        states = [new State({
            "name": "normal",
            "overrides": []
        }), new State({
            "name": "disabled",
            "overrides": [new SetProperty().initializeFromObject({
                "name": "alpha",
                "value": 0.5
            })]
        }), new State({
            "name": "normalWithControlBar",
            "stateGroups": ["withControls"],
            "overrides": [new AddItems().initializeFromObject({
                "itemsFactory": _PanelSkin_Group7_factory,
                "destination": "contents",
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["contentGroup"]
            }), new AddItems().initializeFromObject({
                "itemsFactory": _PanelSkin_Group3_factory,
                "destination": "_PanelSkin_Group1",
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["topGroupMask"]
            })]
        }), new State({
            "name": "disabledWithControlBar",
            "stateGroups": ["withControls"],
            "overrides": [new AddItems().initializeFromObject({
                "itemsFactory": _PanelSkin_Group7_factory,
                "destination": "contents",
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["contentGroup"]
            }), new AddItems().initializeFromObject({
                "itemsFactory": _PanelSkin_Group3_factory,
                "destination": "_PanelSkin_Group1",
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["topGroupMask"]
            }), new SetProperty().initializeFromObject({
                "name": "alpha",
                "value": 0.5
            })]
        })];
        var_1 = 0;
        while (var_1 < bindings.length) {
            Binding(bindings[var_1]).execute();
            var_1++;
        }
    }

    public static function set watcherSetupUtil(param1: IWatcherSetupUtil2): void {
        PanelSkin._watcherSetupUtil = param1;
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

    override public function get colorizeExclusions(): Array {
        if (false) {
            return exclusions_4_0;
        }
        return exclusions;
    }

    override protected function initializationComplete(): void {
        useChromeColor = true;
        super.initializationComplete();
    }

    override protected function updateDisplayList(param1: Number, param2: Number): void {
        if (getStyle("borderVisible") == true) {
            this.border.visible = true;
            this.background.left = this.background.top = this.background.right = this.background.bottom = 1;
            this.contents.left = this.contents.top = this.contents.right = this.contents.bottom = 1;
        } else {
            this.border.visible = false;
            this.background.left = this.background.top = this.background.right = this.background.bottom = 0;
            this.contents.left = this.contents.top = this.contents.right = this.contents.bottom = 0;
        }
        this.dropShadow.visible = getStyle("dropShadowVisible");
        var _loc3_: Number = getStyle("cornerRadius");
        var _loc4_: Boolean = currentState == "disabledWithControlBar" || currentState == "normalWithControlBar";
        if (this.cornerRadius != _loc3_) {
            this.cornerRadius = _loc3_;
            this.dropShadow.tlRadius = this.cornerRadius;
            this.dropShadow.trRadius = this.cornerRadius;
            this.dropShadow.blRadius = _loc4_ ? this.cornerRadius : 0;
            this.dropShadow.brRadius = _loc4_ ? this.cornerRadius : 0;
            this.setPartCornerRadii(this.topMaskRect, _loc4_);
            this.setPartCornerRadii(this.border, _loc4_);
            this.setPartCornerRadii(this.background, _loc4_);
        }
        if (this.bottomMaskRect) {
            this.setPartCornerRadii(this.bottomMaskRect, _loc4_);
        }
        this.borderStroke.color = getStyle("borderColor");
        this.borderStroke.alpha = getStyle("borderAlpha");
        this.backgroundFill.color = getStyle("backgroundColor");
        this.backgroundFill.alpha = getStyle("backgroundAlpha");
        super.updateDisplayList(param1, param2);
    }

    private function setPartCornerRadii(param1: Rect, param2: Boolean): void {
        param1.topLeftRadiusX = this.cornerRadius;
        param1.topRightRadiusX = this.cornerRadius;
        param1.bottomLeftRadiusX = param2 ? this.cornerRadius : 0;
        param1.bottomRightRadiusX = param2 ? this.cornerRadius : 0;
    }

    private function _PanelSkin_RectangularDropShadow1_i(): RectangularDropShadow {
        var _loc1_: RectangularDropShadow = new RectangularDropShadow();
        _loc1_.blurX = 20;
        _loc1_.blurY = 20;
        _loc1_.alpha = 0.32;
        _loc1_.distance = 11;
        _loc1_.angle = 90;
        _loc1_.color = 0;
        _loc1_.left = 0;
        _loc1_.top = 0;
        _loc1_.right = 0;
        _loc1_.bottom = 0;
        _loc1_.id = "dropShadow";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.dropShadow = _loc1_;
        BindingManager.executeBindings(this, "dropShadow", this.dropShadow);
        return _loc1_;
    }

    private function _PanelSkin_Group1_i(): Group {
        var _loc1_: Group = new Group();
        _loc1_.left = 0;
        _loc1_.right = 0;
        _loc1_.top = 0;
        _loc1_.bottom = 0;
        _loc1_.mxmlContent = [this._PanelSkin_Group2_i(), this._PanelSkin_Rect3_i(), this._PanelSkin_Rect4_i(), this._PanelSkin_Group4_i()];
        _loc1_.id = "_PanelSkin_Group1";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this._PanelSkin_Group1 = _loc1_;
        BindingManager.executeBindings(this, "_PanelSkin_Group1", this._PanelSkin_Group1);
        return _loc1_;
    }

    private function _PanelSkin_Group2_i(): Group {
        var _loc1_: Group = new Group();
        _loc1_.left = 1;
        _loc1_.top = 1;
        _loc1_.right = 1;
        _loc1_.bottom = 1;
        _loc1_.mxmlContent = [this._PanelSkin_Rect1_i()];
        _loc1_.id = "topGroupMask";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.topGroupMask = _loc1_;
        BindingManager.executeBindings(this, "topGroupMask", this.topGroupMask);
        return _loc1_;
    }

    private function _PanelSkin_Rect1_i(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 0;
        _loc1_.top = 0;
        _loc1_.right = 0;
        _loc1_.bottom = 0;
        _loc1_.fill = this._PanelSkin_SolidColor1_c();
        _loc1_.initialized(this, "topMaskRect");
        this.topMaskRect = _loc1_;
        BindingManager.executeBindings(this, "topMaskRect", this.topMaskRect);
        return _loc1_;
    }

    private function _PanelSkin_SolidColor1_c(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        _loc1_.alpha = 0;
        return _loc1_;
    }

    private function _PanelSkin_Group3_i(): Group {
        var _loc1_: Group = new Group();
        _loc1_.left = 1;
        _loc1_.top = 1;
        _loc1_.right = 1;
        _loc1_.bottom = 1;
        _loc1_.mxmlContent = [this._PanelSkin_Rect2_i()];
        _loc1_.id = "bottomGroupMask";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.bottomGroupMask = _loc1_;
        BindingManager.executeBindings(this, "bottomGroupMask", this.bottomGroupMask);
        return _loc1_;
    }

    private function _PanelSkin_Rect2_i(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 0;
        _loc1_.top = 0;
        _loc1_.right = 0;
        _loc1_.bottom = 0;
        _loc1_.fill = this._PanelSkin_SolidColor2_c();
        _loc1_.initialized(this, "bottomMaskRect");
        this.bottomMaskRect = _loc1_;
        BindingManager.executeBindings(this, "bottomMaskRect", this.bottomMaskRect);
        return _loc1_;
    }

    private function _PanelSkin_SolidColor2_c(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        _loc1_.alpha = 0;
        return _loc1_;
    }

    private function _PanelSkin_Rect3_i(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 0;
        _loc1_.right = 0;
        _loc1_.top = 0;
        _loc1_.bottom = 0;
        _loc1_.stroke = this._PanelSkin_SolidColorStroke1_i();
        _loc1_.initialized(this, "border");
        this.border = _loc1_;
        BindingManager.executeBindings(this, "border", this.border);
        return _loc1_;
    }

    private function _PanelSkin_SolidColorStroke1_i(): SolidColorStroke {
        var _loc1_: SolidColorStroke = new SolidColorStroke();
        _loc1_.weight = 1;
        this.borderStroke = _loc1_;
        BindingManager.executeBindings(this, "borderStroke", this.borderStroke);
        return _loc1_;
    }

    private function _PanelSkin_Rect4_i(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 1;
        _loc1_.top = 1;
        _loc1_.right = 1;
        _loc1_.bottom = 1;
        _loc1_.fill = this._PanelSkin_SolidColor3_i();
        _loc1_.initialized(this, "background");
        this.background = _loc1_;
        BindingManager.executeBindings(this, "background", this.background);
        return _loc1_;
    }

    private function _PanelSkin_SolidColor3_i(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        _loc1_.color = 16777215;
        this.backgroundFill = _loc1_;
        BindingManager.executeBindings(this, "backgroundFill", this.backgroundFill);
        return _loc1_;
    }

    private function _PanelSkin_Group4_i(): Group {
        var _loc1_: Group = new Group();
        _loc1_.left = 1;
        _loc1_.right = 1;
        _loc1_.top = 1;
        _loc1_.bottom = 1;
        _loc1_.layout = this._PanelSkin_VerticalLayout1_c();
        _loc1_.mxmlContent = [this._PanelSkin_Group5_i(), this._PanelSkin_Group6_i()];
        _loc1_.id = "contents";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.contents = _loc1_;
        BindingManager.executeBindings(this, "contents", this.contents);
        return _loc1_;
    }

    private function _PanelSkin_VerticalLayout1_c(): VerticalLayout {
        var _loc1_: VerticalLayout = new VerticalLayout();
        _loc1_.gap = 0;
        _loc1_.horizontalAlign = "justify";
        return _loc1_;
    }

    private function _PanelSkin_Group5_i(): Group {
        var _loc1_: Group = new Group();
        _loc1_.mxmlContent = [this._PanelSkin_Rect5_i(), this._PanelSkin_Rect6_i(), this._PanelSkin_Rect7_i(), this._PanelSkin_Label1_i()];
        _loc1_.id = "topGroup";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.topGroup = _loc1_;
        BindingManager.executeBindings(this, "topGroup", this.topGroup);
        return _loc1_;
    }

    private function _PanelSkin_Rect5_i(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 0;
        _loc1_.right = 0;
        _loc1_.top = 0;
        _loc1_.bottom = 1;
        _loc1_.fill = this._PanelSkin_LinearGradient1_c();
        _loc1_.initialized(this, "tbFill");
        this.tbFill = _loc1_;
        BindingManager.executeBindings(this, "tbFill", this.tbFill);
        return _loc1_;
    }

    private function _PanelSkin_LinearGradient1_c(): LinearGradient {
        var _loc1_: LinearGradient = new LinearGradient();
        _loc1_.rotation = 90;
        _loc1_.entries = [this._PanelSkin_GradientEntry1_c(), this._PanelSkin_GradientEntry2_c()];
        return _loc1_;
    }

    private function _PanelSkin_GradientEntry1_c(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 14869218;
        return _loc1_;
    }

    private function _PanelSkin_GradientEntry2_c(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 14277081;
        return _loc1_;
    }

    private function _PanelSkin_Rect6_i(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 0;
        _loc1_.right = 0;
        _loc1_.top = 0;
        _loc1_.bottom = 0;
        _loc1_.stroke = this._PanelSkin_LinearGradientStroke1_c();
        _loc1_.initialized(this, "tbHilite");
        this.tbHilite = _loc1_;
        BindingManager.executeBindings(this, "tbHilite", this.tbHilite);
        return _loc1_;
    }

    private function _PanelSkin_LinearGradientStroke1_c(): LinearGradientStroke {
        var _loc1_: LinearGradientStroke = new LinearGradientStroke();
        _loc1_.rotation = 90;
        _loc1_.weight = 1;
        _loc1_.entries = [this._PanelSkin_GradientEntry3_c(), this._PanelSkin_GradientEntry4_c()];
        return _loc1_;
    }

    private function _PanelSkin_GradientEntry3_c(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 15395562;
        return _loc1_;
    }

    private function _PanelSkin_GradientEntry4_c(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 14277081;
        return _loc1_;
    }

    private function _PanelSkin_Rect7_i(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 0;
        _loc1_.right = 0;
        _loc1_.height = 1;
        _loc1_.bottom = 0;
        _loc1_.fill = this._PanelSkin_SolidColor4_c();
        _loc1_.initialized(this, "tbDiv");
        this.tbDiv = _loc1_;
        BindingManager.executeBindings(this, "tbDiv", this.tbDiv);
        return _loc1_;
    }

    private function _PanelSkin_SolidColor4_c(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        _loc1_.color = 12632256;
        return _loc1_;
    }

    private function _PanelSkin_Label1_i(): Label {
        var _loc1_: Label = new Label();
        _loc1_.maxDisplayedLines = 1;
        _loc1_.left = 9;
        _loc1_.right = 3;
        _loc1_.top = 1;
        _loc1_.bottom = 0;
        _loc1_.minHeight = 30;
        _loc1_.setStyle("verticalAlign", "middle");
        _loc1_.setStyle("textAlign", "start");
        _loc1_.setStyle("fontWeight", "bold");
        _loc1_.id = "titleDisplay";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.titleDisplay = _loc1_;
        BindingManager.executeBindings(this, "titleDisplay", this.titleDisplay);
        return _loc1_;
    }

    private function _PanelSkin_Group6_i(): Group {
        var _loc1_: Group = new Group();
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 100;
        _loc1_.minWidth = 0;
        _loc1_.minHeight = 0;
        _loc1_.id = "contentGroup";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.contentGroup = _loc1_;
        BindingManager.executeBindings(this, "contentGroup", this.contentGroup);
        return _loc1_;
    }

    private function _PanelSkin_Group7_i(): Group {
        var _loc1_: Group = new Group();
        _loc1_.minWidth = 0;
        _loc1_.minHeight = 0;
        _loc1_.mxmlContent = [this._PanelSkin_Group8_i(), this._PanelSkin_Group9_i()];
        _loc1_.id = "bottomGroup";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.bottomGroup = _loc1_;
        BindingManager.executeBindings(this, "bottomGroup", this.bottomGroup);
        return _loc1_;
    }

    private function _PanelSkin_Group8_i(): Group {
        var _loc1_: Group = new Group();
        _loc1_.left = 0;
        _loc1_.right = 0;
        _loc1_.top = 0;
        _loc1_.bottom = 0;
        _loc1_.mxmlContent = [this._PanelSkin_Rect8_c(), this._PanelSkin_Rect9_c(), this._PanelSkin_Rect10_c()];
        _loc1_.id = "_PanelSkin_Group8";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this._PanelSkin_Group8 = _loc1_;
        BindingManager.executeBindings(this, "_PanelSkin_Group8", this._PanelSkin_Group8);
        return _loc1_;
    }

    private function _PanelSkin_Rect8_c(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 0;
        _loc1_.right = 0;
        _loc1_.top = 0;
        _loc1_.height = 1;
        _loc1_.alpha = 0.22;
        _loc1_.fill = this._PanelSkin_SolidColor5_c();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function _PanelSkin_SolidColor5_c(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        _loc1_.color = 0;
        return _loc1_;
    }

    private function _PanelSkin_Rect9_c(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 0;
        _loc1_.right = 0;
        _loc1_.top = 1;
        _loc1_.bottom = 0;
        _loc1_.stroke = this._PanelSkin_LinearGradientStroke2_c();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function _PanelSkin_LinearGradientStroke2_c(): LinearGradientStroke {
        var _loc1_: LinearGradientStroke = new LinearGradientStroke();
        _loc1_.rotation = 90;
        _loc1_.weight = 1;
        _loc1_.entries = [this._PanelSkin_GradientEntry5_c(), this._PanelSkin_GradientEntry6_c()];
        return _loc1_;
    }

    private function _PanelSkin_GradientEntry5_c(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 15066597;
        return _loc1_;
    }

    private function _PanelSkin_GradientEntry6_c(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 14211288;
        return _loc1_;
    }

    private function _PanelSkin_Rect10_c(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 1;
        _loc1_.right = 1;
        _loc1_.top = 2;
        _loc1_.bottom = 1;
        _loc1_.fill = this._PanelSkin_LinearGradient2_c();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function _PanelSkin_LinearGradient2_c(): LinearGradient {
        var _loc1_: LinearGradient = new LinearGradient();
        _loc1_.rotation = 90;
        _loc1_.entries = [this._PanelSkin_GradientEntry7_c(), this._PanelSkin_GradientEntry8_c()];
        return _loc1_;
    }

    private function _PanelSkin_GradientEntry7_c(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 14342874;
        return _loc1_;
    }

    private function _PanelSkin_GradientEntry8_c(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 12961221;
        return _loc1_;
    }

    private function _PanelSkin_Group9_i(): Group {
        var _loc1_: Group = new Group();
        _loc1_.left = 0;
        _loc1_.right = 0;
        _loc1_.top = 1;
        _loc1_.bottom = 1;
        _loc1_.minWidth = 0;
        _loc1_.minHeight = 0;
        _loc1_.layout = this._PanelSkin_HorizontalLayout1_c();
        _loc1_.id = "controlBarGroup";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.controlBarGroup = _loc1_;
        BindingManager.executeBindings(this, "controlBarGroup", this.controlBarGroup);
        return _loc1_;
    }

    private function _PanelSkin_HorizontalLayout1_c(): HorizontalLayout {
        var _loc1_: HorizontalLayout = new HorizontalLayout();
        _loc1_.paddingLeft = 10;
        _loc1_.paddingRight = 10;
        _loc1_.paddingTop = 7;
        _loc1_.paddingBottom = 7;
        _loc1_.gap = 10;
        return _loc1_;
    }

    private function _PanelSkin_bindingsSetup(): Array {
        var _loc1_: * = [];
        _loc1_[0] = new Binding(this, null, null, "topGroup.mask", "topGroupMask");
        _loc1_[1] = new Binding(this, null, null, "_PanelSkin_Group8.mask", "bottomGroupMask");
        return _loc1_;
    }

    [Bindable(event="propertyChange")]
    public function get _PanelSkin_Group1(): Group {
        return this._747650929_PanelSkin_Group1;
    }

    public function set _PanelSkin_Group1(param1: Group): void {
        var _loc2_: Object = this._747650929_PanelSkin_Group1;
        if (_loc2_ !== param1) {
            this._747650929_PanelSkin_Group1 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_PanelSkin_Group1", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get background(): Rect {
        return this._1332194002background;
    }

    public function set background(param1: Rect): void {
        var _loc2_: Object = this._1332194002background;
        if (_loc2_ !== param1) {
            this._1332194002background = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "background", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get backgroundFill(): SolidColor {
        return this._1427077073backgroundFill;
    }

    public function set backgroundFill(param1: SolidColor): void {
        var _loc2_: Object = this._1427077073backgroundFill;
        if (_loc2_ !== param1) {
            this._1427077073backgroundFill = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "backgroundFill", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get border(): Rect {
        return this._1383304148border;
    }

    public function set border(param1: Rect): void {
        var _loc2_: Object = this._1383304148border;
        if (_loc2_ !== param1) {
            this._1383304148border = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "border", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get borderStroke(): SolidColorStroke {
        return this._1395787140borderStroke;
    }

    public function set borderStroke(param1: SolidColorStroke): void {
        var _loc2_: Object = this._1395787140borderStroke;
        if (_loc2_ !== param1) {
            this._1395787140borderStroke = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "borderStroke", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get bottomGroup(): Group {
        return this._631173356bottomGroup;
    }

    public function set bottomGroup(param1: Group): void {
        var _loc2_: Object = this._631173356bottomGroup;
        if (_loc2_ !== param1) {
            this._631173356bottomGroup = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bottomGroup", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get bottomGroupMask(): Group {
        return this._1770004448bottomGroupMask;
    }

    public function set bottomGroupMask(param1: Group): void {
        var _loc2_: Object = this._1770004448bottomGroupMask;
        if (_loc2_ !== param1) {
            this._1770004448bottomGroupMask = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bottomGroupMask", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get bottomMaskRect(): Rect {
        return this._149872069bottomMaskRect;
    }

    public function set bottomMaskRect(param1: Rect): void {
        var _loc2_: Object = this._149872069bottomMaskRect;
        if (_loc2_ !== param1) {
            this._149872069bottomMaskRect = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bottomMaskRect", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get contentGroup(): Group {
        return this._809612678contentGroup;
    }

    public function set contentGroup(param1: Group): void {
        var _loc2_: Object = this._809612678contentGroup;
        if (_loc2_ !== param1) {
            this._809612678contentGroup = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "contentGroup", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get contents(): Group {
        return this._567321830contents;
    }

    public function set contents(param1: Group): void {
        var _loc2_: Object = this._567321830contents;
        if (_loc2_ !== param1) {
            this._567321830contents = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "contents", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get controlBarGroup(): Group {
        return this._139410089controlBarGroup;
    }

    public function set controlBarGroup(param1: Group): void {
        var _loc2_: Object = this._139410089controlBarGroup;
        if (_loc2_ !== param1) {
            this._139410089controlBarGroup = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "controlBarGroup", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get dropShadow(): RectangularDropShadow {
        return this._906978543dropShadow;
    }

    public function set dropShadow(param1: RectangularDropShadow): void {
        var _loc2_: Object = this._906978543dropShadow;
        if (_loc2_ !== param1) {
            this._906978543dropShadow = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dropShadow", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get tbDiv(): Rect {
        return this._110116675tbDiv;
    }

    public function set tbDiv(param1: Rect): void {
        var _loc2_: Object = this._110116675tbDiv;
        if (_loc2_ !== param1) {
            this._110116675tbDiv = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tbDiv", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get tbFill(): Rect {
        return this._881290991tbFill;
    }

    public function set tbFill(param1: Rect): void {
        var _loc2_: Object = this._881290991tbFill;
        if (_loc2_ !== param1) {
            this._881290991tbFill = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tbFill", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get tbHilite(): Rect {
        return this._754825923tbHilite;
    }

    public function set tbHilite(param1: Rect): void {
        var _loc2_: Object = this._754825923tbHilite;
        if (_loc2_ !== param1) {
            this._754825923tbHilite = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tbHilite", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get titleDisplay(): Label {
        return this._1893287094titleDisplay;
    }

    public function set titleDisplay(param1: Label): void {
        var _loc2_: Object = this._1893287094titleDisplay;
        if (_loc2_ !== param1) {
            this._1893287094titleDisplay = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "titleDisplay", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get topGroup(): Group {
        return this._988229078topGroup;
    }

    public function set topGroup(param1: Group): void {
        var _loc2_: Object = this._988229078topGroup;
        if (_loc2_ !== param1) {
            this._988229078topGroup = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "topGroup", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get topGroupMask(): Group {
        return this._181676086topGroupMask;
    }

    public function set topGroupMask(param1: Group): void {
        var _loc2_: Object = this._181676086topGroupMask;
        if (_loc2_ !== param1) {
            this._181676086topGroupMask = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "topGroupMask", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get topMaskRect(): Rect {
        return this._1437106021topMaskRect;
    }

    public function set topMaskRect(param1: Rect): void {
        var _loc2_: Object = this._1437106021topMaskRect;
        if (_loc2_ !== param1) {
            this._1437106021topMaskRect = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "topMaskRect", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get hostComponent(): Panel {
        return this._213507019hostComponent;
    }

    public function set hostComponent(param1: Panel): void {
        var _loc2_: Object = this._213507019hostComponent;
        if (_loc2_ !== param1) {
            this._213507019hostComponent = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hostComponent", _loc2_, param1));
            }
        }
    }
}
}
