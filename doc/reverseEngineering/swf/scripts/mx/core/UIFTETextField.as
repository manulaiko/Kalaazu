package mx.core {

import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
import flash.events.Event;
import flash.geom.Matrix;
import flash.text.TextFieldAutoSize;
import flash.text.TextFieldType;
import flash.text.TextFormat;
import flash.text.TextFormatAlign;
import flash.text.TextLineMetrics;

import flashx.textLayout.elements.GlobalSettings;

import mx.automation.IAutomationObject;
import mx.managers.ISystemManager;
import mx.managers.IToolTipManagerClient;
import mx.managers.SystemManager;
import mx.managers.ToolTipManager;
import mx.resources.IResourceManager;
import mx.resources.ResourceManager;
import mx.styles.ISimpleStyleClient;
import mx.styles.IStyleClient;
import mx.styles.IStyleManager2;
import mx.styles.StyleManager;
import mx.styles.StyleProtoChain;
import mx.utils.NameUtil;
import mx.utils.StringUtil;

import spark.utils.TextUtil;

public class UIFTETextField extends FTETextField implements IAutomationObject, IIMESupport, IFlexModule, IInvalidating, ISimpleStyleClient, IToolTipManagerClient, IUITextField {

    mx_internal static const VERSION: String = "4.6.0.23201";

    mx_internal static const TEXT_WIDTH_PADDING: int = 5;

    mx_internal static const TEXT_HEIGHT_PADDING: int = 4;

    private static var truncationIndicatorResource: String;

    mx_internal static var debuggingBorders: Boolean = false;

    private static var noEmbeddedFonts: Boolean;

    private static var _embeddedFontRegistry: IEmbeddedFontRegistry;


    private var cachedTextFormat: TextFormat;

    private var cachedEmbeddedFont: EmbeddedFont = null;

    private var invalidateDisplayListFlag: Boolean = true;

    mx_internal var styleChangedFlag: Boolean = true;

    private var explicitHTMLText: String = null;

    mx_internal var explicitColor: uint = 4294967295;

    private var resourceManager: IResourceManager;

    private var untruncatedText: String;

    private var useExplicitWidth: Boolean = false;

    private var useExplicitHeight: Boolean = false;

    private var mirror: Boolean = false;

    mx_internal var _parent: DisplayObjectContainer;

    private var _x: Number = 0;

    private var _automationDelegate: IAutomationObject;

    private var _automationName: String;

    private var _document: Object;

    private var _enabled: Boolean = true;

    private var _explicitHeight: Number;

    private var _explicitWidth: Number;

    private var _ignorePadding: Boolean = true;

    private var _imeMode: String = null;

    private var _includeInLayout: Boolean = true;

    private var _inheritingStyles: Object;

    private var _initialized: Boolean = false;

    private var _moduleFactory: IFlexModuleFactory;

    private var _nestLevel: int = 0;

    private var _nonInheritingStyles: Object;

    private var _processedDescriptors: Boolean = true;

    private var _styleName: Object;

    mx_internal var _toolTip: String;

    private var _updateCompletePendingFlag: Boolean = false;

    private var _owner: DisplayObjectContainer;

    public function UIFTETextField() {
        this.resourceManager = ResourceManager.getInstance();
        this._inheritingStyles = StyleProtoChain.STYLE_UNINITIALIZED;
        this._nonInheritingStyles = StyleProtoChain.STYLE_UNINITIALIZED;
        super();
        GlobalSettings.resourceStringFunction = TextUtil.getResourceString;
        super.text = "";
        focusRect = false;
        selectable = false;
        tabEnabled = false;
        if (mx_internal::debuggingBorders) {
            border = true;
        }
        if (!truncationIndicatorResource) {
            truncationIndicatorResource = this.resourceManager.getString("core", "truncationIndicator");
        }
        addEventListener(Event.CHANGE, this.changeHandler);
        addEventListener("textFieldStyleChange", this.textFieldStyleChangeHandler);
        this.resourceManager.addEventListener(Event.CHANGE, this.resourceManager_changeHandler, false, 0, true);
    }

    private static function get embeddedFontRegistry(): IEmbeddedFontRegistry {
        if (!_embeddedFontRegistry && !noEmbeddedFonts) {
            try {
                _embeddedFontRegistry = IEmbeddedFontRegistry(Singleton.getInstance("mx.core::IEmbeddedFontRegistry"));
            } catch (e: Error) {
                noEmbeddedFonts = true;
            }
        }
        return _embeddedFontRegistry;
    }

    override public function set height(param1: Number): void {
        super.height = param1;
        this.useExplicitHeight = false;
    }

    override public function set htmlText(param1: String): void {
        if (!param1) {
            param1 = "";
        }
        if (this.isHTML && super.htmlText == param1) {
            return;
        }
        if (Boolean(this.cachedTextFormat) && styleSheet == null) {
            defaultTextFormat = this.cachedTextFormat;
        }
        super.htmlText = param1;
        this.explicitHTMLText = param1;
        if (this.invalidateDisplayListFlag) {
            this.validateNow();
        }
    }

    override public function get parent(): DisplayObjectContainer {
        return !!this.mx_internal::_parent ? this.mx_internal::_parent : super.parent;
    }

    override public function set text(param1: String): void {
        if (!param1) {
            param1 = "";
        }
        if (!this.isHTML && super.text == param1) {
            return;
        }
        super.text = param1;
        this.explicitHTMLText = null;
        if (this.invalidateDisplayListFlag) {
            this.validateNow();
        }
    }

    override public function set textColor(param1: uint): void {
        this.setColor(param1);
    }

    override public function set width(param1: Number): void {
        super.width = param1;
        if (this.mirror) {
            this.validateTransformMatrix();
        }
        this.useExplicitWidth = false;
    }

    override public function set x(param1: Number): void {
        this._x = param1;
        super.x = param1;
        if (this.mirror) {
            this.validateTransformMatrix();
        }
    }

    override public function get x(): Number {
        return this.mirror ? this._x : super.x;
    }

    public function get automationDelegate(): Object {
        return this._automationDelegate;
    }

    public function set automationDelegate(param1: Object): void {
        this._automationDelegate = param1 as IAutomationObject;
    }

    public function get automationName(): String {
        if (this._automationName) {
            return this._automationName;
        }
        if (this.automationDelegate) {
            return this.automationDelegate.automationName;
        }
        return "";
    }

    public function set automationName(param1: String): void {
        this._automationName = param1;
    }

    public function get automationValue(): Array {
        if (this.automationDelegate) {
            return this.automationDelegate.automationValue;
        }
        return [""];
    }

    public function get automationOwner(): DisplayObjectContainer {
        return this.owner;
    }

    public function get automationParent(): DisplayObjectContainer {
        return this.parent;
    }

    public function get automationEnabled(): Boolean {
        return this.enabled;
    }

    public function get automationVisible(): Boolean {
        return visible;
    }

    public function get baselinePosition(): Number {
        var _loc1_: * = null;
        var _loc2_: * = null;
        if (!this.parent) {
            return NaN;
        }
        if (autoSize == TextFieldAutoSize.NONE && (width == 0 || height == 0)) {
            _loc2_ = autoSize;
            autoSize = TextFieldAutoSize.LEFT;
        }
        var _loc3_: * = text == "";
        if (_loc3_) {
            super.text = "Wj";
        }
        _loc1_ = getLineMetrics(0);
        if (_loc3_) {
            super.text = "";
        }
        if (_loc2_ != null) {
            autoSize = _loc2_;
        }
        return 2 + _loc1_.ascent;
    }

    public function get className(): String {
        return NameUtil.getUnqualifiedClassName(this);
    }

    public function get document(): Object {
        return this._document;
    }

    public function set document(param1: Object): void {
        this._document = param1;
    }

    public function get enableIME(): Boolean {
        return type == TextFieldType.INPUT;
    }

    public function get enabled(): Boolean {
        return this._enabled;
    }

    public function set enabled(param1: Boolean): void {
        mouseEnabled = param1;
        this._enabled = param1;
        this.styleChanged("color");
    }

    public function get explicitHeight(): Number {
        return this._explicitHeight;
    }

    public function set explicitHeight(param1: Number): void {
        this._explicitHeight = param1;
        this.useExplicitHeight = true;
    }

    public function get explicitMaxHeight(): Number {
        return NaN;
    }

    public function get explicitMaxWidth(): Number {
        return NaN;
    }

    public function get explicitMinHeight(): Number {
        return NaN;
    }

    public function get explicitMinWidth(): Number {
        return NaN;
    }

    public function get explicitWidth(): Number {
        return this._explicitWidth;
    }

    public function set explicitWidth(param1: Number): void {
        this._explicitWidth = param1;
        this.useExplicitWidth = true;
    }

    public function get focusPane(): Sprite {
        return null;
    }

    public function set focusPane(param1: Sprite): void {
    }

    public function get ignorePadding(): Boolean {
        return this._ignorePadding;
    }

    public function set ignorePadding(param1: Boolean): void {
        this._ignorePadding = param1;
        this.styleChanged(null);
    }

    public function get imeMode(): String {
        return this._imeMode;
    }

    public function set imeMode(param1: String): void {
        this._imeMode = param1;
    }

    public function get includeInLayout(): Boolean {
        return this._includeInLayout;
    }

    public function set includeInLayout(param1: Boolean): void {
        var _loc2_: * = null;
        if (this._includeInLayout != param1) {
            this._includeInLayout = param1;
            _loc2_ = this.parent as IInvalidating;
            if (_loc2_) {
                _loc2_.invalidateSize();
                _loc2_.invalidateDisplayList();
            }
        }
    }

    public function get inheritingStyles(): Object {
        return this._inheritingStyles;
    }

    public function set inheritingStyles(param1: Object): void {
        this._inheritingStyles = param1;
    }

    public function get initialized(): Boolean {
        return this._initialized;
    }

    public function set initialized(param1: Boolean): void {
        this._initialized = param1;
    }

    private function get isHTML(): Boolean {
        return this.explicitHTMLText != null;
    }

    public function get isPopUp(): Boolean {
        return false;
    }

    public function set isPopUp(param1: Boolean): void {
    }

    public function get maxHeight(): Number {
        return UIComponent.DEFAULT_MAX_HEIGHT;
    }

    public function get maxWidth(): Number {
        return UIComponent.DEFAULT_MAX_WIDTH;
    }

    public function get measuredHeight(): Number {
        this.validateNow();
        return textHeight + mx_internal::TEXT_HEIGHT_PADDING;
    }

    public function get measuredMinHeight(): Number {
        return 0;
    }

    public function set measuredMinHeight(param1: Number): void {
    }

    public function get measuredMinWidth(): Number {
        return 0;
    }

    public function set measuredMinWidth(param1: Number): void {
    }

    public function get measuredWidth(): Number {
        this.validateNow();
        return textWidth + mx_internal::TEXT_WIDTH_PADDING;
    }

    public function get minHeight(): Number {
        return 0;
    }

    public function get minWidth(): Number {
        return 0;
    }

    public function get moduleFactory(): IFlexModuleFactory {
        return this._moduleFactory;
    }

    public function set moduleFactory(param1: IFlexModuleFactory): void {
        this._moduleFactory = param1;
    }

    public function get nestLevel(): int {
        return this._nestLevel;
    }

    public function set nestLevel(param1: int): void {
        if (param1 > 1 && this._nestLevel != param1) {
            this._nestLevel = param1;
            StyleProtoChain.initTextField(this);
            this.mx_internal::styleChangedFlag = true;
            this.validateNow();
        }
    }

    public function get nonInheritingStyles(): Object {
        return this._nonInheritingStyles;
    }

    public function set nonInheritingStyles(param1: Object): void {
        this._nonInheritingStyles = param1;
    }

    public function get percentHeight(): Number {
        return NaN;
    }

    public function set percentHeight(param1: Number): void {
    }

    public function get percentWidth(): Number {
        return NaN;
    }

    public function set percentWidth(param1: Number): void {
    }

    public function get processedDescriptors(): Boolean {
        return this._processedDescriptors;
    }

    public function set processedDescriptors(param1: Boolean): void {
        this._processedDescriptors = param1;
    }

    public function get styleManager(): IStyleManager2 {
        return StyleManager.getStyleManager(this.moduleFactory);
    }

    public function get styleName(): Object {
        return this._styleName;
    }

    public function set styleName(param1: Object): void {
        if (this._styleName === param1) {
            return;
        }
        this._styleName = param1;
        if (this.parent) {
            StyleProtoChain.initTextField(this);
            this.styleChanged("styleName");
        }
    }

    public function get systemManager(): ISystemManager {
        var _loc2_: * = null;
        var _loc1_: DisplayObject = this.parent;
        while (_loc1_) {
            _loc2_ = _loc1_ as IUIComponent;
            if (_loc2_) {
                return _loc2_.systemManager;
            }
            _loc1_ = _loc1_.parent;
        }
        return null;
    }

    public function set systemManager(param1: ISystemManager): void {
    }

    public function get nonZeroTextHeight(): Number {
        var _loc1_: Number = NaN;
        if (super.text == "") {
            super.text = "Wj";
            _loc1_ = textHeight;
            super.text = "";
            return _loc1_;
        }
        return textHeight;
    }

    public function get toolTip(): String {
        return this.mx_internal::_toolTip;
    }

    public function set toolTip(param1: String): void {
        var _loc2_: String = this.mx_internal::_toolTip;
        this.mx_internal::_toolTip = param1;
        ToolTipManager.mx_internal::registerToolTip(this, _loc2_, param1);
    }

    public function get tweeningProperties(): Array {
        return null;
    }

    public function set tweeningProperties(param1: Array): void {
    }

    public function get updateCompletePendingFlag(): Boolean {
        return this._updateCompletePendingFlag;
    }

    public function set updateCompletePendingFlag(param1: Boolean): void {
        this._updateCompletePendingFlag = param1;
    }

    override public function setTextFormat(param1: TextFormat, param2: int = -1, param3: int = -1): void {
        if (styleSheet) {
            return;
        }
        super.setTextFormat(param1, param2, param3);
        dispatchEvent(new Event("textFormatChange"));
    }

    override public function replaceText(param1: int, param2: int, param3: String): void {
        super.replaceText(param1, param2, param3);
        dispatchEvent(new Event("textReplace"));
    }

    override mx_internal function getErrorMessage(param1: String, param2: String = null): String {
        return this.resourceManager.getString("core", param1, [param2]);
    }

    public function initialize(): void {
    }

    public function getExplicitOrMeasuredWidth(): Number {
        return !isNaN(this.explicitWidth) ? this.explicitWidth : this.measuredWidth;
    }

    public function getExplicitOrMeasuredHeight(): Number {
        return !isNaN(this.explicitHeight) ? this.explicitHeight : this.measuredHeight;
    }

    public function setVisible(param1: Boolean, param2: Boolean = false): void {
        this.visible = param1;
    }

    public function setFocus(): void {
        this.systemManager.stage.focus = this;
    }

    public function getUITextFormat(): UITextFormat {
        this.validateNow();
        var _loc1_: UITextFormat = new UITextFormat(this.creatingSystemManager());
        _loc1_.moduleFactory = this.moduleFactory;
        _loc1_.mx_internal::copyFrom(getTextFormat());
        _loc1_.antiAliasType = antiAliasType;
        _loc1_.gridFitType = gridFitType;
        _loc1_.sharpness = sharpness;
        _loc1_.thickness = thickness;
        _loc1_.useFTE = true;
        _loc1_.direction = direction;
        _loc1_.locale = locale;
        return _loc1_;
    }

    public function move(param1: Number, param2: Number): void {
        if (this.x != param1) {
            this.x = param1;
        }
        if (this.y != param2) {
            this.y = param2;
        }
    }

    public function setActualSize(param1: Number, param2: Number): void {
        if (width != param1) {
            this.width = param1;
        }
        if (height != param2) {
            this.height = param2;
        }
    }

    public function getStyle(param1: String): * {
        if (this.styleManager.inheritingStyles[param1]) {
            return !!this.inheritingStyles ? this.inheritingStyles[param1] : IStyleClient(this.parent).getStyle(param1);
        }
        return !!this.nonInheritingStyles ? this.nonInheritingStyles[param1] : IStyleClient(this.parent).getStyle(param1);
    }

    public function setStyle(param1: String, param2: *): void {
    }

    public function parentChanged(param1: DisplayObjectContainer): void {
        if (!param1) {
            this.mx_internal::_parent = null;
            this._nestLevel = 0;
        } else if (param1 is IStyleClient) {
            this.mx_internal::_parent = param1;
        } else if (param1 is SystemManager) {
            this.mx_internal::_parent = param1;
        } else {
            this.mx_internal::_parent = param1.parent;
        }
    }

    public function styleChanged(param1: String): void {
        this.mx_internal::styleChangedFlag = true;
        if (!this.invalidateDisplayListFlag) {
            this.invalidateDisplayListFlag = true;
            if ("callLater" in this.parent) {
                Object(this.parent).callLater(this.validateNow);
            }
        }
    }

    public function validateNow(): void {
        var _loc1_: Boolean = false;
        var _loc2_: * = null;
        var _loc3_: * = null;
        if (!this.parent) {
            return;
        }
        if (this.useExplicitWidth && !isNaN(this.explicitWidth) && width != this.explicitWidth) {
            super.width = this.explicitWidth > 4 ? this.explicitWidth : 4;
            if (this.mirror) {
                this.validateTransformMatrix();
            }
        }
        if (this.useExplicitHeight && !isNaN(this.explicitHeight) && height != this.explicitHeight) {
            super.height = this.explicitHeight;
        }
        if (this.mx_internal::styleChangedFlag) {
            _loc1_ = this.mirror;
            this.mirror = this.getStyle("layoutDirection") == LayoutDirection.RTL;
            if (this.mirror || _loc1_) {
                this.validateTransformMatrix();
            }
        }
        if (this.mx_internal::styleChangedFlag) {
            super.direction = this.getStyle("direction");
            super.locale = this.getStyle("locale");
            _loc2_ = this.getTextStyles();
            if (_loc2_.font) {
                _loc3_ = noEmbeddedFonts || !embeddedFontRegistry ? null : embeddedFontRegistry.getAssociatedModuleFactory(_loc2_.font, _loc2_.bold, _loc2_.italic, this, this.moduleFactory, this.creatingSystemManager(), true);
                if (_loc3_ != null) {
                    fontContext = _loc3_;
                    embedFonts = true;
                }
            } else {
                embedFonts = this.getStyle("embedFonts");
                if (embedFonts) {
                    fontContext = this.moduleFactory;
                } else {
                    fontContext = null;
                }
            }
            if (this.getStyle("fontAntiAliasType") != undefined) {
                antiAliasType = this.getStyle("fontAntiAliasType");
                gridFitType = this.getStyle("fontGridFitType");
                sharpness = this.getStyle("fontSharpness");
                thickness = this.getStyle("fontThickness");
            }
            if (!styleSheet) {
                super.setTextFormat(_loc2_);
                defaultTextFormat = _loc2_;
            }
            dispatchEvent(new Event("textFieldStyleChange"));
        }
        this.mx_internal::styleChangedFlag = false;
        this.invalidateDisplayListFlag = false;
    }

    private function validateTransformMatrix(): void {
        var _loc1_: * = null;
        var _loc2_: * = null;
        if (this.mirror) {
            _loc1_ = this.transform.matrix;
            _loc1_.a = -1;
            _loc1_.tx = this._x + width;
            transform.matrix = _loc1_;
        } else {
            _loc2_ = new Matrix();
            _loc2_.tx = this._x;
            _loc2_.ty = y;
            transform.matrix = _loc2_;
        }
    }

    public function getTextStyles(): TextFormat {
        var _loc1_: TextFormat = new TextFormat();
        var _loc2_: String = this.getStyle("textAlign");
        if (_loc2_ == "start") {
            _loc2_ = direction == "ltr" ? "null" : TextFormatAlign.RIGHT;
        } else if (_loc2_ == "end") {
            _loc2_ = direction == "ltr" ? "null" : TextFormatAlign.LEFT;
        }
        _loc1_.align = _loc2_;
        _loc1_.bold = this.getStyle("fontWeight") == "bold";
        if (this.enabled) {
            if (this.mx_internal::explicitColor == StyleManager.NOT_A_COLOR) {
                _loc1_.color = this.getStyle("color");
            } else {
                _loc1_.color = this.mx_internal::explicitColor;
            }
        } else {
            _loc1_.color = this.getStyle("disabledColor");
        }
        _loc1_.font = StringUtil.trimArrayElements(this.getStyle("fontFamily"), ",");
        _loc1_.indent = this.getStyle("textIndent");
        _loc1_.italic = this.getStyle("fontStyle") == "italic";
        var _loc3_: * = this.getStyle("kerning");
        if (_loc3_ == "auto" || _loc3_ == "on") {
            _loc3_ = true;
        } else if (_loc3_ == "default" || _loc3_ == "off") {
            _loc3_ = false;
        }
        _loc1_.kerning = _loc3_;
        _loc1_.leading = this.getStyle("leading");
        _loc1_.leftMargin = this.ignorePadding ? 0 : this.getStyle("paddingLeft");
        _loc1_.letterSpacing = this.getStyle("letterSpacing");
        _loc1_.rightMargin = this.ignorePadding ? 0 : this.getStyle("paddingRight");
        _loc1_.size = this.getStyle("fontSize");
        _loc1_.underline = this.getStyle("textDecoration") == "underline";
        this.cachedTextFormat = _loc1_;
        return _loc1_;
    }

    public function setColor(param1: uint): void {
        this.mx_internal::explicitColor = param1;
        this.mx_internal::styleChangedFlag = true;
        this.invalidateDisplayListFlag = true;
        this.validateNow();
    }

    public function invalidateSize(): void {
        this.invalidateDisplayListFlag = true;
    }

    public function invalidateDisplayList(): void {
        this.invalidateDisplayListFlag = true;
    }

    public function invalidateProperties(): void {
    }

    public function truncateToFit(param1: String = null): Boolean {
        var _loc4_: * = null;
        if (!param1) {
            param1 = truncationIndicatorResource;
        }
        this.validateNow();
        var _loc2_: String = super.text;
        this.untruncatedText = _loc2_;
        var _loc3_: Number = width;
        if (_loc2_ != "" && textWidth + mx_internal::TEXT_WIDTH_PADDING > _loc3_ + 1e-14) {
            _loc4_ = super.text = _loc2_;
            _loc2_.slice(0, Math.floor(_loc3_ / (textWidth + mx_internal::TEXT_WIDTH_PADDING) * _loc2_.length));
            while (_loc4_.length > 1 && textWidth + mx_internal::TEXT_WIDTH_PADDING > _loc3_) {
                _loc4_ = _loc4_.slice(0, -1);
                super.text = _loc4_ + param1;
            }
            return true;
        }
        return false;
    }

    private function changeHandler(param1: Event): void {
        this.explicitHTMLText = null;
    }

    private function textFieldStyleChangeHandler(param1: Event): void {
        if (this.explicitHTMLText != null) {
            super.htmlText = this.explicitHTMLText;
        }
    }

    private function resourceManager_changeHandler(param1: Event): void {
        truncationIndicatorResource = this.resourceManager.getString("core", "truncationIndicator");
        if (this.untruncatedText != null) {
            super.text = this.untruncatedText;
            this.truncateToFit();
        }
    }

    public function owns(param1: DisplayObject): Boolean {
        return param1 == this;
    }

    public function get owner(): DisplayObjectContainer {
        return !!this._owner ? this._owner : this.parent;
    }

    public function set owner(param1: DisplayObjectContainer): void {
        this._owner = param1;
    }

    private function creatingSystemManager(): ISystemManager {
        return this.moduleFactory != null && this.moduleFactory is ISystemManager ? ISystemManager(this.moduleFactory) : this.systemManager;
    }

    private function getEmbeddedFont(param1: String, param2: Boolean, param3: Boolean): EmbeddedFont {
        if (this.cachedEmbeddedFont) {
            if (this.cachedEmbeddedFont.fontName == param1 && this.cachedEmbeddedFont.fontStyle == embeddedFontRegistry.getFontStyle(param2, param3)) {
                return this.cachedEmbeddedFont;
            }
        }
        this.cachedEmbeddedFont = new EmbeddedFont(param1, param2, param3);
        return this.cachedEmbeddedFont;
    }

    public function replayAutomatableEvent(param1: Event): Boolean {
        if (this.automationDelegate) {
            return this.automationDelegate.replayAutomatableEvent(param1);
        }
        return false;
    }

    public function createAutomationIDPart(param1: IAutomationObject): Object {
        return null;
    }

    public function createAutomationIDPartWithRequiredProperties(param1: IAutomationObject, param2: Array): Object {
        return null;
    }

    public function resolveAutomationIDPart(param1: Object): Array {
        return [];
    }

    public function getAutomationChildAt(param1: int): IAutomationObject {
        return null;
    }

    public function getAutomationChildren(): Array {
        return null;
    }

    public function get numAutomationChildren(): int {
        return 0;
    }

    public function get showInAutomationHierarchy(): Boolean {
        return true;
    }

    public function set showInAutomationHierarchy(param1: Boolean): void {
    }

    public function get automationTabularData(): Object {
        return null;
    }
}
}
