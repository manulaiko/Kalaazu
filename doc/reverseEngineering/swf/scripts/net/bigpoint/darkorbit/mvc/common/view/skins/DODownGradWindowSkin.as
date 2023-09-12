package net.bigpoint.darkorbit.mvc.common.view.skins {

import com.greensock.layout.ScaleMode;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.BlendMode;
import flash.events.MouseEvent;
import flash.geom.Rectangle;
import flash.utils.getDefinitionByName;

import mx.binding.Binding;
import mx.binding.BindingManager;
import mx.binding.IBindingClient;
import mx.binding.IWatcherSetupUtil2;
import mx.core.DeferredInstanceFromFunction;
import mx.core.IFlexModuleFactory;
import mx.core.IStateClient2;
import mx.core.mx_internal;
import mx.events.FlexEvent;
import mx.events.PropertyChangeEvent;
import mx.events.ResizeEvent;
import mx.states.State;

import net.bigpoint.as3toolbox.guicomponents.components.Scale9GridImage;
import net.bigpoint.darkorbit.class_18;
import net.bigpoint.darkorbit.mvc.common.utils.ParserUtility;
import net.bigpoint.darkorbit.mvc.common.view.components.DOButtonBase;
import net.bigpoint.darkorbit.mvc.common.view.components.DOWindow;

import package_11.class_39;

import package_9.ResourceManager;

import spark.components.BorderContainer;
import spark.components.Group;
import spark.components.Image;
import spark.components.Label;
import spark.components.SkinnableContainer;
import spark.components.supportClasses.Skin;
import spark.primitives.BitmapImage;

public class DODownGradWindowSkin extends Skin implements IBindingClient, IStateClient2 {

    private static var _watcherSetupUtil: IWatcherSetupUtil2;


    private var _1332194002background: Group;

    private var _199389162bgImage: Image;

    private var _157783307bgImageContainer: SkinnableContainer;

    private var _196035199bgMask2: Scale9GridImage;

    private var _312699062closeButton: DOButtonBase;

    private var _809612678contentGroup: Group;

    private var _1163617998headerImage: BitmapImage;

    private var _569171721mainWindow: Group;

    private var _104976386moveArea: Group;

    private var _1728995332resizeHandle: Group;

    private var _912521036resizeHandleGraphic: DOButtonBase;

    private var _1404868679scale9Graphic: Scale9GridImage;

    private var _1893287094titleDisplay: Label;

    private var __moduleFactoryInitialized: Boolean = false;

    private var _570979939scaleBitmapData: BitmapData;

    private var _213507019hostComponent: DOWindow;

    mx_internal var _bindings: Array;

    mx_internal var _watchers: Array;

    mx_internal var _bindingsByDestination: Object;

    mx_internal var _bindingsBeginWithWord: Object;

    public function DODownGradWindowSkin() {
        var bindings: Array;
        var watchers: Array;
        var i: uint;
        var target: Object = null;
        var watcherSetupUtilClass: Object = null;
        this.mx_internal::_bindings = [];
        this.mx_internal::_watchers = [];
        this.mx_internal::_bindingsByDestination = {};
        this.mx_internal::_bindingsBeginWithWord = {};
        super();
        mx_internal::_document = this;
        bindings = this._DODownGradWindowSkin_bindingsSetup();
        watchers = [];
        target = this;
        if (_watcherSetupUtil == null) {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_common_view_skins_DODownGradWindowSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
        }
        _watcherSetupUtil.setup(this, function (param1: String): * {
            return target[param1];
        }, function (param1: String): * {
            return DODownGradWindowSkin[param1];
        }, bindings, watchers);
        mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
        mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
        this.mxmlContent = [this._DODownGradWindowSkin_Group1_i()];
        this.currentState = "normal";
        this.addEventListener("creationComplete", this.___DODownGradWindowSkin_Skin1_creationComplete);
        this.addEventListener("valueCommit", this.___DODownGradWindowSkin_Skin1_valueCommit);
        states = [new State({
            "name": "normal",
            "overrides": []
        }), new State({
            "name": "disabled",
            "overrides": []
        }), new State({
            "name": "inactive",
            "overrides": []
        }), new State({
            "name": "disabledWithControlBar",
            "overrides": []
        }), new State({
            "name": "normalWithControlBar",
            "overrides": []
        }), new State({
            "name": "inactiveWithControlBar",
            "overrides": []
        })];
        i = 0;
        while (i < bindings.length) {
            Binding(bindings[i]).execute();
            i++;
        }
    }

    public static function set watcherSetupUtil(param1: IWatcherSetupUtil2): void {
        DODownGradWindowSkin._watcherSetupUtil = param1;
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

    private function init(): void {
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc1_: * = 16777215;
        if (getStyle("titleColor")) {
            _loc1_ = getStyle("titleColor");
        }
        this.titleDisplay.setStyle("color", _loc1_);
        this.titleDisplay.setStyle("fontSize", class_18.const_1729.size);
        var _loc2_: class_39 = class_39(ResourceManager.name_15.getFinisher(getStyle("background")));
        var _loc3_: Boolean = ParserUtility.parseBooleanFromString(getStyle("resizable"));
        if (_loc3_) {
            this.resizeHandle.visible = true;
            this.resizeHandleGraphic.visible = true;
        } else {
            this.resizeHandle.visible = false;
            this.resizeHandleGraphic.visible = false;
        }
        isPopUp = true;
        if (getStyle("background")) {
            _loc4_ = class_39(ResourceManager.name_15.getFinisher("window"));
            _loc5_ = ResourceManager.getBitmap("questWin", "scale9test");
            this.scaleBitmapData = ResourceManager.getBitmapData("downGradedWindow", "downGradwindow.png");
            this.scale9Graphic.scale9Grid = new Rectangle(40, 40, 16, 16);
            this.bgImage.source = ResourceManager.getBitmapData("downGradedWindow", "bg.png");
            this.bgImage.cacheAsBitmap = true;
            this.bgMask2.cacheAsBitmap = true;
            this.bgImageContainer.cacheAsBitmap = true;
            this.bgMask2.source = ResourceManager.getBitmapData("downGradedWindow", "windowMask");
            this.bgMask2.scale9Grid = new Rectangle(40, 40, 16, 16);
            this.bgMask2.width = width;
            this.bgMask2.height = height + 3;
            this.bgImageContainer.mask = this.bgMask2;
        }
        invalidateDisplayList();
    }

    private function stateChangedComplete(): void {
        this.bgMask2.width = width;
        this.bgMask2.height = height;
        this.invalidateSize();
    }

    private function _DODownGradWindowSkin_Group1_i(): Group {
        var _loc1_: Group = new Group();
        _loc1_.mxmlContent = [this._DODownGradWindowSkin_Group2_i(), this._DODownGradWindowSkin_Group5_i(), this._DODownGradWindowSkin_DOButtonBase2_i()];
        _loc1_.id = "mainWindow";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.mainWindow = _loc1_;
        BindingManager.executeBindings(this, "mainWindow", this.mainWindow);
        return _loc1_;
    }

    private function _DODownGradWindowSkin_Group2_i(): Group {
        var _loc1_: Group = new Group();
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 100;
        _loc1_.mxmlContent = [this._DODownGradWindowSkin_SkinnableContainer1_i(), this._DODownGradWindowSkin_Scale9GridImage2_i(), this._DODownGradWindowSkin_Group3_i(), this._DODownGradWindowSkin_Group4_i()];
        _loc1_.id = "background";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.background = _loc1_;
        BindingManager.executeBindings(this, "background", this.background);
        return _loc1_;
    }

    private function _DODownGradWindowSkin_SkinnableContainer1_i(): SkinnableContainer {
        var _loc1_: SkinnableContainer = new SkinnableContainer();
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 100;
        _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._DODownGradWindowSkin_Array5_c);
        _loc1_.addEventListener("resize", this.__bgImageContainer_resize);
        _loc1_.id = "bgImageContainer";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.bgImageContainer = _loc1_;
        BindingManager.executeBindings(this, "bgImageContainer", this.bgImageContainer);
        return _loc1_;
    }

    private function _DODownGradWindowSkin_Array5_c(): Array {
        return [this._DODownGradWindowSkin_Image1_i(), this._DODownGradWindowSkin_Scale9GridImage1_i()];
    }

    private function _DODownGradWindowSkin_Image1_i(): Image {
        var _loc1_: Image = new Image();
        _loc1_.id = "bgImage";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.bgImage = _loc1_;
        BindingManager.executeBindings(this, "bgImage", this.bgImage);
        return _loc1_;
    }

    private function _DODownGradWindowSkin_Scale9GridImage1_i(): Scale9GridImage {
        var _loc1_: Scale9GridImage = new Scale9GridImage();
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 100;
        _loc1_.id = "bgMask2";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.bgMask2 = _loc1_;
        BindingManager.executeBindings(this, "bgMask2", this.bgMask2);
        return _loc1_;
    }

    public function __bgImageContainer_resize(param1: ResizeEvent): void {
        this.stateChangedComplete();
    }

    private function _DODownGradWindowSkin_Scale9GridImage2_i(): Scale9GridImage {
        var _loc1_: Scale9GridImage = new Scale9GridImage();
        _loc1_.percentWidth = 100;
        _loc1_.id = "scale9Graphic";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.scale9Graphic = _loc1_;
        BindingManager.executeBindings(this, "scale9Graphic", this.scale9Graphic);
        return _loc1_;
    }

    private function _DODownGradWindowSkin_Group3_i(): Group {
        var _loc1_: Group = new Group();
        _loc1_.top = 25;
        _loc1_.bottom = 0;
        _loc1_.left = 0;
        _loc1_.right = 0;
        _loc1_.id = "contentGroup";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.contentGroup = _loc1_;
        BindingManager.executeBindings(this, "contentGroup", this.contentGroup);
        return _loc1_;
    }

    private function _DODownGradWindowSkin_Group4_i(): Group {
        var _loc1_: Group = new Group();
        _loc1_.right = 5;
        _loc1_.bottom = 5;
        _loc1_.mxmlContent = [this._DODownGradWindowSkin_DOButtonBase1_i()];
        _loc1_.addEventListener("mouseUp", this.__resizeHandle_mouseUp);
        _loc1_.id = "resizeHandle";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.resizeHandle = _loc1_;
        BindingManager.executeBindings(this, "resizeHandle", this.resizeHandle);
        return _loc1_;
    }

    private function _DODownGradWindowSkin_DOButtonBase1_i(): DOButtonBase {
        var _loc1_: DOButtonBase = new DOButtonBase();
        _loc1_.styleName = "windowResizeHandle";
        _loc1_.setStyle("skinClass", DOButtonBaseSkin);
        _loc1_.id = "resizeHandleGraphic";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.resizeHandleGraphic = _loc1_;
        BindingManager.executeBindings(this, "resizeHandleGraphic", this.resizeHandleGraphic);
        return _loc1_;
    }

    public function __resizeHandle_mouseUp(param1: MouseEvent): void {
        this.stateChangedComplete();
    }

    private function _DODownGradWindowSkin_Group5_i(): Group {
        var _loc1_: Group = new Group();
        _loc1_.percentWidth = 100;
        _loc1_.mxmlContent = [this._DODownGradWindowSkin_BitmapImage1_i(), this._DODownGradWindowSkin_BorderContainer1_c(), this._DODownGradWindowSkin_Label1_i()];
        _loc1_.id = "moveArea";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.moveArea = _loc1_;
        BindingManager.executeBindings(this, "moveArea", this.moveArea);
        return _loc1_;
    }

    private function _DODownGradWindowSkin_BitmapImage1_i(): BitmapImage {
        var _loc1_: BitmapImage = new BitmapImage();
        _loc1_.initialized(this, "headerImage");
        this.headerImage = _loc1_;
        BindingManager.executeBindings(this, "headerImage", this.headerImage);
        return _loc1_;
    }

    private function _DODownGradWindowSkin_BorderContainer1_c(): BorderContainer {
        var _loc1_: BorderContainer = new BorderContainer();
        _loc1_.percentWidth = 100;
        _loc1_.height = 40;
        _loc1_.setStyle("backgroundAlpha", 0);
        _loc1_.setStyle("borderAlpha", 0);
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function _DODownGradWindowSkin_Label1_i(): Label {
        var _loc1_: Label = new Label();
        _loc1_.text = "";
        _loc1_.top = 12;
        _loc1_.left = 14;
        _loc1_.maxDisplayedLines = 1;
        _loc1_.percentWidth = 100;
        _loc1_.setStyle("fontFamily", "EurostileTHea");
        _loc1_.id = "titleDisplay";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.titleDisplay = _loc1_;
        BindingManager.executeBindings(this, "titleDisplay", this.titleDisplay);
        return _loc1_;
    }

    private function _DODownGradWindowSkin_DOButtonBase2_i(): DOButtonBase {
        var _loc1_: DOButtonBase = new DOButtonBase();
        _loc1_.right = 10;
        _loc1_.top = 5;
        _loc1_.useHandCursor = true;
        _loc1_.styleName = "generalWindowCloseButton";
        _loc1_.mouseChildren = false;
        _loc1_.buttonMode = true;
        _loc1_.setStyle("skinClass", DOButtonBaseSkin);
        _loc1_.id = "closeButton";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.closeButton = _loc1_;
        BindingManager.executeBindings(this, "closeButton", this.closeButton);
        return _loc1_;
    }

    public function ___DODownGradWindowSkin_Skin1_creationComplete(param1: FlexEvent): void {
        this.init();
    }

    public function ___DODownGradWindowSkin_Skin1_valueCommit(param1: FlexEvent): void {
        this.stateChangedComplete();
    }

    private function _DODownGradWindowSkin_bindingsSetup(): Array {
        var result: Array = [];
        result[0] = new Binding(this, function (): Number {
            return this.width;
        }, null, "mainWindow.width");
        result[1] = new Binding(this, function (): Number {
            return this.height;
        }, null, "mainWindow.height");
        result[2] = new Binding(this, function (): String {
            var _loc1_: * = BlendMode.LAYER;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, null, "bgImageContainer.blendMode");
        result[3] = new Binding(this, function (): String {
            var _loc1_: * = ScaleMode.NONE;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, null, "bgImage.scaleMode");
        result[4] = new Binding(this, function (): Number {
            return NaN;
        }, null, "bgMask2.minWidth");
        result[5] = new Binding(this, function (): Number {
            return NaN;
        }, null, "bgMask2.minHeight");
        result[6] = new Binding(this, function (): * {
            return scaleBitmapData;
        }, null, "scale9Graphic.source");
        result[7] = new Binding(this, function (): Number {
            return this.height;
        }, null, "scale9Graphic.height");
        return result;
    }

    [Bindable(event="propertyChange")]
    public function get background(): Group {
        return this._1332194002background;
    }

    public function set background(param1: Group): void {
        var _loc2_: Object = this._1332194002background;
        if (_loc2_ !== param1) {
            this._1332194002background = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "background", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get bgImage(): Image {
        return this._199389162bgImage;
    }

    public function set bgImage(param1: Image): void {
        var _loc2_: Object = this._199389162bgImage;
        if (_loc2_ !== param1) {
            this._199389162bgImage = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bgImage", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get bgImageContainer(): SkinnableContainer {
        return this._157783307bgImageContainer;
    }

    public function set bgImageContainer(param1: SkinnableContainer): void {
        var _loc2_: Object = this._157783307bgImageContainer;
        if (_loc2_ !== param1) {
            this._157783307bgImageContainer = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bgImageContainer", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get bgMask2(): Scale9GridImage {
        return this._196035199bgMask2;
    }

    public function set bgMask2(param1: Scale9GridImage): void {
        var _loc2_: Object = this._196035199bgMask2;
        if (_loc2_ !== param1) {
            this._196035199bgMask2 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bgMask2", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get closeButton(): DOButtonBase {
        return this._312699062closeButton;
    }

    public function set closeButton(param1: DOButtonBase): void {
        var _loc2_: Object = this._312699062closeButton;
        if (_loc2_ !== param1) {
            this._312699062closeButton = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "closeButton", _loc2_, param1));
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
    public function get headerImage(): BitmapImage {
        return this._1163617998headerImage;
    }

    public function set headerImage(param1: BitmapImage): void {
        var _loc2_: Object = this._1163617998headerImage;
        if (_loc2_ !== param1) {
            this._1163617998headerImage = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "headerImage", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get mainWindow(): Group {
        return this._569171721mainWindow;
    }

    public function set mainWindow(param1: Group): void {
        var _loc2_: Object = this._569171721mainWindow;
        if (_loc2_ !== param1) {
            this._569171721mainWindow = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mainWindow", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get moveArea(): Group {
        return this._104976386moveArea;
    }

    public function set moveArea(param1: Group): void {
        var _loc2_: Object = this._104976386moveArea;
        if (_loc2_ !== param1) {
            this._104976386moveArea = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "moveArea", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get resizeHandle(): Group {
        return this._1728995332resizeHandle;
    }

    public function set resizeHandle(param1: Group): void {
        var _loc2_: Object = this._1728995332resizeHandle;
        if (_loc2_ !== param1) {
            this._1728995332resizeHandle = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "resizeHandle", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get resizeHandleGraphic(): DOButtonBase {
        return this._912521036resizeHandleGraphic;
    }

    public function set resizeHandleGraphic(param1: DOButtonBase): void {
        var _loc2_: Object = this._912521036resizeHandleGraphic;
        if (_loc2_ !== param1) {
            this._912521036resizeHandleGraphic = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "resizeHandleGraphic", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get scale9Graphic(): Scale9GridImage {
        return this._1404868679scale9Graphic;
    }

    public function set scale9Graphic(param1: Scale9GridImage): void {
        var _loc2_: Object = this._1404868679scale9Graphic;
        if (_loc2_ !== param1) {
            this._1404868679scale9Graphic = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "scale9Graphic", _loc2_, param1));
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
    private function get scaleBitmapData(): BitmapData {
        return this._570979939scaleBitmapData;
    }

    private function set scaleBitmapData(param1: BitmapData): void {
        var _loc2_: Object = this._570979939scaleBitmapData;
        if (_loc2_ !== param1) {
            this._570979939scaleBitmapData = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "scaleBitmapData", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get hostComponent(): DOWindow {
        return this._213507019hostComponent;
    }

    public function set hostComponent(param1: DOWindow): void {
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
