package package_51 {

import flash.display.Bitmap;
import flash.display.DisplayObject;
import flash.utils.getDefinitionByName;

import mx.binding.Binding;
import mx.binding.BindingManager;
import mx.binding.IBindingClient;
import mx.binding.IWatcherSetupUtil2;
import mx.collections.IList;
import mx.controls.Text;
import mx.core.ClassFactory;
import mx.core.DeferredInstanceFromFunction;
import mx.core.IFlexModuleFactory;
import mx.core.ScrollPolicy;
import mx.core.mx_internal;
import mx.events.PropertyChangeEvent;
import mx.graphics.BitmapScaleMode;
import mx.graphics.SolidColor;

import net.bigpoint.darkorbit.class_18;
import net.bigpoint.darkorbit.mvc.common.view.components.DOViewContainerBase;
import net.bigpoint.darkorbit.mvc.common.view.components.DOWindow;
import net.bigpoint.darkorbit.mvc.common.view.components.resultHeader.view.ResultHeaderLabel;
import net.bigpoint.darkorbit.mvc.common.view.skins.DOOuterViewContainerSkin;

import package_151.class_989;
import package_151.class_995;

import package_152.class_990;

import package_153.class_993;
import package_153.class_994;

import package_4.class_991;
import package_4.class_992;

import package_8.VectorCollection;

import package_92.class_996;

import spark.components.Group;
import spark.components.HGroup;
import spark.components.Image;
import spark.components.ScrollSnappingMode;
import spark.components.SkinnableContainer;
import spark.components.TabBar;
import spark.components.VGroup;
import spark.events.IndexChangeEvent;
import spark.layouts.HorizontalAlign;
import spark.layouts.HorizontalLayout;
import spark.layouts.VerticalAlign;
import spark.layouts.VerticalLayout;
import spark.primitives.Rect;

public class class_141 extends DOWindow implements IBindingClient {

    private static var _watcherSetupUtil: IWatcherSetupUtil2;


    public var _TDMMatchResultWindow_Group2: Group;

    public var _TDMMatchResultWindow_HGroup1: HGroup;

    public var _TDMMatchResultWindow_TDMRewardIcon1: class_992;

    public var _TDMMatchResultWindow_Text1: Text;

    public var _TDMMatchResultWindow_VGroup2: VGroup;

    public var _TDMMatchResultWindow_VerticalLayout1: VerticalLayout;

    private var var_929: class_993;

    private var var_782: Image;

    private var var_2240: TabBar;

    private var var_2374: ResultHeaderLabel;

    private var var_647: VGroup;

    private var __moduleFactoryInitialized: Boolean = false;

    private var var_2045: Bitmap;

    private var var_4865: String;

    private var var_1644: VectorCollection;

    private var var_4511: VectorCollection;

    private var var_1509: class_989;

    mx_internal var _bindings: Array;

    mx_internal var _watchers: Array;

    mx_internal var _bindingsByDestination: Object;

    mx_internal var _bindingsBeginWithWord: Object;

    public function class_141() {
        var bindings: Array;
        var watchers: Array;
        var var_1: uint;
        var target: Object = null;
        var watcherSetupUtilClass: Object = null;
        this.var_1644 = new VectorCollection();
        this.mx_internal::_bindings = [];
        this.mx_internal::_watchers = [];
        this.mx_internal::_bindingsByDestination = {};
        this.mx_internal::_bindingsBeginWithWord = {};
        super();
        mx_internal::_document = this;
        bindings = this.method_4078();
        watchers = [];
        target = this;
        if (_watcherSetupUtil == null) {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_tdm_matchresultWindow_view_window_TDMMatchResultWindowWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
        }
        _watcherSetupUtil.setup(this, function (param1: String): * {
            return target[param1];
        }, function (param1: String): * {
            return class_141[param1];
        }, bindings, watchers);
        mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
        mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
        this.width = 500;
        this.height = 450;
        this.styleName = "tdmResultWindow";
        this.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_4927);
        var_1 = 0;
        while (var_1 < bindings.length) {
            Binding(bindings[var_1]).execute();
            var_1++;
        }
    }

    public static function set watcherSetupUtil(param1: IWatcherSetupUtil2): void {
        class_141._watcherSetupUtil = param1;
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

    public function setHeaderImage(param1: Bitmap): void {
        this._headerImage = param1;
    }

    public function set headerText(param1: String): void {
        this.victoryLabel.headerText = param1.toUpperCase();
    }

    public function set name_122(param1: String): void {
        this._hint = param1;
    }

    public function set method_3279(param1: DisplayObject): void {
        this.victoryLabel.texture = param1;
    }

    public function set gradient(param1: DisplayObject): void {
        this.victoryLabel.gradient = param1;
    }

    public function set method_1027(param1: class_990): void {
        this.method_1167 = param1.method_6092;
        this._rewards = param1.rewards;
        this._hint = param1.name_122;
    }

    public function set effectImg(param1: DisplayObject): void {
        this.victoryLabel.effectImg = param1;
    }

    public function set backGround(param1: DisplayObject): void {
        this.victoryLabel.backGround = param1;
    }

    private function set method_1167(param1: Vector.<class_995>): void {
        this._tabs.source = param1;
        this.method_5000(Math.max(0, this.tabBar.selectedIndex));
    }

    private function method_5971(param1: IndexChangeEvent): void {
        var _loc2_: int = param1.newIndex;
        this.method_5000(_loc2_);
    }

    private function method_5000(param1: int): void {
        this._accordionData = (this._tabs[param1] as class_995).method_4197;
    }

    private function method_4927(): Array {
        return [this.method_1467()];
    }

    private function method_1467(): VGroup {
        var _loc1_: VGroup = new VGroup();
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 100;
        _loc1_.visible = true;
        _loc1_.paddingBottom = 10;
        _loc1_.mxmlContent = [this.method_1111(), this.method_1016(), this.method_4764()];
        _loc1_.id = "windowContainer";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.windowContainer = _loc1_;
        BindingManager.executeBindings(this, "windowContainer", this.windowContainer);
        return _loc1_;
    }

    private function method_1111(): Group {
        var _loc1_: Group = new Group();
        _loc1_.percentWidth = 99.5;
        _loc1_.mouseEnabled = false;
        _loc1_.mouseChildren = false;
        _loc1_.mask = this.method_4393();
        _loc1_.mxmlContent = [this.method_1210(), this.method_5471()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_4393(): Group {
        var _loc1_: Group = new Group();
        _loc1_.mxmlContent = [this.method_3815()];
        _loc1_.id = "_TDMMatchResultWindow_Group2";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this._TDMMatchResultWindow_Group2 = _loc1_;
        BindingManager.executeBindings(this, "_TDMMatchResultWindow_Group2", this._TDMMatchResultWindow_Group2);
        return _loc1_;
    }

    private function method_3815(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 100;
        _loc1_.fill = this.method_2242();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function method_2242(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        _loc1_.color = 65280;
        _loc1_.alpha = 1;
        return _loc1_;
    }

    private function method_1210(): Image {
        var _loc1_: Image = new Image();
        _loc1_.percentHeight = 90;
        _loc1_.right = 0;
        _loc1_.left = 0;
        _loc1_.id = "headerPic";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.headerPic = _loc1_;
        BindingManager.executeBindings(this, "headerPic", this.headerPic);
        return _loc1_;
    }

    private function method_5471(): VGroup {
        var _loc1_: VGroup = new VGroup();
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 100;
        _loc1_.mxmlContent = [this.method_2962()];
        _loc1_.id = "_TDMMatchResultWindow_VGroup2";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this._TDMMatchResultWindow_VGroup2 = _loc1_;
        BindingManager.executeBindings(this, "_TDMMatchResultWindow_VGroup2", this._TDMMatchResultWindow_VGroup2);
        return _loc1_;
    }

    private function method_2962(): HGroup {
        var _loc1_: HGroup = new HGroup();
        _loc1_.percentWidth = 100;
        _loc1_.mxmlContent = [this.method_683()];
        _loc1_.id = "_TDMMatchResultWindow_HGroup1";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this._TDMMatchResultWindow_HGroup1 = _loc1_;
        BindingManager.executeBindings(this, "_TDMMatchResultWindow_HGroup1", this._TDMMatchResultWindow_HGroup1);
        return _loc1_;
    }

    private function method_683(): ResultHeaderLabel {
        var _loc1_: ResultHeaderLabel = new ResultHeaderLabel();
        _loc1_.id = "victoryLabel";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.victoryLabel = _loc1_;
        BindingManager.executeBindings(this, "victoryLabel", this.victoryLabel);
        return _loc1_;
    }

    private function method_1016(): SkinnableContainer {
        var _loc1_: SkinnableContainer = new SkinnableContainer();
        _loc1_.bottom = 25;
        _loc1_.top = 26;
        _loc1_.left = 25;
        _loc1_.right = 25;
        _loc1_.styleName = "tdmResultBorder";
        _loc1_.percentWidth = 90;
        _loc1_.layout = this.method_5647();
        _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_4935);
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_5647(): HorizontalLayout {
        return new HorizontalLayout();
    }

    private function method_4935(): Array {
        return [this.method_5669()];
    }

    private function method_5669(): VGroup {
        var _loc1_: VGroup = new VGroup();
        _loc1_.percentHeight = 100;
        _loc1_.percentWidth = 100;
        _loc1_.gap = 0;
        _loc1_.mxmlContent = [this.method_5010(), this.method_6249()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_5010(): Group {
        var _loc1_: Group = new Group();
        _loc1_.percentWidth = 100;
        _loc1_.mxmlContent = [this.method_3708(), this.method_2806()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_3708(): TabBar {
        var _loc1_: TabBar = new TabBar();
        _loc1_.percentWidth = 100;
        _loc1_.left = 7;
        _loc1_.top = 7;
        _loc1_.setStyle("skinClass", class_991);
        _loc1_.addEventListener("change", this.method_381);
        _loc1_.id = "tabBar";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.tabBar = _loc1_;
        BindingManager.executeBindings(this, "tabBar", this.tabBar);
        return _loc1_;
    }

    public function method_381(param1: IndexChangeEvent): void {
        this.method_5971(param1);
    }

    private function method_2806(): class_992 {
        var _loc1_: class_992 = new class_992();
        _loc1_.percentHeight = 100;
        _loc1_.right = 7;
        _loc1_.top = 0;
        _loc1_.id = "_TDMMatchResultWindow_TDMRewardIcon1";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this._TDMMatchResultWindow_TDMRewardIcon1 = _loc1_;
        BindingManager.executeBindings(this, "_TDMMatchResultWindow_TDMRewardIcon1", this._TDMMatchResultWindow_TDMRewardIcon1);
        return _loc1_;
    }

    private function method_6249(): SkinnableContainer {
        var _loc1_: SkinnableContainer = new SkinnableContainer();
        _loc1_.height = 200;
        _loc1_.percentWidth = 100;
        _loc1_.styleName = "tdmResult";
        _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_6113);
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_6113(): Array {
        return [this.method_5504()];
    }

    private function method_5504(): Group {
        var _loc1_: Group = new Group();
        _loc1_.percentWidth = 100;
        _loc1_.focusEnabled = false;
        _loc1_.percentHeight = 100;
        _loc1_.mxmlContent = [this.method_5294()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_5294(): class_993 {
        var _loc1_: class_993 = new class_993();
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 100;
        _loc1_.hasFocusableChildren = false;
        _loc1_.allowMultipleSelection = true;
        _loc1_.focusEnabled = false;
        _loc1_.useVirtualLayout = true;
        _loc1_.styleName = "skinnedList";
        _loc1_.method_5477 = 1;
        _loc1_.itemRenderer = this.method_4500();
        _loc1_.layout = this.method_1517();
        _loc1_.setStyle("contentBackgroundAlpha", 0);
        _loc1_.setStyle("borderVisible", false);
        _loc1_.id = "accordion";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.accordion = _loc1_;
        BindingManager.executeBindings(this, "accordion", this.accordion);
        return _loc1_;
    }

    private function method_4500(): ClassFactory {
        var _loc1_: ClassFactory = new ClassFactory();
        _loc1_.generator = class_994;
        return _loc1_;
    }

    private function method_1517(): VerticalLayout {
        var _loc1_: VerticalLayout = new VerticalLayout();
        _loc1_.gap = 0;
        _loc1_.requestedRowCount = -1;
        this._TDMMatchResultWindow_VerticalLayout1 = _loc1_;
        BindingManager.executeBindings(this, "_TDMMatchResultWindow_VerticalLayout1", this._TDMMatchResultWindow_VerticalLayout1);
        return _loc1_;
    }

    private function method_4764(): Group {
        var _loc1_: Group = new Group();
        _loc1_.percentWidth = 90;
        _loc1_.mouseEnabled = false;
        _loc1_.mouseChildren = false;
        _loc1_.mxmlContent = [this.method_2940(), this.method_6094()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_2940(): DOViewContainerBase {
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

    private function method_6094(): Text {
        var _loc1_: Text = new Text();
        _loc1_.percentWidth = 100;
        _loc1_.setStyle("fontSize", 11);
        _loc1_.setStyle("paddingTop", 4);
        _loc1_.setStyle("paddingBottom", 4);
        _loc1_.setStyle("paddingLeft", 6);
        _loc1_.setStyle("paddingRight", 6);
        _loc1_.id = "_TDMMatchResultWindow_Text1";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this._TDMMatchResultWindow_Text1 = _loc1_;
        BindingManager.executeBindings(this, "_TDMMatchResultWindow_Text1", this._TDMMatchResultWindow_Text1);
        return _loc1_;
    }

    private function method_4078(): Array {
        var var_5: Array = [];
        var_5[0] = new Binding(this, function (): Number {
            return this.width;
        }, null, "windowContainer.maxWidth");
        var_5[1] = new Binding(this, function (): String {
            var _loc1_: * = HorizontalAlign.CENTER;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, null, "windowContainer.horizontalAlign");
        var_5[2] = new Binding(this, function (): String {
            var _loc1_: * = VerticalAlign.TOP;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, null, "windowContainer.verticalAlign");
        var_5[3] = new Binding(this, function (): Number {
            return headerPic.width;
        }, null, "_TDMMatchResultWindow_Group2.width");
        var_5[4] = new Binding(this, function (): Number {
            return headerPic.height;
        }, null, "_TDMMatchResultWindow_Group2.height");
        var_5[5] = new Binding(this, function (): Object {
            return _headerImage;
        }, null, "headerPic.source");
        var_5[6] = new Binding(this, function (): Number {
            return this.width;
        }, null, "headerPic.maxWidth");
        var_5[7] = new Binding(this, function (): String {
            var _loc1_: * = BitmapScaleMode.STRETCH;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, null, "headerPic.scaleMode");
        var_5[8] = new Binding(this, function (): String {
            var _loc1_: * = VerticalAlign.MIDDLE;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, null, "_TDMMatchResultWindow_VGroup2.verticalAlign");
        var_5[9] = new Binding(this, function (): String {
            var _loc1_: * = HorizontalAlign.CENTER;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, null, "_TDMMatchResultWindow_VGroup2.horizontalAlign");
        var_5[10] = new Binding(this, function (): String {
            var _loc1_: * = HorizontalAlign.CENTER;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, null, "_TDMMatchResultWindow_HGroup1.horizontalAlign");
        var_5[11] = new Binding(this, function (): Number {
            return this.width;
        }, null, "victoryLabel.maxWidth");
        var_5[12] = new Binding(this, function (): String {
            var _loc1_: * = class_18.const_183;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, null, "victoryLabel.font");
        var_5[13] = new Binding(this, function (): int {
            return class_996.const_819;
        }, null, "victoryLabel.fontSize");
        var_5[14] = new Binding(this, function (): int {
            return class_996.const_327;
        }, null, "victoryLabel.trackingLeft");
        var_5[15] = new Binding(this, function (): IList {
            return _tabs;
        }, null, "tabBar.dataProvider");
        var_5[16] = new Binding(this, function (): Object {
            return _rewards;
        }, null, "_TDMMatchResultWindow_TDMRewardIcon1.data");
        var_5[17] = new Binding(this, function (): String {
            var _loc1_: * = ScrollPolicy.OFF;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, function (param1: String): void {
            accordion.setStyle("horizontalScrollPolicy", param1);
        }, "accordion.horizontalScrollPolicy");
        var_5[18] = new Binding(this, function (): String {
            var _loc1_: * = ScrollPolicy.AUTO;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, function (param1: String): void {
            accordion.setStyle("verticalScrollPolicy", param1);
        }, "accordion.verticalScrollPolicy");
        var_5[19] = new Binding(this, function (): String {
            var _loc1_: * = ScrollSnappingMode.LEADING_EDGE;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, null, "accordion.scrollSnappingMode");
        var_5[20] = new Binding(this, function (): IList {
            return _accordionData;
        }, null, "accordion.dataProvider");
        var_5[21] = new Binding(this, function (): String {
            var _loc1_: * = HorizontalAlign.CONTENT_JUSTIFY;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, null, "_TDMMatchResultWindow_VerticalLayout1.horizontalAlign");
        var_5[22] = new Binding(this, function (): String {
            var _loc1_: * = _hint;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, null, "_TDMMatchResultWindow_Text1.htmlText");
        var_5[23] = new Binding(this, function (): String {
            var _loc1_: * = class_18.const_1851;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, function (param1: String): void {
            _TDMMatchResultWindow_Text1.setStyle("fontFamily", param1);
        }, "_TDMMatchResultWindow_Text1.fontFamily");
        return var_5;
    }

    [Bindable(event="propertyChange")]
    public function get accordion(): class_993 {
        return this.var_929;
    }

    public function set accordion(param1: class_993): void {
        var _loc2_: Object = this.var_929;
        if (_loc2_ !== param1) {
            this.var_929 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "accordion", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get headerPic(): Image {
        return this.var_782;
    }

    public function set headerPic(param1: Image): void {
        var _loc2_: Object = this.var_782;
        if (_loc2_ !== param1) {
            this.var_782 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "headerPic", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get tabBar(): TabBar {
        return this.var_2240;
    }

    public function set tabBar(param1: TabBar): void {
        var _loc2_: Object = this.var_2240;
        if (_loc2_ !== param1) {
            this.var_2240 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBar", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get victoryLabel(): ResultHeaderLabel {
        return this.var_2374;
    }

    public function set victoryLabel(param1: ResultHeaderLabel): void {
        var _loc2_: Object = this.var_2374;
        if (_loc2_ !== param1) {
            this.var_2374 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "victoryLabel", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get windowContainer(): VGroup {
        return this.var_647;
    }

    public function set windowContainer(param1: VGroup): void {
        var _loc2_: Object = this.var_647;
        if (_loc2_ !== param1) {
            this.var_647 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "windowContainer", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    private function get _headerImage(): Bitmap {
        return this.var_2045;
    }

    private function set _headerImage(param1: Bitmap): void {
        var _loc2_: Object = this.var_2045;
        if (_loc2_ !== param1) {
            this.var_2045 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_headerImage", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    private function get _hint(): String {
        return this.var_4865;
    }

    private function set _hint(param1: String): void {
        var _loc2_: Object = this.var_4865;
        if (_loc2_ !== param1) {
            this.var_4865 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_hint", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    private function get _tabs(): VectorCollection {
        return this.var_1644;
    }

    private function set _tabs(param1: VectorCollection): void {
        var _loc2_: Object = this.var_1644;
        if (_loc2_ !== param1) {
            this.var_1644 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_tabs", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    private function get _accordionData(): VectorCollection {
        return this.var_4511;
    }

    private function set _accordionData(param1: VectorCollection): void {
        var _loc2_: Object = this.var_4511;
        if (_loc2_ !== param1) {
            this.var_4511 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_accordionData", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    private function get _rewards(): class_989 {
        return this.var_1509;
    }

    private function set _rewards(param1: class_989): void {
        var _loc2_: Object = this.var_1509;
        if (_loc2_ !== param1) {
            this.var_1509 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_rewards", _loc2_, param1));
            }
        }
    }
}
}
