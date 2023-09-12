package package_5 {

import flash.utils.getDefinitionByName;

import mx.binding.Binding;
import mx.binding.BindingManager;
import mx.binding.IBindingClient;
import mx.binding.IWatcherSetupUtil2;
import mx.core.ClassFactory;
import mx.core.IFlexModuleFactory;
import mx.core.IStateClient2;
import mx.core.mx_internal;
import mx.events.FlexEvent;
import mx.events.PropertyChangeEvent;
import mx.graphics.SolidColor;
import mx.graphics.SolidColorStroke;
import mx.states.SetProperty;
import mx.states.State;

import net.bigpoint.darkorbit.mvc.common.view.skins.DOSkinnable9ScaleContainerSkin;

import spark.components.DataGrid;
import spark.components.Grid;
import spark.components.GridColumnHeaderGroup;
import spark.components.Group;
import spark.components.Scroller;
import spark.components.SkinnableContainer;
import spark.components.VGroup;
import spark.components.gridClasses.GridLayer;
import spark.primitives.Line;
import spark.primitives.Rect;
import spark.skins.SparkSkin;
import spark.skins.spark.DefaultGridItemRenderer;

public class class_4 extends SparkSkin implements IBindingClient, IStateClient2 {

    private static const exclusions: Array = ["scroller", "background", "columnHeaderGroup"];

    private static const contentFill: Array = ["bgFill"];

    private static var _watcherSetupUtil: IWatcherSetupUtil2;


    private var _1277490047alternatingRowColorsBackground: ClassFactory;

    private var _1332194002background: Rect;

    private var _1391998104bgFill: SolidColor;

    private var _1383304148border: SkinnableContainer;

    private var _502679092caretIndicator: ClassFactory;

    private var _1482148164columnHeaderGroup: GridColumnHeaderGroup;

    private var _237342767columnSeparator: ClassFactory;

    private var _1555036382editorIndicator: ClassFactory;

    private var _3181382grid: Grid;

    private var _1346001378headerColumnSeparator: ClassFactory;

    private var _1027582576headerRenderer: ClassFactory;

    private var _1683467992headerSeparator: Line;

    private var _1933789133hoverIndicator: ClassFactory;

    private var _402164678scroller: Scroller;

    private var _627206627selectionIndicator: ClassFactory;

    private var __moduleFactoryInitialized: Boolean = false;

    mx_internal var _bindings: Array;

    mx_internal var _watchers: Array;

    mx_internal var _bindingsByDestination: Object;

    mx_internal var _bindingsBeginWithWord: Object;

    private var _213507019hostComponent: DataGrid;

    public function class_4() {
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
        bindings = this.method_4527();
        watchers = [];
        target = this;
        if (_watcherSetupUtil == null) {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_jackpotBattle_resultWin_view_skin_JackpotWindowItemListSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
        }
        _watcherSetupUtil.setup(this, function (param1: String): * {
            return target[param1];
        }, function (param1: String): * {
            return class_4[param1];
        }, bindings, watchers);
        mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
        mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
        this.minWidth = 89;
        this.minHeight = 84;
        this.mxmlContent = [this.method_698(), this.method_6153()];
        this.currentState = "normal";
        this.method_2988();
        this.method_3468();
        this.method_2757();
        this.method_223();
        this.method_2427();
        this.method_5688();
        this.method_3912();
        this.method_1920();
        this.addEventListener("preinitialize", this.method_2944);
        states = [new State({
            "name": "normal",
            "overrides": []
        }), new State({
            "name": "disabled",
            "overrides": [new SetProperty().initializeFromObject({
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
        class_4._watcherSetupUtil = param1;
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

    protected function method_1320(): void {
        var _loc1_: String = this.getStyle("libID");
        var _loc2_: String = this.getStyle("scale9Grid");
        var _loc3_: String = this.getStyle("skinID");
        this.border.setStyle("libID", _loc1_);
        this.border.setStyle("skinID", _loc3_);
        this.border.setStyle("scale9Grid", _loc2_);
        this.border.setStyle("skinClass", DOSkinnable9ScaleContainerSkin);
    }

    override public function get colorizeExclusions(): Array {
        return exclusions;
    }

    override public function get contentItems(): Array {
        return contentFill;
    }

    override protected function initializationComplete(): void {
        useChromeColor = true;
        super.initializationComplete();
    }

    override protected function updateDisplayList(param1: Number, param2: Number): void {
        if (getStyle("borderVisible") == true) {
            this.border.visible = true;
            this.scroller.minViewportInset = 1;
        } else {
            this.border.visible = false;
            this.scroller.minViewportInset = 0;
        }
        super.updateDisplayList(param1, param2);
    }

    private function method_2988(): ClassFactory {
        var _loc1_: ClassFactory = new ClassFactory();
        _loc1_.generator = class_23;
        _loc1_.properties = {"outerDocument": this};
        this.alternatingRowColorsBackground = _loc1_;
        BindingManager.executeBindings(this, "alternatingRowColorsBackground", this.alternatingRowColorsBackground);
        return _loc1_;
    }

    private function method_3468(): ClassFactory {
        var _loc1_: ClassFactory = new ClassFactory();
        _loc1_.generator = class_22;
        _loc1_.properties = {"outerDocument": this};
        this.caretIndicator = _loc1_;
        BindingManager.executeBindings(this, "caretIndicator", this.caretIndicator);
        return _loc1_;
    }

    private function method_2757(): ClassFactory {
        var _loc1_: ClassFactory = new ClassFactory();
        _loc1_.generator = class_25;
        _loc1_.properties = {"outerDocument": this};
        this.columnSeparator = _loc1_;
        BindingManager.executeBindings(this, "columnSeparator", this.columnSeparator);
        return _loc1_;
    }

    private function method_223(): ClassFactory {
        var _loc1_: ClassFactory = new ClassFactory();
        _loc1_.generator = class_28;
        _loc1_.properties = {"outerDocument": this};
        this.editorIndicator = _loc1_;
        BindingManager.executeBindings(this, "editorIndicator", this.editorIndicator);
        return _loc1_;
    }

    private function method_2427(): ClassFactory {
        var _loc1_: ClassFactory = new ClassFactory();
        _loc1_.generator = class_24;
        _loc1_.properties = {"outerDocument": this};
        this.headerColumnSeparator = _loc1_;
        BindingManager.executeBindings(this, "headerColumnSeparator", this.headerColumnSeparator);
        return _loc1_;
    }

    private function method_5688(): ClassFactory {
        var _loc1_: ClassFactory = new ClassFactory();
        _loc1_.generator = class_27;
        _loc1_.properties = {"outerDocument": this};
        this.headerRenderer = _loc1_;
        BindingManager.executeBindings(this, "headerRenderer", this.headerRenderer);
        return _loc1_;
    }

    private function method_3912(): ClassFactory {
        var _loc1_: ClassFactory = new ClassFactory();
        _loc1_.generator = class_26;
        _loc1_.properties = {"outerDocument": this};
        this.hoverIndicator = _loc1_;
        BindingManager.executeBindings(this, "hoverIndicator", this.hoverIndicator);
        return _loc1_;
    }

    private function method_1920(): ClassFactory {
        var _loc1_: ClassFactory = new ClassFactory();
        _loc1_.generator = class_29;
        _loc1_.properties = {"outerDocument": this};
        this.selectionIndicator = _loc1_;
        BindingManager.executeBindings(this, "selectionIndicator", this.selectionIndicator);
        return _loc1_;
    }

    private function method_698(): VGroup {
        var _loc1_: VGroup = new VGroup();
        _loc1_.horizontalAlign = "justify";
        _loc1_.gap = 0;
        _loc1_.left = 1;
        _loc1_.right = 1;
        _loc1_.top = 0;
        _loc1_.bottom = 0;
        _loc1_.mxmlContent = [this.method_2836(), this.method_3490()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_2836(): GridColumnHeaderGroup {
        var _loc1_: GridColumnHeaderGroup = new GridColumnHeaderGroup();
        _loc1_.minHeight = 21;
        _loc1_.setStyle("paddingLeft", 1);
        _loc1_.setStyle("paddingTop", 1);
        _loc1_.setStyle("paddingRight", 1);
        _loc1_.id = "columnHeaderGroup";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.columnHeaderGroup = _loc1_;
        BindingManager.executeBindings(this, "columnHeaderGroup", this.columnHeaderGroup);
        return _loc1_;
    }

    private function method_3490(): Group {
        var _loc1_: Group = new Group();
        _loc1_.percentHeight = 100;
        _loc1_.mxmlContent = [this.method_5683(), this.method_3844()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_5683(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 1;
        _loc1_.right = 1;
        _loc1_.top = 1;
        _loc1_.bottom = 1;
        _loc1_.alpha = 0;
        _loc1_.fill = this.method_81();
        _loc1_.initialized(this, "background");
        this.background = _loc1_;
        BindingManager.executeBindings(this, "background", this.background);
        return _loc1_;
    }

    private function method_81(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        _loc1_.color = 16777215;
        this.bgFill = _loc1_;
        BindingManager.executeBindings(this, "bgFill", this.bgFill);
        return _loc1_;
    }

    private function method_3844(): VGroup {
        var _loc1_: VGroup = new VGroup();
        _loc1_.horizontalAlign = "justify";
        _loc1_.percentHeight = 100;
        _loc1_.percentWidth = 100;
        _loc1_.gap = -1;
        _loc1_.mxmlContent = [this.method_870(), this.method_2284()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_870(): Line {
        var _loc1_: Line = new Line();
        _loc1_.stroke = this.method_934();
        _loc1_.initialized(this, "headerSeparator");
        this.headerSeparator = _loc1_;
        BindingManager.executeBindings(this, "headerSeparator", this.headerSeparator);
        return _loc1_;
    }

    private function method_934(): SolidColorStroke {
        var _loc1_: SolidColorStroke = new SolidColorStroke();
        _loc1_.color = 2961714;
        _loc1_.weight = 1;
        _loc1_.caps = "square";
        return _loc1_;
    }

    private function method_2284(): Scroller {
        var _loc1_: Scroller = new Scroller();
        _loc1_.minViewportInset = 1;
        _loc1_.hasFocusableChildren = false;
        _loc1_.percentHeight = 100;
        _loc1_.styleName = "skinnedScroller";
        _loc1_.viewport = this.method_3755();
        _loc1_.setStyle("horizontalScrollPolicy", "off");
        _loc1_.id = "scroller";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.scroller = _loc1_;
        BindingManager.executeBindings(this, "scroller", this.scroller);
        return _loc1_;
    }

    private function method_3755(): Grid {
        var _loc1_: Grid = new Grid();
        _loc1_.itemRenderer = this.method_2472();
        _loc1_.mxmlContent = [this.method_143(), this.method_2561(), this.method_1633(), this.method_5106(), this.method_326()];
        _loc1_.id = "grid";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.grid = _loc1_;
        BindingManager.executeBindings(this, "grid", this.grid);
        return _loc1_;
    }

    private function method_2472(): ClassFactory {
        var _loc1_: ClassFactory = new ClassFactory();
        _loc1_.generator = DefaultGridItemRenderer;
        return _loc1_;
    }

    private function method_143(): GridLayer {
        var _loc1_: GridLayer = new GridLayer();
        _loc1_.name = "backgroundLayer";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_2561(): GridLayer {
        var _loc1_: GridLayer = new GridLayer();
        _loc1_.name = "selectionLayer";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_1633(): GridLayer {
        var _loc1_: GridLayer = new GridLayer();
        _loc1_.name = "editorIndicatorLayer";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_5106(): GridLayer {
        var _loc1_: GridLayer = new GridLayer();
        _loc1_.name = "rendererLayer";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_326(): GridLayer {
        var _loc1_: GridLayer = new GridLayer();
        _loc1_.name = "overlayLayer";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_6153(): SkinnableContainer {
        var _loc1_: SkinnableContainer = new SkinnableContainer();
        _loc1_.bottom = 0;
        _loc1_.top = 0;
        _loc1_.left = 0;
        _loc1_.right = 0;
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 100;
        _loc1_.mouseChildren = false;
        _loc1_.mouseEnabled = false;
        _loc1_.id = "border";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.border = _loc1_;
        BindingManager.executeBindings(this, "border", this.border);
        return _loc1_;
    }

    public function method_2944(param1: FlexEvent): void {
        this.method_1320();
    }

    private function method_4527(): Array {
        var _loc1_: * = [];
        _loc1_[0] = new Binding(this, null, null, "columnHeaderGroup.columnSeparator", "headerColumnSeparator");
        _loc1_[1] = new Binding(this, null, null, "columnHeaderGroup.headerRenderer", "headerRenderer");
        return _loc1_;
    }

    [Bindable(event="propertyChange")]
    public function get alternatingRowColorsBackground(): ClassFactory {
        return this._1277490047alternatingRowColorsBackground;
    }

    public function set alternatingRowColorsBackground(param1: ClassFactory): void {
        var _loc2_: Object = this._1277490047alternatingRowColorsBackground;
        if (_loc2_ !== param1) {
            this._1277490047alternatingRowColorsBackground = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "alternatingRowColorsBackground", _loc2_, param1));
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
    public function get bgFill(): SolidColor {
        return this._1391998104bgFill;
    }

    public function set bgFill(param1: SolidColor): void {
        var _loc2_: Object = this._1391998104bgFill;
        if (_loc2_ !== param1) {
            this._1391998104bgFill = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bgFill", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get border(): SkinnableContainer {
        return this._1383304148border;
    }

    public function set border(param1: SkinnableContainer): void {
        var _loc2_: Object = this._1383304148border;
        if (_loc2_ !== param1) {
            this._1383304148border = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "border", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get caretIndicator(): ClassFactory {
        return this._502679092caretIndicator;
    }

    public function set caretIndicator(param1: ClassFactory): void {
        var _loc2_: Object = this._502679092caretIndicator;
        if (_loc2_ !== param1) {
            this._502679092caretIndicator = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "caretIndicator", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get columnHeaderGroup(): GridColumnHeaderGroup {
        return this._1482148164columnHeaderGroup;
    }

    public function set columnHeaderGroup(param1: GridColumnHeaderGroup): void {
        var _loc2_: Object = this._1482148164columnHeaderGroup;
        if (_loc2_ !== param1) {
            this._1482148164columnHeaderGroup = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "columnHeaderGroup", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get columnSeparator(): ClassFactory {
        return this._237342767columnSeparator;
    }

    public function set columnSeparator(param1: ClassFactory): void {
        var _loc2_: Object = this._237342767columnSeparator;
        if (_loc2_ !== param1) {
            this._237342767columnSeparator = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "columnSeparator", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get editorIndicator(): ClassFactory {
        return this._1555036382editorIndicator;
    }

    public function set editorIndicator(param1: ClassFactory): void {
        var _loc2_: Object = this._1555036382editorIndicator;
        if (_loc2_ !== param1) {
            this._1555036382editorIndicator = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "editorIndicator", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get grid(): Grid {
        return this._3181382grid;
    }

    public function set grid(param1: Grid): void {
        var _loc2_: Object = this._3181382grid;
        if (_loc2_ !== param1) {
            this._3181382grid = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "grid", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get headerColumnSeparator(): ClassFactory {
        return this._1346001378headerColumnSeparator;
    }

    public function set headerColumnSeparator(param1: ClassFactory): void {
        var _loc2_: Object = this._1346001378headerColumnSeparator;
        if (_loc2_ !== param1) {
            this._1346001378headerColumnSeparator = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "headerColumnSeparator", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get headerRenderer(): ClassFactory {
        return this._1027582576headerRenderer;
    }

    public function set headerRenderer(param1: ClassFactory): void {
        var _loc2_: Object = this._1027582576headerRenderer;
        if (_loc2_ !== param1) {
            this._1027582576headerRenderer = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "headerRenderer", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get headerSeparator(): Line {
        return this._1683467992headerSeparator;
    }

    public function set headerSeparator(param1: Line): void {
        var _loc2_: Object = this._1683467992headerSeparator;
        if (_loc2_ !== param1) {
            this._1683467992headerSeparator = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "headerSeparator", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get hoverIndicator(): ClassFactory {
        return this._1933789133hoverIndicator;
    }

    public function set hoverIndicator(param1: ClassFactory): void {
        var _loc2_: Object = this._1933789133hoverIndicator;
        if (_loc2_ !== param1) {
            this._1933789133hoverIndicator = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hoverIndicator", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get scroller(): Scroller {
        return this._402164678scroller;
    }

    public function set scroller(param1: Scroller): void {
        var _loc2_: Object = this._402164678scroller;
        if (_loc2_ !== param1) {
            this._402164678scroller = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "scroller", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get selectionIndicator(): ClassFactory {
        return this._627206627selectionIndicator;
    }

    public function set selectionIndicator(param1: ClassFactory): void {
        var _loc2_: Object = this._627206627selectionIndicator;
        if (_loc2_ !== param1) {
            this._627206627selectionIndicator = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "selectionIndicator", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get hostComponent(): DataGrid {
        return this._213507019hostComponent;
    }

    public function set hostComponent(param1: DataGrid): void {
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
