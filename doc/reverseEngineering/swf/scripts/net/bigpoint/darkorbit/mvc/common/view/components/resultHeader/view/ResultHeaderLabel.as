package net.bigpoint.darkorbit.mvc.common.view.components.resultHeader.view {

import flash.display.BlendMode;
import flash.display.DisplayObject;
import flash.filters.BitmapFilterType;
import flash.utils.getDefinitionByName;

import mx.binding.Binding;
import mx.binding.BindingManager;
import mx.binding.IBindingClient;
import mx.binding.IWatcherSetupUtil2;
import mx.core.IFlexModuleFactory;
import mx.core.mx_internal;
import mx.events.PropertyChangeEvent;
import mx.graphics.BitmapFill;
import mx.graphics.BitmapFillMode;
import mx.graphics.SolidColor;

import net.bigpoint.darkorbit.mvc.common.view.components.resultHeader.model.StatsHeaderLableTweenVo;
import net.bigpoint.darkorbit.mvc.common.view.components.resultHeader.view.tweens.IUIComponentTween;
import net.bigpoint.darkorbit.mvc.common.view.components.resultHeader.view.tweens.StdBackgroundTween;
import net.bigpoint.darkorbit.mvc.common.view.components.resultHeader.view.tweens.StdOverLayTween;
import net.bigpoint.darkorbit.mvc.common.view.components.resultHeader.view.tweens.StdTextureTween;

import spark.components.Group;
import spark.components.HGroup;
import spark.components.Image;
import spark.components.Label;
import spark.core.MaskType;
import spark.filters.BevelFilter;
import spark.filters.DropShadowFilter;
import spark.primitives.Rect;

public class ResultHeaderLabel extends Group implements IBindingClient {

    private static var _watcherSetupUtil: IWatcherSetupUtil2;


    public var _ResultHeaderLabel_BevelFilter1: BevelFilter;

    public var _ResultHeaderLabel_BitmapFill1: BitmapFill;

    public var _ResultHeaderLabel_BitmapFill2: BitmapFill;

    public var _ResultHeaderLabel_BitmapFill3: BitmapFill;

    public var _ResultHeaderLabel_Group2: Group;

    public var _ResultHeaderLabel_Group3: Group;

    public var _ResultHeaderLabel_Group4: Group;

    public var _ResultHeaderLabel_Group5: Group;

    public var _ResultHeaderLabel_Group7: Group;

    public var _ResultHeaderLabel_Label2: Label;

    public var _ResultHeaderLabel_Rect2: Rect;

    public var _ResultHeaderLabel_Rect3: Rect;

    public var _ResultHeaderLabel_Rect4: Rect;

    private var _874071982backGroundRect: HGroup;

    private var _1091318736overLay: Image;

    private var _1002902119textmask: Label;

    private var _1613667743textureRect: Group;

    private var __moduleFactoryInitialized: Boolean = false;

    private var _bgTween: IUIComponentTween;

    private var _overLayTween: IUIComponentTween;

    private var _textureTween: IUIComponentTween;

    private var _1229135111_headerText: String;

    private var _180168847_gradient: DisplayObject;

    private var _1337371379_effectImg: DisplayObject;

    private var _90883374_font: String;

    private var _940407772_texture: DisplayObject;

    private var _1160014099_backGround: DisplayObject;

    private var _456118863_fontSize: int;

    private var _307325245_trackingLeft: int;

    mx_internal var _bindings: Array;

    mx_internal var _watchers: Array;

    mx_internal var _bindingsByDestination: Object;

    mx_internal var _bindingsBeginWithWord: Object;

    public function ResultHeaderLabel() {
        var bindings: Array;
        var watchers: Array;
        var i: uint;
        var target: Object = null;
        var watcherSetupUtilClass: Object = null;
        this._bgTween = new StdBackgroundTween();
        this._overLayTween = new StdOverLayTween();
        this._textureTween = new StdTextureTween();
        this.mx_internal::_bindings = [];
        this.mx_internal::_watchers = [];
        this.mx_internal::_bindingsByDestination = {};
        this.mx_internal::_bindingsBeginWithWord = {};
        super();
        mx_internal::_document = this;
        bindings = this._ResultHeaderLabel_bindingsSetup();
        watchers = [];
        target = this;
        if (_watcherSetupUtil == null) {
            watcherSetupUtilClass = getDefinitionByName("_net_bigpoint_darkorbit_mvc_common_view_components_resultHeader_view_ResultHeaderLabelWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
        }
        _watcherSetupUtil.setup(this, function (param1: String): * {
            return target[param1];
        }, function (param1: String): * {
            return ResultHeaderLabel[param1];
        }, bindings, watchers);
        mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
        mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
        this.mxmlContent = [this._ResultHeaderLabel_Group2_i(), this._ResultHeaderLabel_Group3_i(), this._ResultHeaderLabel_Label2_i()];
        i = 0;
        while (i < bindings.length) {
            Binding(bindings[i]).execute();
            i++;
        }
    }

    public static function set watcherSetupUtil(param1: IWatcherSetupUtil2): void {
        ResultHeaderLabel._watcherSetupUtil = param1;
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

    public function set headerText(param1: String): void {
        this._headerText = param1;
    }

    public function set gradient(param1: DisplayObject): void {
        this._gradient = param1;
    }

    public function set effectImg(param1: DisplayObject): void {
        this._overLayTween.destruct();
        this._effectImg = param1;
        this._overLayTween.execute(this.overLay);
    }

    public function set font(param1: String): void {
        this._font = param1;
    }

    public function set texture(param1: DisplayObject): void {
        this._textureTween.destruct();
        this._texture = param1;
        this._textureTween.execute(this.textureRect);
    }

    public function set tweenVo(param1: StatsHeaderLableTweenVo): void {
        this.deactivateTweens();
        this._bgTween = param1.backGroundTween;
        this._overLayTween = param1.glowTween;
        this._textureTween = param1.textureTween;
        this.activateTweens();
    }

    public function set backGround(param1: DisplayObject): void {
        this._bgTween.destruct();
        this._backGround = param1;
        this._bgTween.execute(this.backGroundRect);
    }

    private function activateTweens(): void {
        this._textureTween.execute(this.textureRect);
        this._overLayTween.execute(this.overLay);
        this._bgTween.execute(this.backGroundRect);
    }

    private function deactivateTweens(): void {
        this._textureTween.destruct();
        this._overLayTween.destruct();
        this._bgTween.destruct();
    }

    public function set fontSize(param1: int): void {
        this._fontSize = param1;
    }

    public function set trackingLeft(param1: int): void {
        this._trackingLeft = param1;
    }

    private function _ResultHeaderLabel_Group2_i(): Group {
        var _loc1_: Group = new Group();
        _loc1_.percentHeight = 100;
        _loc1_.percentWidth = 100;
        _loc1_.mxmlContent = [this._ResultHeaderLabel_HGroup1_i()];
        _loc1_.id = "_ResultHeaderLabel_Group2";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this._ResultHeaderLabel_Group2 = _loc1_;
        BindingManager.executeBindings(this, "_ResultHeaderLabel_Group2", this._ResultHeaderLabel_Group2);
        return _loc1_;
    }

    private function _ResultHeaderLabel_HGroup1_i(): HGroup {
        var _loc1_: HGroup = new HGroup();
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 100;
        _loc1_.mxmlContent = [this._ResultHeaderLabel_Rect1_c()];
        _loc1_.id = "backGroundRect";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.backGroundRect = _loc1_;
        BindingManager.executeBindings(this, "backGroundRect", this.backGroundRect);
        return _loc1_;
    }

    private function _ResultHeaderLabel_Rect1_c(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 100;
        _loc1_.fill = this._ResultHeaderLabel_BitmapFill1_i();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function _ResultHeaderLabel_BitmapFill1_i(): BitmapFill {
        var _loc1_: BitmapFill = new BitmapFill();
        this._ResultHeaderLabel_BitmapFill1 = _loc1_;
        BindingManager.executeBindings(this, "_ResultHeaderLabel_BitmapFill1", this._ResultHeaderLabel_BitmapFill1);
        return _loc1_;
    }

    private function _ResultHeaderLabel_Group3_i(): Group {
        var _loc1_: Group = new Group();
        _loc1_.mask = this._ResultHeaderLabel_Group4_i();
        _loc1_.filters = [this._ResultHeaderLabel_DropShadowFilter1_c()];
        _loc1_.mxmlContent = [this._ResultHeaderLabel_Group5_i(), this._ResultHeaderLabel_Label1_i()];
        _loc1_.id = "_ResultHeaderLabel_Group3";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this._ResultHeaderLabel_Group3 = _loc1_;
        BindingManager.executeBindings(this, "_ResultHeaderLabel_Group3", this._ResultHeaderLabel_Group3);
        return _loc1_;
    }

    private function _ResultHeaderLabel_Group4_i(): Group {
        var _loc1_: Group = new Group();
        _loc1_.percentWidth = 100;
        _loc1_.mxmlContent = [this._ResultHeaderLabel_Rect2_i()];
        _loc1_.id = "_ResultHeaderLabel_Group4";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this._ResultHeaderLabel_Group4 = _loc1_;
        BindingManager.executeBindings(this, "_ResultHeaderLabel_Group4", this._ResultHeaderLabel_Group4);
        return _loc1_;
    }

    private function _ResultHeaderLabel_Rect2_i(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.percentHeight = 100;
        _loc1_.fill = this._ResultHeaderLabel_SolidColor1_c();
        _loc1_.initialized(this, "_ResultHeaderLabel_Rect2");
        this._ResultHeaderLabel_Rect2 = _loc1_;
        BindingManager.executeBindings(this, "_ResultHeaderLabel_Rect2", this._ResultHeaderLabel_Rect2);
        return _loc1_;
    }

    private function _ResultHeaderLabel_SolidColor1_c(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        _loc1_.color = 65280;
        return _loc1_;
    }

    private function _ResultHeaderLabel_DropShadowFilter1_c(): DropShadowFilter {
        var _loc1_: DropShadowFilter = new DropShadowFilter();
        _loc1_.distance = 1;
        _loc1_.blurX = 10;
        _loc1_.blurY = 10;
        return _loc1_;
    }

    private function _ResultHeaderLabel_Group5_i(): Group {
        var _loc1_: Group = new Group();
        _loc1_.mxmlContent = [this._ResultHeaderLabel_Rect3_i(), this._ResultHeaderLabel_Group6_i(), this._ResultHeaderLabel_Group7_i()];
        _loc1_.id = "_ResultHeaderLabel_Group5";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this._ResultHeaderLabel_Group5 = _loc1_;
        BindingManager.executeBindings(this, "_ResultHeaderLabel_Group5", this._ResultHeaderLabel_Group5);
        return _loc1_;
    }

    private function _ResultHeaderLabel_Rect3_i(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.percentHeight = 100;
        _loc1_.fill = this._ResultHeaderLabel_BitmapFill2_i();
        _loc1_.initialized(this, "_ResultHeaderLabel_Rect3");
        this._ResultHeaderLabel_Rect3 = _loc1_;
        BindingManager.executeBindings(this, "_ResultHeaderLabel_Rect3", this._ResultHeaderLabel_Rect3);
        return _loc1_;
    }

    private function _ResultHeaderLabel_BitmapFill2_i(): BitmapFill {
        var _loc1_: BitmapFill = new BitmapFill();
        this._ResultHeaderLabel_BitmapFill2 = _loc1_;
        BindingManager.executeBindings(this, "_ResultHeaderLabel_BitmapFill2", this._ResultHeaderLabel_BitmapFill2);
        return _loc1_;
    }

    private function _ResultHeaderLabel_Group6_i(): Group {
        var _loc1_: Group = new Group();
        _loc1_.percentHeight = 100;
        _loc1_.mxmlContent = [this._ResultHeaderLabel_Rect4_i()];
        _loc1_.id = "textureRect";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.textureRect = _loc1_;
        BindingManager.executeBindings(this, "textureRect", this.textureRect);
        return _loc1_;
    }

    private function _ResultHeaderLabel_Rect4_i(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.percentHeight = 100;
        _loc1_.fill = this._ResultHeaderLabel_BitmapFill3_i();
        _loc1_.initialized(this, "_ResultHeaderLabel_Rect4");
        this._ResultHeaderLabel_Rect4 = _loc1_;
        BindingManager.executeBindings(this, "_ResultHeaderLabel_Rect4", this._ResultHeaderLabel_Rect4);
        return _loc1_;
    }

    private function _ResultHeaderLabel_BitmapFill3_i(): BitmapFill {
        var _loc1_: BitmapFill = new BitmapFill();
        this._ResultHeaderLabel_BitmapFill3 = _loc1_;
        BindingManager.executeBindings(this, "_ResultHeaderLabel_BitmapFill3", this._ResultHeaderLabel_BitmapFill3);
        return _loc1_;
    }

    private function _ResultHeaderLabel_Group7_i(): Group {
        var _loc1_: Group = new Group();
        _loc1_.mxmlContent = [this._ResultHeaderLabel_Image1_i()];
        _loc1_.id = "_ResultHeaderLabel_Group7";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this._ResultHeaderLabel_Group7 = _loc1_;
        BindingManager.executeBindings(this, "_ResultHeaderLabel_Group7", this._ResultHeaderLabel_Group7);
        return _loc1_;
    }

    private function _ResultHeaderLabel_Image1_i(): Image {
        var _loc1_: Image = new Image();
        _loc1_.id = "overLay";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.overLay = _loc1_;
        BindingManager.executeBindings(this, "overLay", this.overLay);
        return _loc1_;
    }

    private function _ResultHeaderLabel_Label1_i(): Label {
        var _loc1_: Label = new Label();
        _loc1_.id = "textmask";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.textmask = _loc1_;
        BindingManager.executeBindings(this, "textmask", this.textmask);
        return _loc1_;
    }

    private function _ResultHeaderLabel_Label2_i(): Label {
        var _loc1_: Label = new Label();
        _loc1_.filters = [this._ResultHeaderLabel_BevelFilter1_i()];
        _loc1_.id = "_ResultHeaderLabel_Label2";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this._ResultHeaderLabel_Label2 = _loc1_;
        BindingManager.executeBindings(this, "_ResultHeaderLabel_Label2", this._ResultHeaderLabel_Label2);
        return _loc1_;
    }

    private function _ResultHeaderLabel_BevelFilter1_i(): BevelFilter {
        var _loc1_: BevelFilter = new BevelFilter();
        _loc1_.blurX = 0;
        _loc1_.blurY = 0;
        _loc1_.distance = 1;
        _loc1_.strength = 1;
        _loc1_.knockout = true;
        this._ResultHeaderLabel_BevelFilter1 = _loc1_;
        BindingManager.executeBindings(this, "_ResultHeaderLabel_BevelFilter1", this._ResultHeaderLabel_BevelFilter1);
        return _loc1_;
    }

    private function _ResultHeaderLabel_bindingsSetup(): Array {
        var result: Array = [];
        result[0] = new Binding(this, function (): Number {
            return textmask.width;
        }, null, "_ResultHeaderLabel_Group2.maxWidth");
        result[1] = new Binding(this, function (): Number {
            return textmask.height;
        }, null, "_ResultHeaderLabel_Group2.maxHeight");
        result[2] = new Binding(this, function (): Object {
            return _backGround;
        }, null, "_ResultHeaderLabel_BitmapFill1.source");
        result[3] = new Binding(this, function (): String {
            var _loc1_: * = BitmapFillMode.SCALE;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, null, "_ResultHeaderLabel_BitmapFill1.fillMode");
        result[4] = new Binding(this, function (): String {
            var _loc1_: * = MaskType.ALPHA;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, null, "_ResultHeaderLabel_Group3.maskType");
        result[5] = new Binding(this, function (): String {
            var _loc1_: * = BlendMode.LAYER;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, null, "_ResultHeaderLabel_Group3.blendMode");
        result[6] = new Binding(this, function (): Number {
            return textmask.height;
        }, null, "_ResultHeaderLabel_Group4.height");
        result[7] = new Binding(this, function (): Number {
            return textmask.width;
        }, null, "_ResultHeaderLabel_Rect2.width");
        result[8] = new Binding(this, function (): String {
            var _loc1_: * = BlendMode.LAYER;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, null, "_ResultHeaderLabel_Group5.blendMode");
        result[9] = new Binding(this, function (): Number {
            return textmask.width;
        }, null, "_ResultHeaderLabel_Group5.maxWidth");
        result[10] = new Binding(this, function (): Number {
            return textmask.width;
        }, null, "_ResultHeaderLabel_Rect3.width");
        result[11] = new Binding(this, function (): String {
            var _loc1_: * = BlendMode.LAYER;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, null, "_ResultHeaderLabel_Rect3.blendMode");
        result[12] = new Binding(this, function (): String {
            var _loc1_: * = BitmapFillMode.SCALE;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, null, "_ResultHeaderLabel_BitmapFill2.fillMode");
        result[13] = new Binding(this, function (): Object {
            return _gradient;
        }, null, "_ResultHeaderLabel_BitmapFill2.source");
        result[14] = new Binding(this, function (): Number {
            return textmask.width;
        }, null, "textureRect.maxWidth");
        result[15] = new Binding(this, function (): Number {
            return textmask.width;
        }, null, "textureRect.width");
        result[16] = new Binding(this, function (): String {
            var _loc1_: * = BlendMode.MULTIPLY;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, null, "textureRect.blendMode");
        result[17] = new Binding(this, function (): Number {
            return textmask.width;
        }, null, "_ResultHeaderLabel_Rect4.width");
        result[18] = new Binding(this, function (): Object {
            return _texture;
        }, null, "_ResultHeaderLabel_BitmapFill3.source");
        result[19] = new Binding(this, function (): String {
            var _loc1_: * = BitmapFillMode.SCALE;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, null, "_ResultHeaderLabel_BitmapFill3.fillMode");
        result[20] = new Binding(this, function (): String {
            var _loc1_: * = MaskType.ALPHA;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, null, "_ResultHeaderLabel_Group7.maskType");
        result[21] = new Binding(this, function (): Number {
            return textmask.width;
        }, null, "_ResultHeaderLabel_Group7.maxWidth");
        result[22] = new Binding(this, function (): Number {
            return textmask.width;
        }, null, "_ResultHeaderLabel_Group7.width");
        result[23] = new Binding(this, function (): String {
            var _loc1_: * = BlendMode.LAYER;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, null, "_ResultHeaderLabel_Group7.blendMode");
        result[24] = new Binding(this, function (): String {
            var _loc1_: * = BlendMode.LAYER;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, null, "overLay.blendMode");
        result[25] = new Binding(this, function (): Object {
            return _effectImg;
        }, null, "overLay.source");
        result[26] = new Binding(this, function (): Number {
            return textmask.width;
        }, null, "overLay.maxWidth");
        result[27] = new Binding(this, function (): Number {
            return textmask.height;
        }, null, "overLay.height");
        result[28] = new Binding(this, function (): String {
            var _loc1_: * = _headerText;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, null, "textmask.text");
        result[29] = new Binding(this, function (): String {
            var _loc1_: * = _font;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, function (param1: String): void {
            textmask.setStyle("fontFamily", param1);
        }, "textmask.fontFamily");
        result[30] = new Binding(this, function (): Number {
            return _fontSize;
        }, function (param1: Number): void {
            textmask.setStyle("fontSize", param1);
        }, "textmask.fontSize");
        result[31] = new Binding(this, function (): Object {
            return _trackingLeft;
        }, function (param1: Object): void {
            textmask.setStyle("trackingLeft", param1);
        }, "textmask.trackingLeft");
        result[32] = new Binding(this, function (): String {
            var _loc1_: * = BlendMode.ALPHA;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, null, "textmask.blendMode");
        result[33] = new Binding(this, function (): String {
            var _loc1_: * = _headerText;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, null, "_ResultHeaderLabel_Label2.text");
        result[34] = new Binding(this, function (): String {
            var _loc1_: * = _font;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, function (param1: String): void {
            _ResultHeaderLabel_Label2.setStyle("fontFamily", param1);
        }, "_ResultHeaderLabel_Label2.fontFamily");
        result[35] = new Binding(this, function (): Number {
            return _fontSize;
        }, function (param1: Number): void {
            _ResultHeaderLabel_Label2.setStyle("fontSize", param1);
        }, "_ResultHeaderLabel_Label2.fontSize");
        result[36] = new Binding(this, function (): Object {
            return _trackingLeft;
        }, function (param1: Object): void {
            _ResultHeaderLabel_Label2.setStyle("trackingLeft", param1);
        }, "_ResultHeaderLabel_Label2.trackingLeft");
        result[37] = new Binding(this, function (): String {
            var _loc1_: * = BitmapFilterType.INNER;
            return _loc1_ == undefined ? null : String(_loc1_);
        }, null, "_ResultHeaderLabel_BevelFilter1.type");
        return result;
    }

    [Bindable(event="propertyChange")]
    public function get backGroundRect(): HGroup {
        return this._874071982backGroundRect;
    }

    public function set backGroundRect(param1: HGroup): void {
        var _loc2_: Object = this._874071982backGroundRect;
        if (_loc2_ !== param1) {
            this._874071982backGroundRect = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "backGroundRect", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get overLay(): Image {
        return this._1091318736overLay;
    }

    public function set overLay(param1: Image): void {
        var _loc2_: Object = this._1091318736overLay;
        if (_loc2_ !== param1) {
            this._1091318736overLay = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "overLay", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get textmask(): Label {
        return this._1002902119textmask;
    }

    public function set textmask(param1: Label): void {
        var _loc2_: Object = this._1002902119textmask;
        if (_loc2_ !== param1) {
            this._1002902119textmask = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "textmask", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get textureRect(): Group {
        return this._1613667743textureRect;
    }

    public function set textureRect(param1: Group): void {
        var _loc2_: Object = this._1613667743textureRect;
        if (_loc2_ !== param1) {
            this._1613667743textureRect = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "textureRect", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    private function get _headerText(): String {
        return this._1229135111_headerText;
    }

    private function set _headerText(param1: String): void {
        var _loc2_: Object = this._1229135111_headerText;
        if (_loc2_ !== param1) {
            this._1229135111_headerText = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_headerText", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    private function get _gradient(): DisplayObject {
        return this._180168847_gradient;
    }

    private function set _gradient(param1: DisplayObject): void {
        var _loc2_: Object = this._180168847_gradient;
        if (_loc2_ !== param1) {
            this._180168847_gradient = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_gradient", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    private function get _effectImg(): DisplayObject {
        return this._1337371379_effectImg;
    }

    private function set _effectImg(param1: DisplayObject): void {
        var _loc2_: Object = this._1337371379_effectImg;
        if (_loc2_ !== param1) {
            this._1337371379_effectImg = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_effectImg", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    private function get _font(): String {
        return this._90883374_font;
    }

    private function set _font(param1: String): void {
        var _loc2_: Object = this._90883374_font;
        if (_loc2_ !== param1) {
            this._90883374_font = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_font", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    private function get _texture(): DisplayObject {
        return this._940407772_texture;
    }

    private function set _texture(param1: DisplayObject): void {
        var _loc2_: Object = this._940407772_texture;
        if (_loc2_ !== param1) {
            this._940407772_texture = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_texture", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    private function get _backGround(): DisplayObject {
        return this._1160014099_backGround;
    }

    private function set _backGround(param1: DisplayObject): void {
        var _loc2_: Object = this._1160014099_backGround;
        if (_loc2_ !== param1) {
            this._1160014099_backGround = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_backGround", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    private function get _fontSize(): int {
        return this._456118863_fontSize;
    }

    private function set _fontSize(param1: int): void {
        var _loc2_: Object = this._456118863_fontSize;
        if (_loc2_ !== param1) {
            this._456118863_fontSize = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_fontSize", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    private function get _trackingLeft(): int {
        return this._307325245_trackingLeft;
    }

    private function set _trackingLeft(param1: int): void {
        var _loc2_: Object = this._307325245_trackingLeft;
        if (_loc2_ !== param1) {
            this._307325245_trackingLeft = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_trackingLeft", _loc2_, param1));
            }
        }
    }
}
}
