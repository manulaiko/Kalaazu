package mx.core {

import flash.accessibility.Accessibility;
import flash.accessibility.AccessibilityProperties;
import flash.display.BlendMode;
import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.GradientType;
import flash.display.Graphics;
import flash.display.InteractiveObject;
import flash.display.Loader;
import flash.display.Shader;
import flash.display.Sprite;
import flash.display.Stage;
import flash.events.Event;
import flash.events.EventPhase;
import flash.events.FocusEvent;
import flash.events.IEventDispatcher;
import flash.events.KeyboardEvent;
import flash.geom.ColorTransform;
import flash.geom.Matrix;
import flash.geom.Matrix3D;
import flash.geom.PerspectiveProjection;
import flash.geom.Point;
import flash.geom.Rectangle;
import flash.geom.Transform;
import flash.geom.Vector3D;
import flash.system.ApplicationDomain;
import flash.system.Capabilities;
import flash.text.TextFormatAlign;
import flash.text.TextLineMetrics;
import flash.ui.Keyboard;
import flash.utils.Dictionary;
import flash.utils.getQualifiedClassName;

import mx.automation.IAutomationObject;
import mx.binding.BindingManager;
import mx.controls.IFlexContextMenu;
import mx.effects.EffectManager;
import mx.effects.IEffect;
import mx.effects.IEffectInstance;
import mx.events.ChildExistenceChangedEvent;
import mx.events.DynamicEvent;
import mx.events.EffectEvent;
import mx.events.FlexEvent;
import mx.events.MoveEvent;
import mx.events.PropertyChangeEvent;
import mx.events.ResizeEvent;
import mx.events.StateChangeEvent;
import mx.events.ValidationResultEvent;
import mx.filters.BaseFilter;
import mx.filters.IBitmapFilter;
import mx.geom.RoundedRectangle;
import mx.geom.Transform;
import mx.geom.TransformOffsets;
import mx.graphics.shaderClasses.ColorBurnShader;
import mx.graphics.shaderClasses.ColorDodgeShader;
import mx.graphics.shaderClasses.ColorShader;
import mx.graphics.shaderClasses.ExclusionShader;
import mx.graphics.shaderClasses.HueShader;
import mx.graphics.shaderClasses.LuminosityShader;
import mx.graphics.shaderClasses.SaturationShader;
import mx.graphics.shaderClasses.SoftLightShader;
import mx.managers.CursorManager;
import mx.managers.ICursorManager;
import mx.managers.IFocusManager;
import mx.managers.IFocusManagerComponent;
import mx.managers.IFocusManagerContainer;
import mx.managers.ILayoutManagerClient;
import mx.managers.ISystemManager;
import mx.managers.IToolTipManagerClient;
import mx.managers.SystemManager;
import mx.managers.SystemManagerGlobals;
import mx.managers.ToolTipManager;
import mx.resources.IResourceManager;
import mx.resources.ResourceManager;
import mx.states.State;
import mx.states.Transition;
import mx.styles.CSSStyleDeclaration;
import mx.styles.IAdvancedStyleClient;
import mx.styles.ISimpleStyleClient;
import mx.styles.IStyleClient;
import mx.styles.IStyleManager2;
import mx.styles.StyleManager;
import mx.styles.StyleProtoChain;
import mx.utils.ColorUtil;
import mx.utils.GraphicsUtil;
import mx.utils.MatrixUtil;
import mx.utils.NameUtil;
import mx.utils.StringUtil;
import mx.utils.TransformUtil;
import mx.validators.IValidatorListener;
import mx.validators.ValidationResult;

public class UIComponent extends FlexSprite implements IAutomationObject, IChildList, IConstraintClient, IDeferredInstantiationUIComponent, IFlexDisplayObject, IFlexModule, IInvalidating, ILayoutManagerClient, IPropertyChangeNotifier, IRepeaterClient, IStateClient, IAdvancedStyleClient, IToolTipManagerClient, IUIComponent, IValidatorListener, IVisualElement {

    mx_internal static const VERSION: String = "4.6.0.23201";

    public static const DEFAULT_MEASURED_WIDTH: Number = 160;

    public static const DEFAULT_MEASURED_MIN_WIDTH: Number = 40;

    public static const DEFAULT_MEASURED_HEIGHT: Number = 22;

    public static const DEFAULT_MEASURED_MIN_HEIGHT: Number = 22;

    public static const DEFAULT_MAX_WIDTH: Number = 10000;

    public static const DEFAULT_MAX_HEIGHT: Number = 10000;

    private static const LAYOUT_DIRECTION_CACHE_UNSET: String = "layoutDirectionCacheUnset";

    mx_internal static var createAccessibilityImplementation: Function;

    private static var noEmbeddedFonts: Boolean;

    private static var _embeddedFontRegistry: IEmbeddedFontRegistry;

    private static var effectType: Class;

    private static var effectLoaded: Boolean = false;

    private static var compositeEffectType: Class;

    private static var compositeEffectLoaded: Boolean = false;

    mx_internal static var dispatchEventHook: Function;

    private static var fakeMouseX: QName = new QName(mx_internal, "_mouseX");

    private static var fakeMouseY: QName = new QName(mx_internal, "_mouseY");


    private var deferredSetStyles: Object;

    private var listeningForRender: Boolean = false;

    private var methodQueue: Array;

    private var hasFocusRect: Boolean = false;

    private var transitionFromState: String;

    private var transitionToState: String;

    private var parentChangedFlag: Boolean = false;

    private var layoutDirectionCachedValue: String = "layoutDirectionCacheUnset";

    private var _initialized: Boolean = false;

    private var _processedDescriptors: Boolean = false;

    private var _updateCompletePendingFlag: Boolean = false;

    mx_internal var invalidatePropertiesFlag: Boolean = false;

    mx_internal var invalidateSizeFlag: Boolean = false;

    mx_internal var invalidateDisplayListFlag: Boolean = false;

    mx_internal var setActualSizeCalled: Boolean = false;

    private var oldX: Number = 0;

    private var oldY: Number = 0;

    private var oldWidth: Number = 0;

    private var oldHeight: Number = 0;

    private var oldMinWidth: Number;

    private var oldMinHeight: Number;

    private var oldExplicitWidth: Number;

    private var oldExplicitHeight: Number;

    private var oldScaleX: Number = 1;

    private var oldScaleY: Number = 1;

    private var hasFontContextBeenSaved: Boolean = false;

    private var oldEmbeddedFontContext: IFlexModuleFactory = null;

    mx_internal var _layoutFeatures: AdvancedLayoutFeatures;

    private var _transform: flash.geom.Transform;

    private var cachedTextFormat: UITextFormat;

    mx_internal var effectOverlay: UIComponent;

    mx_internal var effectOverlayColor: uint;

    mx_internal var effectOverlayReferenceCount: int = 0;

    mx_internal var saveBorderColor: Boolean = true;

    mx_internal var origBorderColor: Number;

    mx_internal var automaticRadioButtonGroups: Object;

    private var _usingBridge: int = -1;

    mx_internal var _owner: DisplayObjectContainer;

    mx_internal var _parent: DisplayObjectContainer;

    mx_internal var _width: Number;

    mx_internal var _height: Number;

    private var _scaleX: Number = 1;

    private var _scaleY: Number = 1;

    private var _visible: Boolean = true;

    private var _alpha: Number = 1;

    private var _blendMode: String = "normal";

    private var blendShaderChanged: Boolean;

    private var blendModeChanged: Boolean;

    private var _enabled: Boolean = false;

    private var _filters: Array;

    private var _designLayer: DesignLayer;

    private var _tweeningProperties: Array;

    private var _focusManager: IFocusManager;

    private var _resourceManager: IResourceManager;

    private var _styleManager: IStyleManager2;

    private var _systemManager: ISystemManager;

    private var _systemManagerDirty: Boolean = false;

    private var _nestLevel: int = 0;

    mx_internal var _descriptor: UIComponentDescriptor;

    mx_internal var _document: Object;

    mx_internal var _documentDescriptor: UIComponentDescriptor;

    private var _id: String;

    private var _moduleFactory: IFlexModuleFactory;

    private var _inheritingStyles: Object;

    private var _nonInheritingStyles: Object;

    private var _styleDeclaration: CSSStyleDeclaration;

    private var _cachePolicy: String = "auto";

    private var cacheAsBitmapCount: int = 0;

    private var _focusPane: Sprite;

    private var _focusEnabled: Boolean = true;

    private var _hasFocusableChildren: Boolean = false;

    private var _mouseFocusEnabled: Boolean = true;

    private var _tabFocusEnabled: Boolean = true;

    private var _measuredMinWidth: Number = 0;

    private var _measuredMinHeight: Number = 0;

    private var _measuredWidth: Number = 0;

    private var _measuredHeight: Number = 0;

    private var _percentWidth: Number;

    private var _percentHeight: Number;

    mx_internal var _explicitMinWidth: Number;

    mx_internal var _explicitMinHeight: Number;

    mx_internal var _explicitMaxWidth: Number;

    mx_internal var _explicitMaxHeight: Number;

    private var _explicitWidth: Number;

    private var _explicitHeight: Number;

    private var _hasComplexLayoutMatrix: Boolean = false;

    private var _includeInLayout: Boolean = true;

    mx_internal var oldLayoutDirection: String = "ltr";

    private var _instanceIndices: Array;

    private var _repeaters: Array;

    private var _repeaterIndices: Array;

    private var _currentState: String;

    private var requestedCurrentState: String;

    private var playStateTransition: Boolean = true;

    private var _currentStateChanged: Boolean;

    private var _currentStateDeferred: String;

    private var _states: Array;

    private var _currentTransition: Transition;

    private var _transitions: Array;

    private var _flexContextMenu: IFlexContextMenu;

    private var _styleName: Object;

    mx_internal var _toolTip: String;

    private var _uid: String;

    private var _isPopUp: Boolean;

    private var _automationDelegate: IAutomationObject;

    private var _automationName: String = null;

    private var _showInAutomationHierarchy: Boolean = true;

    mx_internal var _errorString: String = "";

    private var oldErrorString: String = "";

    private var errorArray: Array;

    private var errorObjectArray: Array;

    private var errorStringChanged: Boolean = false;

    private var _validationSubField: String;

    private var lastUnscaledWidth: Number;

    private var lastUnscaledHeight: Number;

    mx_internal var advanceStyleClientChildren: Dictionary = null;

    mx_internal var _effectsStarted: Array;

    mx_internal var _affectedProperties: Object;

    private var _isEffectStarted: Boolean = false;

    private var preventDrawFocus: Boolean = false;

    private var _endingEffectInstances: Array;

    private var _maintainProjectionCenter: Boolean = false;

    public function UIComponent() {
        this.methodQueue = [];
        this._resourceManager = ResourceManager.getInstance();
        this._inheritingStyles = StyleProtoChain.STYLE_UNINITIALIZED;
        this._nonInheritingStyles = StyleProtoChain.STYLE_UNINITIALIZED;
        this._states = [];
        this._transitions = [];
        this.mx_internal::_effectsStarted = [];
        this.mx_internal::_affectedProperties = {};
        this._endingEffectInstances = [];
        super();
        focusRect = false;
        tabEnabled = this is IFocusManagerComponent;
        this.tabFocusEnabled = this is IFocusManagerComponent;
        this.enabled = true;
        this.mx_internal::$visible = false;
        addEventListener(Event.ADDED, this.addedHandler);
        addEventListener(Event.REMOVED, this.removedHandler);
        addEventListener(Event.REMOVED_FROM_STAGE, this.removedFromStageHandler);
        if (this is IFocusManagerComponent) {
            addEventListener(FocusEvent.FOCUS_IN, this.focusInHandler);
            addEventListener(FocusEvent.FOCUS_OUT, this.focusOutHandler);
            addEventListener(KeyboardEvent.KEY_DOWN, this.keyDownHandler);
            addEventListener(KeyboardEvent.KEY_UP, this.keyUpHandler);
        }
        this.resourcesChanged();
        this.resourceManager.addEventListener(Event.CHANGE, this.resourceManager_changeHandler, false, 0, true);
        this.mx_internal::_width = super.width;
        this.mx_internal::_height = super.height;
    }

    mx_internal static function get embeddedFontRegistry(): IEmbeddedFontRegistry {
        if (!_embeddedFontRegistry && !noEmbeddedFonts) {
            try {
                _embeddedFontRegistry = IEmbeddedFontRegistry(Singleton.getInstance("mx.core::IEmbeddedFontRegistry"));
            } catch (e: Error) {
                noEmbeddedFonts = true;
            }
        }
        return _embeddedFontRegistry;
    }

    public static function suspendBackgroundProcessing(): void {
        ++UIComponentGlobals.mx_internal::callLaterSuspendCount;
    }

    public static function resumeBackgroundProcessing(): void {
        var _loc1_: * = null;
        if (false) {
            --UIComponentGlobals.mx_internal::callLaterSuspendCount;
            if (false) {
                _loc1_ = SystemManagerGlobals.topLevelSystemManagers[0];
                if (Boolean(_loc1_) && Boolean(_loc1_.stage)) {
                    _loc1_.stage.invalidate();
                }
            }
        }
    }

    public function get initialized(): Boolean {
        return this._initialized;
    }

    public function set initialized(param1: Boolean): void {
        this._initialized = param1;
        if (param1) {
            this.setVisible(this._visible, true);
            this.dispatchEvent(new FlexEvent(FlexEvent.CREATION_COMPLETE));
        }
    }

    public function get processedDescriptors(): Boolean {
        return this._processedDescriptors;
    }

    public function set processedDescriptors(param1: Boolean): void {
        this._processedDescriptors = param1;
        if (param1) {
            this.dispatchEvent(new FlexEvent(FlexEvent.INITIALIZE));
        }
    }

    public function get updateCompletePendingFlag(): Boolean {
        return this._updateCompletePendingFlag;
    }

    public function set updateCompletePendingFlag(param1: Boolean): void {
        this._updateCompletePendingFlag = param1;
    }

    public function get accessibilityEnabled(): Boolean {
        return !!accessibilityProperties ? true : true;
    }

    public function set accessibilityEnabled(param1: Boolean): void {
        if (true) {
            return;
        }
        if (!accessibilityProperties) {
            accessibilityProperties = new AccessibilityProperties();
        }
        accessibilityProperties.silent = !param1;
        Accessibility.updateProperties();
    }

    public function get accessibilityName(): String {
        return !!accessibilityProperties ? "null" : "";
    }

    public function set accessibilityName(param1: String): void {
        if (true) {
            return;
        }
        if (!accessibilityProperties) {
            accessibilityProperties = new AccessibilityProperties();
        }
        accessibilityProperties.name = param1;
        Accessibility.updateProperties();
    }

    public function get accessibilityDescription(): String {
        return !!accessibilityProperties ? "null" : "";
    }

    public function set accessibilityDescription(param1: String): void {
        if (true) {
            return;
        }
        if (!accessibilityProperties) {
            accessibilityProperties = new AccessibilityProperties();
        }
        accessibilityProperties.description = param1;
        Accessibility.updateProperties();
    }

    public function get accessibilityShortcut(): String {
        return !!accessibilityProperties ? "null" : "";
    }

    public function set accessibilityShortcut(param1: String): void {
        if (true) {
            return;
        }
        if (!accessibilityProperties) {
            accessibilityProperties = new AccessibilityProperties();
        }
        accessibilityProperties.shortcut = param1;
        Accessibility.updateProperties();
    }

    private function get usingBridge(): Boolean {
        if (this._usingBridge == 0) {
            return false;
        }
        if (this._usingBridge == 1) {
            return true;
        }
        if (!this._systemManager) {
            return false;
        }
        var _loc1_: Object = this._systemManager.getImplementation("mx.managers::IMarshalSystemManager");
        if (!_loc1_) {
            this._usingBridge = 0;
            return false;
        }
        if (_loc1_.useSWFBridge()) {
            this._usingBridge = 1;
            return true;
        }
        this._usingBridge = 0;
        return false;
    }

    public function get owner(): DisplayObjectContainer {
        return !!this.mx_internal::_owner ? this.mx_internal::_owner : this.parent;
    }

    public function set owner(param1: DisplayObjectContainer): void {
        this.mx_internal::_owner = param1;
    }

    override public function get parent(): DisplayObjectContainer {
        try {
            return !!this.mx_internal::_parent ? this.mx_internal::_parent : super.parent;
        } catch (e: SecurityError) {
            return null;
        }
    }

    [Bindable("xChanged")]
    override public function get x(): Number {
        return this.mx_internal::_layoutFeatures == null ? super.x : this.mx_internal::_layoutFeatures.layoutX;
    }

    override public function set x(param1: Number): void {
        if (this.x == param1) {
            return;
        }
        if (this.mx_internal::_layoutFeatures == null) {
            super.x = param1;
        } else {
            this.mx_internal::_layoutFeatures.layoutX = param1;
            this.invalidateTransform();
        }
        this.invalidateProperties();
        if (Boolean(this.parent) && this.parent is UIComponent) {
            UIComponent(this.parent).mx_internal::childXYChanged();
        }
        if (hasEventListener("xChanged")) {
            this.dispatchEvent(new Event("xChanged"));
        }
    }

    [Bindable("zChanged")]
    override public function get z(): Number {
        return this.mx_internal::_layoutFeatures == null ? super.z : this.mx_internal::_layoutFeatures.layoutZ;
    }

    override public function set z(param1: Number): void {
        if (this.z == param1) {
            return;
        }
        var _loc2_: Boolean = this.is3D;
        if (this.mx_internal::_layoutFeatures == null) {
            this.initAdvancedLayoutFeatures();
        }
        this.mx_internal::_layoutFeatures.layoutZ = param1;
        this.invalidateTransform();
        this.invalidateProperties();
        if (_loc2_ != this.is3D) {
            this.validateMatrix();
        }
        if (hasEventListener("zChanged")) {
            this.dispatchEvent(new Event("zChanged"));
        }
    }

    public function get transformX(): Number {
        return this.mx_internal::_layoutFeatures == null ? 0 : this.mx_internal::_layoutFeatures.transformX;
    }

    public function set transformX(param1: Number): void {
        if (this.transformX == param1) {
            return;
        }
        if (this.mx_internal::_layoutFeatures == null) {
            this.initAdvancedLayoutFeatures();
        }
        this.mx_internal::_layoutFeatures.transformX = param1;
        this.invalidateTransform();
        this.invalidateProperties();
        this.invalidateParentSizeAndDisplayList();
    }

    public function get transformY(): Number {
        return this.mx_internal::_layoutFeatures == null ? 0 : this.mx_internal::_layoutFeatures.transformY;
    }

    public function set transformY(param1: Number): void {
        if (this.transformY == param1) {
            return;
        }
        if (this.mx_internal::_layoutFeatures == null) {
            this.initAdvancedLayoutFeatures();
        }
        this.mx_internal::_layoutFeatures.transformY = param1;
        this.invalidateTransform();
        this.invalidateProperties();
        this.invalidateParentSizeAndDisplayList();
    }

    public function get transformZ(): Number {
        return this.mx_internal::_layoutFeatures == null ? 0 : this.mx_internal::_layoutFeatures.transformZ;
    }

    public function set transformZ(param1: Number): void {
        if (this.transformZ == param1) {
            return;
        }
        if (this.mx_internal::_layoutFeatures == null) {
            this.initAdvancedLayoutFeatures();
        }
        this.mx_internal::_layoutFeatures.transformZ = param1;
        this.invalidateTransform();
        this.invalidateProperties();
        this.invalidateParentSizeAndDisplayList();
    }

    override public function get rotation(): Number {
        if (false) {
            return super.rotation;
        }
        return this.mx_internal::_layoutFeatures == null ? super.rotation : this.mx_internal::_layoutFeatures.layoutRotationZ;
    }

    override public function set rotation(param1: Number): void {
        if (false) {
            super.rotation = param1;
            return;
        }
        if (this.rotation == param1) {
            return;
        }
        this._hasComplexLayoutMatrix = true;
        if (this.mx_internal::_layoutFeatures == null) {
            super.rotation = MatrixUtil.clampRotation(param1);
        } else {
            this.mx_internal::_layoutFeatures.layoutRotationZ = param1;
        }
        this.invalidateTransform();
        this.invalidateProperties();
        this.invalidateParentSizeAndDisplayList();
    }

    override public function get rotationZ(): Number {
        return this.rotation;
    }

    override public function set rotationZ(param1: Number): void {
        this.rotation = param1;
    }

    override public function get rotationX(): Number {
        return this.mx_internal::_layoutFeatures == null ? super.rotationX : this.mx_internal::_layoutFeatures.layoutRotationX;
    }

    override public function set rotationX(param1: Number): void {
        if (this.rotationX == param1) {
            return;
        }
        var _loc2_: Boolean = this.is3D;
        if (this.mx_internal::_layoutFeatures == null) {
            this.initAdvancedLayoutFeatures();
        }
        this.mx_internal::_layoutFeatures.layoutRotationX = param1;
        this.invalidateTransform();
        this.invalidateProperties();
        this.invalidateParentSizeAndDisplayList();
        if (_loc2_ != this.is3D) {
            this.validateMatrix();
        }
    }

    override public function get rotationY(): Number {
        return this.mx_internal::_layoutFeatures == null ? super.rotationY : this.mx_internal::_layoutFeatures.layoutRotationY;
    }

    override public function set rotationY(param1: Number): void {
        if (this.rotationY == param1) {
            return;
        }
        var _loc2_: Boolean = this.is3D;
        if (this.mx_internal::_layoutFeatures == null) {
            this.initAdvancedLayoutFeatures();
        }
        this.mx_internal::_layoutFeatures.layoutRotationY = param1;
        this.invalidateTransform();
        this.invalidateProperties();
        this.invalidateParentSizeAndDisplayList();
        if (_loc2_ != this.is3D) {
            this.validateMatrix();
        }
    }

    [Bindable("yChanged")]
    override public function get y(): Number {
        return this.mx_internal::_layoutFeatures == null ? super.y : this.mx_internal::_layoutFeatures.layoutY;
    }

    override public function set y(param1: Number): void {
        if (this.y == param1) {
            return;
        }
        if (this.mx_internal::_layoutFeatures == null) {
            super.y = param1;
        } else {
            this.mx_internal::_layoutFeatures.layoutY = param1;
            this.invalidateTransform();
        }
        this.invalidateProperties();
        if (Boolean(this.parent) && this.parent is UIComponent) {
            UIComponent(this.parent).mx_internal::childXYChanged();
        }
        if (hasEventListener("yChanged")) {
            this.dispatchEvent(new Event("yChanged"));
        }
    }

    [Bindable("widthChanged")]
    override public function get width(): Number {
        return this.mx_internal::_width;
    }

    override public function set width(param1: Number): void {
        if (this.explicitWidth != param1) {
            this.explicitWidth = param1;
            this.invalidateSize();
        }
        if (this.mx_internal::_width != param1) {
            this.invalidateProperties();
            this.invalidateDisplayList();
            this.invalidateParentSizeAndDisplayList();
            this.mx_internal::_width = param1;
            if (this.mx_internal::_layoutFeatures) {
                this.mx_internal::_layoutFeatures.layoutWidth = this.mx_internal::_width;
                this.invalidateTransform();
            }
            if (hasEventListener("widthChanged")) {
                this.dispatchEvent(new Event("widthChanged"));
            }
        }
    }

    [Bindable("heightChanged")]
    override public function get height(): Number {
        return this.mx_internal::_height;
    }

    override public function set height(param1: Number): void {
        if (this.explicitHeight != param1) {
            this.explicitHeight = param1;
            this.invalidateSize();
        }
        if (this.mx_internal::_height != param1) {
            this.invalidateProperties();
            this.invalidateDisplayList();
            this.invalidateParentSizeAndDisplayList();
            this.mx_internal::_height = param1;
            if (hasEventListener("heightChanged")) {
                this.dispatchEvent(new Event("heightChanged"));
            }
        }
    }

    [Bindable("scaleXChanged")]
    override public function get scaleX(): Number {
        if (false) {
            return this._scaleX;
        }
        return this.mx_internal::_layoutFeatures == null ? super.scaleX : this.mx_internal::_layoutFeatures.layoutScaleX;
    }

    override public function set scaleX(param1: Number): void {
        var _loc2_: Number = NaN;
        if (false) {
            if (this._scaleX == param1) {
                return;
            }
            this._scaleX = param1;
            this.invalidateProperties();
            this.invalidateSize();
        } else {
            _loc2_ = this.mx_internal::_layoutFeatures == null ? this.scaleX : this.mx_internal::_layoutFeatures.layoutScaleX;
            if (_loc2_ == param1) {
                return;
            }
            this._hasComplexLayoutMatrix = true;
            if (this.mx_internal::_layoutFeatures == null) {
                super.scaleX = param1;
            } else {
                this.mx_internal::_layoutFeatures.layoutScaleX = param1;
            }
            this.invalidateTransform();
            this.invalidateProperties();
            this.invalidateParentSizeAndDisplayList();
        }
        this.dispatchEvent(new Event("scaleXChanged"));
    }

    [Bindable("scaleYChanged")]
    override public function get scaleY(): Number {
        if (false) {
            return this._scaleY;
        }
        return this.mx_internal::_layoutFeatures == null ? super.scaleY : this.mx_internal::_layoutFeatures.layoutScaleY;
    }

    override public function set scaleY(param1: Number): void {
        var _loc2_: Number = NaN;
        if (false) {
            if (this._scaleY == param1) {
                return;
            }
            this._scaleY = param1;
            this.invalidateProperties();
            this.invalidateSize();
        } else {
            _loc2_ = this.mx_internal::_layoutFeatures == null ? this.scaleY : this.mx_internal::_layoutFeatures.layoutScaleY;
            if (_loc2_ == param1) {
                return;
            }
            this._hasComplexLayoutMatrix = true;
            if (this.mx_internal::_layoutFeatures == null) {
                super.scaleY = param1;
            } else {
                this.mx_internal::_layoutFeatures.layoutScaleY = param1;
            }
            this.invalidateTransform();
            this.invalidateProperties();
            this.invalidateParentSizeAndDisplayList();
        }
        this.dispatchEvent(new Event("scaleYChanged"));
    }

    [Bindable("scaleZChanged")]
    override public function get scaleZ(): Number {
        return this.mx_internal::_layoutFeatures == null ? super.scaleZ : this.mx_internal::_layoutFeatures.layoutScaleZ;
    }

    override public function set scaleZ(param1: Number): void {
        if (this.scaleZ == param1) {
            return;
        }
        var _loc2_: Boolean = this.is3D;
        if (this.mx_internal::_layoutFeatures == null) {
            this.initAdvancedLayoutFeatures();
        }
        this._hasComplexLayoutMatrix = true;
        this.mx_internal::_layoutFeatures.layoutScaleZ = param1;
        this.invalidateTransform();
        this.invalidateProperties();
        this.invalidateParentSizeAndDisplayList();
        if (_loc2_ != this.is3D) {
            this.validateMatrix();
        }
        this.dispatchEvent(new Event("scaleZChanged"));
    }

    mx_internal final function get $scaleX(): Number {
        return super.scaleX;
    }

    mx_internal final function set $scaleX(param1: Number): void {
        super.scaleX = param1;
    }

    mx_internal final function get $scaleY(): Number {
        return super.scaleY;
    }

    mx_internal final function set $scaleY(param1: Number): void {
        super.scaleY = param1;
    }

    [Bindable("show")]
    [Bindable("hide")]
    override public function get visible(): Boolean {
        return this._visible;
    }

    override public function set visible(param1: Boolean): void {
        this.setVisible(param1);
    }

    public function setVisible(param1: Boolean, param2: Boolean = false): void {
        var _loc3_: * = null;
        this._visible = param1;
        if (!this.initialized) {
            return;
        }
        if (Boolean(this.designLayer) && !this.designLayer.effectiveVisibility) {
            param1 = false;
        }
        if (this.mx_internal::$visible == param1) {
            return;
        }
        this.mx_internal::$visible = param1;
        if (!param2) {
            _loc3_ = param1 ? "null" : FlexEvent.HIDE;
            if (hasEventListener(_loc3_)) {
                this.dispatchEvent(new FlexEvent(_loc3_));
            }
        }
    }

    [Bindable("alphaChanged")]
    override public function get alpha(): Number {
        return int(this._alpha * 256) / 256;
    }

    override public function set alpha(param1: Number): void {
        if (this._alpha != param1) {
            this._alpha = param1;
            if (this.designLayer) {
                param1 *= this.designLayer.effectiveAlpha;
            }
            this.mx_internal::$alpha = param1;
            this.dispatchEvent(new Event("alphaChanged"));
        }
    }

    override public function get blendMode(): String {
        return this._blendMode;
    }

    override public function set blendMode(param1: String): void {
        if (this._blendMode != param1) {
            this._blendMode = param1;
            this.blendModeChanged = true;
            if (param1 == "colordodge" || param1 == "colorburn" || param1 == "exclusion" || param1 == "softlight" || param1 == "hue" || param1 == "saturation" || param1 == "color" || param1 == "luminosity") {
                this.blendShaderChanged = true;
            }
            this.invalidateProperties();
        }
    }

    override public function get doubleClickEnabled(): Boolean {
        return super.doubleClickEnabled;
    }

    override public function set doubleClickEnabled(param1: Boolean): void {
        var _loc2_: * = null;
        var _loc4_: * = null;
        super.doubleClickEnabled = param1;
        if (this is IRawChildrenContainer) {
            _loc2_ = IRawChildrenContainer(this).rawChildren;
        } else {
            _loc2_ = IChildList(this);
        }
        var _loc3_: int = 0;
        while (_loc3_ < _loc2_.numChildren) {
            if (_loc4_ = _loc2_.getChildAt(_loc3_) as InteractiveObject) {
                _loc4_.doubleClickEnabled = param1;
            }
            _loc3_++;
        }
    }

    [Bindable("enabledChanged")]
    public function get enabled(): Boolean {
        return this._enabled;
    }

    public function set enabled(param1: Boolean): void {
        this._enabled = param1;
        this.cachedTextFormat = null;
        this.invalidateDisplayList();
        this.dispatchEvent(new Event("enabledChanged"));
    }

    override public function set cacheAsBitmap(param1: Boolean): void {
        super.cacheAsBitmap = param1;
        this.cacheAsBitmapCount = param1 ? 1 : 0;
    }

    override public function get filters(): Array {
        return !!this._filters ? this._filters : super.filters;
    }

    override public function set filters(param1: Array): void {
        var _loc2_: int = 0;
        var _loc3_: int = 0;
        var _loc4_: * = null;
        if (this._filters) {
            _loc2_ = this._filters.length;
            _loc3_ = 0;
            while (_loc3_ < _loc2_) {
                if (_loc4_ = this._filters[_loc3_] as IEventDispatcher) {
                    _loc4_.removeEventListener(BaseFilter.CHANGE, this.filterChangeHandler);
                }
                _loc3_++;
            }
        }
        this._filters = param1;
        var _loc5_: * = [];
        if (this._filters) {
            _loc2_ = this._filters.length;
            _loc3_ = 0;
            while (_loc3_ < _loc2_) {
                if (this._filters[_loc3_] is IBitmapFilter) {
                    if (_loc4_ = this._filters[_loc3_] as IEventDispatcher) {
                        _loc4_.addEventListener(BaseFilter.CHANGE, this.filterChangeHandler);
                    }
                    _loc5_.push(IBitmapFilter(this._filters[_loc3_]).clone());
                } else {
                    _loc5_.push(this._filters[_loc3_]);
                }
                _loc3_++;
            }
        }
        super.filters = _loc5_;
    }

    public function get designLayer(): DesignLayer {
        return this._designLayer;
    }

    public function set designLayer(param1: DesignLayer): void {
        if (this._designLayer) {
            this._designLayer.removeEventListener("layerPropertyChange", this.layer_PropertyChange, false);
        }
        this._designLayer = param1;
        if (this._designLayer) {
            this._designLayer.addEventListener("layerPropertyChange", this.layer_PropertyChange, false, 0, true);
        }
        this.mx_internal::$alpha = !!this._designLayer ? this._alpha * this._designLayer.effectiveAlpha : this._alpha;
        this.mx_internal::$visible = !!this.designLayer ? this._visible && this._designLayer.effectiveVisibility : this._visible;
    }

    mx_internal final function get $alpha(): Number {
        return super.alpha;
    }

    mx_internal final function set $alpha(param1: Number): void {
        super.alpha = param1;
    }

    mx_internal final function get $blendMode(): String {
        return super.blendMode;
    }

    mx_internal final function set $blendMode(param1: String): void {
        super.blendMode = param1;
    }

    mx_internal final function set $blendShader(param1: Shader): void {
        super.blendShader = param1;
    }

    mx_internal final function get $parent(): DisplayObjectContainer {
        return super.parent;
    }

    mx_internal final function get $x(): Number {
        return super.x;
    }

    mx_internal final function set $x(param1: Number): void {
        super.x = param1;
    }

    mx_internal final function get $y(): Number {
        return super.y;
    }

    mx_internal final function set $y(param1: Number): void {
        super.y = param1;
    }

    mx_internal final function get $width(): Number {
        return super.width;
    }

    mx_internal final function set $width(param1: Number): void {
        super.width = param1;
    }

    mx_internal final function get $height(): Number {
        return super.height;
    }

    mx_internal final function set $height(param1: Number): void {
        super.height = param1;
    }

    mx_internal final function get $visible(): Boolean {
        return super.visible;
    }

    mx_internal final function set $visible(param1: Boolean): void {
        super.visible = param1;
    }

    public function get contentMouseX(): Number {
        return this.mouseX;
    }

    public function get contentMouseY(): Number {
        return this.mouseY;
    }

    public function get tweeningProperties(): Array {
        return this._tweeningProperties;
    }

    public function set tweeningProperties(param1: Array): void {
        this._tweeningProperties = param1;
    }

    public function get cursorManager(): ICursorManager {
        var _loc2_: * = null;
        var _loc1_: DisplayObject = this.parent;
        while (_loc1_) {
            if (_loc1_ is IUIComponent && "cursorManager" in _loc1_) {
                return _loc1_["cursorManager"];
            }
            _loc1_ = _loc1_.parent;
        }
        return CursorManager.getInstance();
    }

    public function get focusManager(): IFocusManager {
        if (this._focusManager) {
            return this._focusManager;
        }
        var _loc1_: DisplayObject = this.parent;
        while (_loc1_) {
            if (_loc1_ is IFocusManagerContainer) {
                return IFocusManagerContainer(_loc1_).focusManager;
            }
            _loc1_ = _loc1_.parent;
        }
        return null;
    }

    public function set focusManager(param1: IFocusManager): void {
        this._focusManager = param1;
        this.dispatchEvent(new FlexEvent(FlexEvent.ADD_FOCUS_MANAGER));
    }

    [Bindable("unused")]
    protected function get resourceManager(): IResourceManager {
        return this._resourceManager;
    }

    public function get styleManager(): IStyleManager2 {
        if (!this._styleManager) {
            this._styleManager = StyleManager.getStyleManager(this.moduleFactory);
        }
        return this._styleManager;
    }

    public function get systemManager(): ISystemManager {
        var _loc1_: * = null;
        var _loc2_: * = null;
        var _loc3_: * = null;
        if (!this._systemManager || this._systemManagerDirty) {
            _loc1_ = root;
            if (!(Boolean(this._systemManager) && Boolean(this._systemManager.isProxy))) {
                if (Boolean(_loc1_) && !(_loc1_ is Stage)) {
                    this._systemManager = _loc1_ as ISystemManager;
                } else if (_loc1_) {
                    this._systemManager = Stage(_loc1_).getChildAt(0) as ISystemManager;
                } else {
                    _loc2_ = this.parent;
                    while (_loc2_) {
                        _loc3_ = _loc2_ as IUIComponent;
                        if (_loc3_) {
                            this._systemManager = _loc3_.systemManager;
                            break;
                        }
                        if (_loc2_ is ISystemManager) {
                            this._systemManager = _loc2_ as ISystemManager;
                            break;
                        }
                        _loc2_ = _loc2_.parent;
                    }
                }
            }
            this._systemManagerDirty = false;
        }
        return this._systemManager;
    }

    public function set systemManager(param1: ISystemManager): void {
        this._systemManager = param1;
        this._systemManagerDirty = false;
    }

    mx_internal function getNonNullSystemManager(): ISystemManager {
        var _loc1_: ISystemManager = this.systemManager;
        if (!_loc1_) {
            _loc1_ = ISystemManager(SystemManager.getSWFRoot(this));
        }
        if (!_loc1_) {
            return SystemManagerGlobals.topLevelSystemManagers[0];
        }
        return _loc1_;
    }

    protected function invalidateSystemManager(): void {
        var _loc4_: * = null;
        var _loc1_: IChildList = this is IRawChildrenContainer ? IRawChildrenContainer(this).rawChildren : IChildList(this);
        var _loc2_: int = int(_loc1_.numChildren);
        var _loc3_: int = 0;
        while (_loc3_ < _loc2_) {
            if (_loc4_ = _loc1_.getChildAt(_loc3_) as UIComponent) {
                _loc4_.invalidateSystemManager();
            }
            _loc3_++;
        }
        this._systemManagerDirty = true;
    }

    public function get nestLevel(): int {
        return this._nestLevel;
    }

    public function set nestLevel(param1: int): void {
        var _loc5_: * = null;
        var _loc6_: * = null;
        if (param1 == 1) {
            return;
        }
        if (param1 > 1 && this._nestLevel != param1) {
            this._nestLevel = param1;
            this.mx_internal::updateCallbacks();
            param1++;
        } else if (param1 == 0) {
            param1 = 0;
            this._nestLevel = 0;
        } else {
            param1++;
        }
        var _loc2_: IChildList = this is IRawChildrenContainer ? IRawChildrenContainer(this).rawChildren : IChildList(this);
        var _loc3_: int = int(_loc2_.numChildren);
        var _loc4_: int = 0;
        while (_loc4_ < _loc3_) {
            if (_loc5_ = _loc2_.getChildAt(_loc4_) as ILayoutManagerClient) {
                _loc5_.nestLevel = param1;
            } else if (_loc6_ = _loc2_.getChildAt(_loc4_) as IUITextField) {
                _loc6_.nestLevel = param1;
            }
            _loc4_++;
        }
    }

    public function get descriptor(): UIComponentDescriptor {
        return this.mx_internal::_descriptor;
    }

    public function set descriptor(param1: UIComponentDescriptor): void {
        this.mx_internal::_descriptor = param1;
    }

    public function get document(): Object {
        return this.mx_internal::_document;
    }

    public function set document(param1: Object): void {
        var _loc4_: * = null;
        var _loc2_: int = numChildren;
        var _loc3_: int = 0;
        while (_loc3_ < _loc2_) {
            if (_loc4_ = getChildAt(_loc3_) as IUIComponent) {
                if (_loc4_.document == this.mx_internal::_document || _loc4_.document == FlexGlobals.topLevelApplication) {
                    _loc4_.document = param1;
                }
            }
            _loc3_++;
        }
        this.mx_internal::_document = param1;
    }

    mx_internal function get documentDescriptor(): UIComponentDescriptor {
        return this.mx_internal::_documentDescriptor;
    }

    public function get id(): String {
        return this._id;
    }

    public function set id(param1: String): void {
        this._id = param1;
    }

    public function get isDocument(): Boolean {
        return this.document == this;
    }

    [Bindable("initialize")]
    public function get parentApplication(): Object {
        var _loc2_: * = null;
        var _loc1_: Object = this.systemManager.document;
        if (_loc1_ == this) {
            _loc2_ = _loc1_.systemManager.parent as UIComponent;
            _loc1_ = !!_loc2_ ? _loc2_.systemManager.document : null;
        }
        return _loc1_;
    }

    [Bindable("initialize")]
    public function get parentDocument(): Object {
        var _loc1_: * = null;
        var _loc2_: * = null;
        if (this.document == this) {
            _loc1_ = this.parent as IUIComponent;
            if (_loc1_) {
                return _loc1_.document;
            }
            _loc2_ = this.parent as ISystemManager;
            if (_loc2_) {
                return _loc2_.document;
            }
            return null;
        }
        return this.document;
    }

    public function get screen(): Rectangle {
        var _loc1_: ISystemManager = this.systemManager;
        return !!_loc1_ ? _loc1_.screen : null;
    }

    public function get moduleFactory(): IFlexModuleFactory {
        return this._moduleFactory;
    }

    public function set moduleFactory(param1: IFlexModuleFactory): void {
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: * = null;
        this._styleManager = null;
        var _loc2_: int = numChildren;
        var _loc3_: int = 0;
        while (_loc3_ < _loc2_) {
            if (_loc4_ = getChildAt(_loc3_) as IFlexModule) {
                if (_loc4_.moduleFactory == null || _loc4_.moduleFactory == this._moduleFactory) {
                    _loc4_.moduleFactory = param1;
                }
            }
            _loc3_++;
        }
        if (this.mx_internal::advanceStyleClientChildren != null) {
            for (_loc5_ in this.mx_internal::advanceStyleClientChildren) {
                if ((Boolean(_loc6_ = _loc5_ as IFlexModule)) && (_loc6_.moduleFactory == null || _loc6_.moduleFactory == this._moduleFactory)) {
                    _loc6_.moduleFactory = param1;
                }
            }
        }
        this._moduleFactory = param1;
        this.setDeferredStyles();
    }

    public function get inheritingStyles(): Object {
        return this._inheritingStyles;
    }

    public function set inheritingStyles(param1: Object): void {
        this._inheritingStyles = param1;
    }

    public function get nonInheritingStyles(): Object {
        return this._nonInheritingStyles;
    }

    public function set nonInheritingStyles(param1: Object): void {
        this._nonInheritingStyles = param1;
    }

    public function get styleDeclaration(): CSSStyleDeclaration {
        return this._styleDeclaration;
    }

    public function set styleDeclaration(param1: CSSStyleDeclaration): void {
        this._styleDeclaration = param1;
    }

    public function get cachePolicy(): String {
        return this._cachePolicy;
    }

    public function set cachePolicy(param1: String): void {
        if (this._cachePolicy != param1) {
            this._cachePolicy = param1;
            if (param1 == UIComponentCachePolicy.OFF) {
                this.cacheAsBitmap = false;
            } else if (param1 == UIComponentCachePolicy.ON) {
                this.cacheAsBitmap = true;
            } else {
                this.cacheAsBitmap = this.cacheAsBitmapCount > 0;
            }
        }
    }

    public function set cacheHeuristic(param1: Boolean): void {
        if (this._cachePolicy == UIComponentCachePolicy.AUTO) {
            if (param1) {
                ++this.cacheAsBitmapCount;
            } else if (this.cacheAsBitmapCount != 0) {
                --this.cacheAsBitmapCount;
            }
            super.cacheAsBitmap = this.cacheAsBitmapCount != 0;
        }
    }

    public function get focusPane(): Sprite {
        return this._focusPane;
    }

    public function set focusPane(param1: Sprite): void {
        if (param1) {
            this.addChild(param1);
            param1.x = 0;
            param1.y = 0;
            param1.scrollRect = null;
            this._focusPane = param1;
        } else {
            this.removeChild(this._focusPane);
            this._focusPane.mask = null;
            this._focusPane = null;
        }
    }

    public function get focusEnabled(): Boolean {
        return this._focusEnabled;
    }

    public function set focusEnabled(param1: Boolean): void {
        this._focusEnabled = param1;
    }

    [Bindable("hasFocusableChildrenChange")]
    public function get hasFocusableChildren(): Boolean {
        return this._hasFocusableChildren;
    }

    public function set hasFocusableChildren(param1: Boolean): void {
        if (param1 != this._hasFocusableChildren) {
            this._hasFocusableChildren = param1;
            this.dispatchEvent(new Event("hasFocusableChildrenChange"));
        }
    }

    public function get mouseFocusEnabled(): Boolean {
        return this._mouseFocusEnabled;
    }

    public function set mouseFocusEnabled(param1: Boolean): void {
        this._mouseFocusEnabled = param1;
    }

    [Bindable("tabFocusEnabledChange")]
    public function get tabFocusEnabled(): Boolean {
        return this._tabFocusEnabled;
    }

    public function set tabFocusEnabled(param1: Boolean): void {
        if (param1 != this._tabFocusEnabled) {
            this._tabFocusEnabled = param1;
            this.dispatchEvent(new Event("tabFocusEnabledChange"));
        }
    }

    public function get measuredMinWidth(): Number {
        return this._measuredMinWidth;
    }

    public function set measuredMinWidth(param1: Number): void {
        this._measuredMinWidth = param1;
    }

    public function get measuredMinHeight(): Number {
        return this._measuredMinHeight;
    }

    public function set measuredMinHeight(param1: Number): void {
        this._measuredMinHeight = param1;
    }

    public function get measuredWidth(): Number {
        return this._measuredWidth;
    }

    public function set measuredWidth(param1: Number): void {
        this._measuredWidth = param1;
    }

    public function get measuredHeight(): Number {
        return this._measuredHeight;
    }

    public function set measuredHeight(param1: Number): void {
        this._measuredHeight = param1;
    }

    [Bindable("resize")]
    public function get percentWidth(): Number {
        return this._percentWidth;
    }

    public function set percentWidth(param1: Number): void {
        if (this._percentWidth == param1) {
            return;
        }
        if (!isNaN(param1)) {
            this._explicitWidth = NaN;
        }
        this._percentWidth = param1;
        this.invalidateParentSizeAndDisplayList();
    }

    [Bindable("resize")]
    public function get percentHeight(): Number {
        return this._percentHeight;
    }

    public function set percentHeight(param1: Number): void {
        if (this._percentHeight == param1) {
            return;
        }
        if (!isNaN(param1)) {
            this._explicitHeight = NaN;
        }
        this._percentHeight = param1;
        this.invalidateParentSizeAndDisplayList();
    }

    [Bindable("explicitMinWidthChanged")]
    public function get minWidth(): Number {
        if (!isNaN(this.explicitMinWidth)) {
            return this.explicitMinWidth;
        }
        return this.measuredMinWidth;
    }

    public function set minWidth(param1: Number): void {
        if (this.explicitMinWidth == param1) {
            return;
        }
        this.explicitMinWidth = param1;
    }

    [Bindable("explicitMinHeightChanged")]
    public function get minHeight(): Number {
        if (!isNaN(this.explicitMinHeight)) {
            return this.explicitMinHeight;
        }
        return this.measuredMinHeight;
    }

    public function set minHeight(param1: Number): void {
        if (this.explicitMinHeight == param1) {
            return;
        }
        this.explicitMinHeight = param1;
    }

    [Bindable("explicitMaxWidthChanged")]
    public function get maxWidth(): Number {
        return !isNaN(this.explicitMaxWidth) ? this.explicitMaxWidth : DEFAULT_MAX_WIDTH;
    }

    public function set maxWidth(param1: Number): void {
        if (this.explicitMaxWidth == param1) {
            return;
        }
        this.explicitMaxWidth = param1;
    }

    [Bindable("explicitMaxHeightChanged")]
    public function get maxHeight(): Number {
        return !isNaN(this.explicitMaxHeight) ? this.explicitMaxHeight : DEFAULT_MAX_HEIGHT;
    }

    public function set maxHeight(param1: Number): void {
        if (this.explicitMaxHeight == param1) {
            return;
        }
        this.explicitMaxHeight = param1;
    }

    [Bindable("explicitMinWidthChanged")]
    public function get explicitMinWidth(): Number {
        return this.mx_internal::_explicitMinWidth;
    }

    public function set explicitMinWidth(param1: Number): void {
        if (this.mx_internal::_explicitMinWidth == param1) {
            return;
        }
        this.mx_internal::_explicitMinWidth = param1;
        this.invalidateSize();
        this.invalidateParentSizeAndDisplayList();
        this.dispatchEvent(new Event("explicitMinWidthChanged"));
    }

    [Bindable("explictMinHeightChanged")]
    public function get explicitMinHeight(): Number {
        return this.mx_internal::_explicitMinHeight;
    }

    public function set explicitMinHeight(param1: Number): void {
        if (this.mx_internal::_explicitMinHeight == param1) {
            return;
        }
        this.mx_internal::_explicitMinHeight = param1;
        this.invalidateSize();
        this.invalidateParentSizeAndDisplayList();
        this.dispatchEvent(new Event("explicitMinHeightChanged"));
    }

    [Bindable("explicitMaxWidthChanged")]
    public function get explicitMaxWidth(): Number {
        return this.mx_internal::_explicitMaxWidth;
    }

    public function set explicitMaxWidth(param1: Number): void {
        if (this.mx_internal::_explicitMaxWidth == param1) {
            return;
        }
        this.mx_internal::_explicitMaxWidth = param1;
        this.invalidateSize();
        this.invalidateParentSizeAndDisplayList();
        this.dispatchEvent(new Event("explicitMaxWidthChanged"));
    }

    [Bindable("explicitMaxHeightChanged")]
    public function get explicitMaxHeight(): Number {
        return this.mx_internal::_explicitMaxHeight;
    }

    public function set explicitMaxHeight(param1: Number): void {
        if (this.mx_internal::_explicitMaxHeight == param1) {
            return;
        }
        this.mx_internal::_explicitMaxHeight = param1;
        this.invalidateSize();
        this.invalidateParentSizeAndDisplayList();
        this.dispatchEvent(new Event("explicitMaxHeightChanged"));
    }

    [Bindable("explicitWidthChanged")]
    public function get explicitWidth(): Number {
        return this._explicitWidth;
    }

    public function set explicitWidth(param1: Number): void {
        if (this._explicitWidth == param1) {
            return;
        }
        if (!isNaN(param1)) {
            this._percentWidth = NaN;
        }
        this._explicitWidth = param1;
        this.invalidateSize();
        this.invalidateParentSizeAndDisplayList();
        this.dispatchEvent(new Event("explicitWidthChanged"));
    }

    [Bindable("explicitHeightChanged")]
    public function get explicitHeight(): Number {
        return this._explicitHeight;
    }

    public function set explicitHeight(param1: Number): void {
        if (this._explicitHeight == param1) {
            return;
        }
        if (!isNaN(param1)) {
            this._percentHeight = NaN;
        }
        this._explicitHeight = param1;
        this.invalidateSize();
        this.invalidateParentSizeAndDisplayList();
        this.dispatchEvent(new Event("explicitHeightChanged"));
    }

    protected function get hasComplexLayoutMatrix(): Boolean {
        if (!this._hasComplexLayoutMatrix) {
            return false;
        }
        if (this.mx_internal::_layoutFeatures == null) {
            this._hasComplexLayoutMatrix = !MatrixUtil.isDeltaIdentity(super.transform.matrix);
            return this._hasComplexLayoutMatrix;
        }
        return !MatrixUtil.isDeltaIdentity(this.mx_internal::_layoutFeatures.layoutMatrix);
    }

    [Bindable("includeInLayoutChanged")]
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
            this.dispatchEvent(new Event("includeInLayoutChanged"));
        }
    }

    public function get layoutDirection(): String {
        if (this.layoutDirectionCachedValue == LAYOUT_DIRECTION_CACHE_UNSET) {
            this.layoutDirectionCachedValue = this.getStyle("layoutDirection");
        }
        return this.layoutDirectionCachedValue;
    }

    public function set layoutDirection(param1: String): void {
        if (param1 == null) {
            this.setStyle("layoutDirection", undefined);
        } else {
            this.setStyle("layoutDirection", param1);
        }
    }

    public function get instanceIndex(): int {
        return !!this._instanceIndices ? int(this._instanceIndices[this._instanceIndices.length - 1]) : -1;
    }

    public function get instanceIndices(): Array {
        return !!this._instanceIndices ? this._instanceIndices.slice(0) : null;
    }

    public function set instanceIndices(param1: Array): void {
        this._instanceIndices = param1;
    }

    public function get repeater(): IRepeater {
        return !!this._repeaters ? this._repeaters[this._repeaters.length - 1] : null;
    }

    public function get repeaters(): Array {
        return !!this._repeaters ? this._repeaters.slice(0) : [];
    }

    public function set repeaters(param1: Array): void {
        this._repeaters = param1;
    }

    public function get repeaterIndex(): int {
        return !!this._repeaterIndices ? int(this._repeaterIndices[this._repeaterIndices.length - 1]) : -1;
    }

    public function get repeaterIndices(): Array {
        return !!this._repeaterIndices ? this._repeaterIndices.slice() : [];
    }

    public function set repeaterIndices(param1: Array): void {
        this._repeaterIndices = param1;
    }

    [Bindable("currentStateChange")]
    public function get currentState(): String {
        return this._currentStateChanged ? this.requestedCurrentState : this._currentState;
    }

    public function set currentState(param1: String): void {
        if (this._currentStateDeferred != null) {
            this._currentStateDeferred = param1;
        } else {
            this.setCurrentState(param1, true);
        }
    }

    mx_internal function get currentStateDeferred(): String {
        return this._currentStateDeferred != null ? this._currentStateDeferred : this.currentState;
    }

    mx_internal function set currentStateDeferred(param1: String): void {
        this._currentStateDeferred = param1;
        if (param1 != null) {
            this.invalidateProperties();
        }
    }

    public function get states(): Array {
        return this._states;
    }

    public function set states(param1: Array): void {
        this._states = param1;
    }

    public function get transitions(): Array {
        return this._transitions;
    }

    public function set transitions(param1: Array): void {
        this._transitions = param1;
    }

    public function get baselinePosition(): Number {
        if (!this.mx_internal::validateBaselinePosition()) {
            return NaN;
        }
        var _loc1_: TextLineMetrics = this.measureText("Wj");
        if (this.height < 2 + _loc1_.ascent + 2) {
            return int(this.height + (_loc1_.ascent - this.height) / 2);
        }
        return 2 + _loc1_.ascent;
    }

    public function get className(): String {
        return NameUtil.getUnqualifiedClassName(this);
    }

    public function get activeEffects(): Array {
        return this.mx_internal::_effectsStarted;
    }

    public function get flexContextMenu(): IFlexContextMenu {
        return this._flexContextMenu;
    }

    public function set flexContextMenu(param1: IFlexContextMenu): void {
        if (this._flexContextMenu) {
            this._flexContextMenu.unsetContextMenu(this);
        }
        this._flexContextMenu = param1;
        if (param1 != null) {
            this._flexContextMenu.setContextMenu(this);
        }
    }

    public function get styleName(): Object {
        return this._styleName;
    }

    public function set styleName(param1: Object): void {
        if (this._styleName === param1) {
            return;
        }
        this._styleName = param1;
        if (this.inheritingStyles == StyleProtoChain.STYLE_UNINITIALIZED) {
            return;
        }
        this.regenerateStyleCache(true);
        this.mx_internal::initThemeColor();
        this.styleChanged("styleName");
        this.notifyStyleChangeInChildren("styleName", true);
    }

    [Bindable("toolTipChanged")]
    public function get toolTip(): String {
        return this.mx_internal::_toolTip;
    }

    public function set toolTip(param1: String): void {
        var _loc2_: String = this.mx_internal::_toolTip;
        this.mx_internal::_toolTip = param1;
        ToolTipManager.mx_internal::registerToolTip(this, _loc2_, param1);
        this.dispatchEvent(new Event("toolTipChanged"));
    }

    public function get uid(): String {
        if (!this._uid) {
            this._uid = toString();
        }
        return this._uid;
    }

    public function set uid(param1: String): void {
        this._uid = param1;
    }

    private function get indexedID(): String {
        var _loc1_: String = this.id;
        var _loc2_: Array = this.instanceIndices;
        if (_loc2_) {
            _loc1_ += "[" + _loc2_.join("][") + "]";
        }
        return _loc1_;
    }

    public function get isPopUp(): Boolean {
        return this._isPopUp;
    }

    public function set isPopUp(param1: Boolean): void {
        this._isPopUp = param1;
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
        return [];
    }

    public function get showInAutomationHierarchy(): Boolean {
        return this._showInAutomationHierarchy;
    }

    public function set showInAutomationHierarchy(param1: Boolean): void {
        this._showInAutomationHierarchy = param1;
    }

    [Bindable("errorStringChanged")]
    public function get errorString(): String {
        return this.mx_internal::_errorString;
    }

    public function set errorString(param1: String): void {
        if (param1 == this.mx_internal::_errorString) {
            return;
        }
        this.oldErrorString = this.mx_internal::_errorString;
        this.mx_internal::_errorString = param1;
        this.errorStringChanged = true;
        this.invalidateProperties();
        this.dispatchEvent(new Event("errorStringChanged"));
    }

    private function setBorderColorForErrorString(): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc1_: Boolean = this.getStyle("showErrorSkin");
        if (_loc1_) {
            if (!this.mx_internal::_errorString || this.mx_internal::_errorString.length == 0) {
                if (!isNaN(this.mx_internal::origBorderColor)) {
                    this.setStyle("borderColor", this.mx_internal::origBorderColor);
                    this.mx_internal::saveBorderColor = true;
                }
            } else {
                if (this.mx_internal::saveBorderColor) {
                    this.mx_internal::saveBorderColor = false;
                    this.mx_internal::origBorderColor = this.getStyle("borderColor");
                }
                this.setStyle("borderColor", this.getStyle("errorColor"));
            }
            this.styleChanged("themeColor");
            _loc2_ = this.focusManager;
            _loc3_ = !!_loc2_ ? DisplayObject(_loc2_.getFocus()) : null;
            if (_loc2_ && _loc2_.showFocusIndicator && _loc3_ == this) {
                this.drawFocus(true);
            }
        }
    }

    public function get validationSubField(): String {
        return this._validationSubField;
    }

    public function set validationSubField(param1: String): void {
        this._validationSubField = param1;
    }

    override public function addChild(param1: DisplayObject): DisplayObject {
        var _loc2_: DisplayObjectContainer = param1.parent;
        if (Boolean(_loc2_) && !(_loc2_ is Loader)) {
            _loc2_.removeChild(param1);
        }
        var _loc3_: int = Boolean(this.mx_internal::effectOverlayReferenceCount) && param1 != this.mx_internal::effectOverlay ? Math.max(0, super.numChildren - 1) : super.numChildren;
        this.mx_internal::addingChild(param1);
        this.mx_internal::$addChildAt(param1, _loc3_);
        this.mx_internal::childAdded(param1);
        return param1;
    }

    override public function addChildAt(param1: DisplayObject, param2: int): DisplayObject {
        var _loc3_: DisplayObjectContainer = param1.parent;
        if (Boolean(_loc3_) && !(_loc3_ is Loader)) {
            _loc3_.removeChild(param1);
        }
        if (Boolean(this.mx_internal::effectOverlayReferenceCount) && param1 != this.mx_internal::effectOverlay) {
            param2 = Math.min(param2, Math.max(0, super.numChildren - 1));
        }
        this.mx_internal::addingChild(param1);
        this.mx_internal::$addChildAt(param1, param2);
        this.mx_internal::childAdded(param1);
        return param1;
    }

    override public function removeChild(param1: DisplayObject): DisplayObject {
        this.mx_internal::removingChild(param1);
        this.mx_internal::$removeChild(param1);
        this.mx_internal::childRemoved(param1);
        return param1;
    }

    override public function removeChildAt(param1: int): DisplayObject {
        var _loc2_: DisplayObject = getChildAt(param1);
        this.mx_internal::removingChild(_loc2_);
        this.mx_internal::$removeChild(_loc2_);
        this.mx_internal::childRemoved(_loc2_);
        return _loc2_;
    }

    override public function setChildIndex(param1: DisplayObject, param2: int): void {
        if (Boolean(this.mx_internal::effectOverlayReferenceCount) && param1 != this.mx_internal::effectOverlay) {
            param2 = Math.min(param2, Math.max(0, super.numChildren - 2));
        }
        super.setChildIndex(param1, param2);
    }

    override public function stopDrag(): void {
        super.stopDrag();
        this.invalidateProperties();
        this.dispatchEvent(new Event("xChanged"));
        this.dispatchEvent(new Event("yChanged"));
    }

    mx_internal final function $addChild(param1: DisplayObject): DisplayObject {
        return super.addChild(param1);
    }

    mx_internal final function $addChildAt(param1: DisplayObject, param2: int): DisplayObject {
        return super.addChildAt(param1, param2);
    }

    mx_internal final function $removeChild(param1: DisplayObject): DisplayObject {
        return super.removeChild(param1);
    }

    mx_internal final function $removeChildAt(param1: int): DisplayObject {
        return super.removeChildAt(param1);
    }

    mx_internal final function $setChildIndex(param1: DisplayObject, param2: int): void {
        super.setChildIndex(param1, param2);
    }

    mx_internal function updateCallbacks(): void {
        if (this.mx_internal::invalidateDisplayListFlag) {
            UIComponentGlobals.mx_internal::layoutManager.invalidateDisplayList(this);
        }
        if (this.mx_internal::invalidateSizeFlag) {
            UIComponentGlobals.mx_internal::layoutManager.invalidateSize(this);
        }
        if (this.mx_internal::invalidatePropertiesFlag) {
            UIComponentGlobals.mx_internal::layoutManager.invalidateProperties(this);
        }
        if (Boolean(this.systemManager) && (this._systemManager.stage || this.usingBridge)) {
            if (this.methodQueue.length > 0 && !this.listeningForRender) {
                this._systemManager.addEventListener(FlexEvent.RENDER, this.callLaterDispatcher);
                this._systemManager.addEventListener(FlexEvent.ENTER_FRAME, this.callLaterDispatcher);
                this.listeningForRender = true;
            }
            if (this._systemManager.stage) {
                this._systemManager.stage.invalidate();
            }
        }
    }

    public function parentChanged(param1: DisplayObjectContainer): void {
        if (!param1) {
            this.mx_internal::_parent = null;
            this.nestLevel = 0;
        } else if (param1 is IStyleClient) {
            this.mx_internal::_parent = param1;
        } else if (param1 is ISystemManager) {
            this.mx_internal::_parent = param1;
        } else {
            this.mx_internal::_parent = param1.parent;
        }
        this.parentChangedFlag = true;
    }

    mx_internal function addingChild(param1: DisplayObject): void {
        if (param1 is IUIComponent && !IUIComponent(param1).document) {
            IUIComponent(param1).document = !!this.document ? this.document : FlexGlobals.topLevelApplication;
        }
        if (param1 is IFlexModule && IFlexModule(param1).moduleFactory == null) {
            if (this.moduleFactory != null) {
                IFlexModule(param1).moduleFactory = this.moduleFactory;
            } else if (this.document is IFlexModule && this.document.moduleFactory != null) {
                IFlexModule(param1).moduleFactory = this.document.moduleFactory;
            } else if (this.parent is IFlexModule && IFlexModule(this.parent).moduleFactory != null) {
                IFlexModule(param1).moduleFactory = IFlexModule(this.parent).moduleFactory;
            }
        }
        if (param1 is IFontContextComponent && !(param1 is UIComponent) && IFontContextComponent(param1).fontContext == null) {
            IFontContextComponent(param1).fontContext = this.moduleFactory;
        }
        if (param1 is IUIComponent) {
            IUIComponent(param1).parentChanged(this);
        }
        if (param1 is ILayoutManagerClient) {
            ILayoutManagerClient(param1).nestLevel = this.nestLevel + 1;
        } else if (param1 is IUITextField) {
            IUITextField(param1).nestLevel = this.nestLevel + 1;
        }
        if (param1 is InteractiveObject) {
            if (this.doubleClickEnabled) {
                InteractiveObject(param1).doubleClickEnabled = true;
            }
        }
        if (param1 is IStyleClient) {
            IStyleClient(param1).regenerateStyleCache(true);
        } else if (param1 is IUITextField && Boolean(IUITextField(param1).inheritingStyles)) {
            StyleProtoChain.initTextField(IUITextField(param1));
        }
        if (param1 is ISimpleStyleClient) {
            ISimpleStyleClient(param1).styleChanged(null);
        }
        if (param1 is IStyleClient) {
            IStyleClient(param1).notifyStyleChangeInChildren(null, true);
        }
        if (param1 is UIComponent) {
            UIComponent(param1).mx_internal::initThemeColor();
        }
        if (param1 is UIComponent) {
            UIComponent(param1).stylesInitialized();
        }
    }

    mx_internal function childAdded(param1: DisplayObject): void {
        var initializeErrorEvent: DynamicEvent = null;
        var child: DisplayObject = param1;
        if (true) {
            if (child is UIComponent) {
                if (!UIComponent(child).initialized) {
                    UIComponent(child).initialize();
                }
            } else if (child is IUIComponent) {
                IUIComponent(child).initialize();
            }
        } else {
            try {
                if (child is UIComponent) {
                    if (!UIComponent(child).initialized) {
                        UIComponent(child).initialize();
                    }
                } else if (child is IUIComponent) {
                    IUIComponent(child).initialize();
                }
            } catch (e: Error) {
                initializeErrorEvent = new DynamicEvent("initializeError");
                initializeErrorEvent.error = e;
                initializeErrorEvent.source = child;
                systemManager.dispatchEvent(initializeErrorEvent);
            }
        }
    }

    mx_internal function removingChild(param1: DisplayObject): void {
    }

    mx_internal function childRemoved(param1: DisplayObject): void {
        if (param1 is IUIComponent) {
            if (IUIComponent(param1).document != param1) {
                IUIComponent(param1).document = null;
            }
            IUIComponent(param1).parentChanged(null);
        }
    }

    public function initialize(): void {
        if (this.initialized) {
            return;
        }
        this.dispatchEvent(new FlexEvent(FlexEvent.PREINITIALIZE));
        this.createChildren();
        this.childrenCreated();
        this.initializeAccessibility();
        this.initializationComplete();
    }

    protected function initializationComplete(): void {
        this.processedDescriptors = true;
    }

    protected function initializeAccessibility(): void {
        if (false) {
            UIComponent.mx_internal::createAccessibilityImplementation(this);
        }
    }

    public function initializeRepeaterArrays(param1: IRepeaterClient): void {
        if (param1 && param1.instanceIndices && (!param1.isDocument || param1 != this.descriptor.document) && !this._instanceIndices) {
            this._instanceIndices = param1.instanceIndices;
            this._repeaters = param1.repeaters;
            this._repeaterIndices = param1.repeaterIndices;
        }
    }

    protected function createChildren(): void {
    }

    protected function childrenCreated(): void {
        this.invalidateProperties();
        this.invalidateSize();
        this.invalidateDisplayList();
    }

    public function invalidateProperties(): void {
        if (!this.mx_internal::invalidatePropertiesFlag) {
            this.mx_internal::invalidatePropertiesFlag = true;
            if (Boolean(this.nestLevel) && false) {
                UIComponentGlobals.mx_internal::layoutManager.invalidateProperties(this);
            }
        }
    }

    public function invalidateSize(): void {
        if (!this.mx_internal::invalidateSizeFlag) {
            this.mx_internal::invalidateSizeFlag = true;
            if (Boolean(this.nestLevel) && false) {
                UIComponentGlobals.mx_internal::layoutManager.invalidateSize(this);
            }
        }
    }

    protected function invalidateParentSizeAndDisplayList(): void {
        if (!this.includeInLayout) {
            return;
        }
        var _loc1_: IInvalidating = this.parent as IInvalidating;
        if (!_loc1_) {
            return;
        }
        _loc1_.invalidateSize();
        _loc1_.invalidateDisplayList();
    }

    public function invalidateDisplayList(): void {
        if (!this.mx_internal::invalidateDisplayListFlag) {
            this.mx_internal::invalidateDisplayListFlag = true;
            if (Boolean(this.nestLevel) && false) {
                UIComponentGlobals.mx_internal::layoutManager.invalidateDisplayList(this);
            }
        }
    }

    private function invalidateTransform(): void {
        if (Boolean(this.mx_internal::_layoutFeatures) && this.mx_internal::_layoutFeatures.updatePending == false) {
            this.mx_internal::_layoutFeatures.updatePending = true;
            if (this.nestLevel && false && this.mx_internal::invalidateDisplayListFlag == false) {
                UIComponentGlobals.mx_internal::layoutManager.invalidateDisplayList(this);
            }
        }
    }

    public function invalidateLayoutDirection(): void {
        var _loc1_: * = null;
        var _loc4_: int = 0;
        var _loc5_: * = null;
        var _loc6_: int = 0;
        var _loc7_: * = null;
        var _loc8_: int = 0;
        var _loc9_: * = null;
        _loc1_ = this.parent as ILayoutDirectionElement;
        var _loc2_: String = this.layoutDirection;
        var _loc3_: Boolean = !!_loc1_ ? _loc1_.layoutDirection != _loc2_ : LayoutDirection.LTR != _loc2_;
        if (!!this.mx_internal::_layoutFeatures ? _loc3_ != this.mx_internal::_layoutFeatures.mirror : _loc3_) {
            if (this.mx_internal::_layoutFeatures == null) {
                this.initAdvancedLayoutFeatures();
            }
            this.mx_internal::_layoutFeatures.mirror = _loc3_;
            this.mx_internal::_layoutFeatures.layoutWidth = this.mx_internal::_width;
            this.invalidateTransform();
        }
        if (this.mx_internal::oldLayoutDirection != this.layoutDirection) {
            if (this is IVisualElementContainer) {
                _loc6_ = (_loc5_ = IVisualElementContainer(this)).numElements;
                _loc4_ = 0;
                while (_loc4_ < _loc6_) {
                    if ((Boolean(_loc7_ = _loc5_.getElementAt(_loc4_))) && !(_loc7_ is IStyleClient)) {
                        _loc7_.invalidateLayoutDirection();
                    }
                    _loc4_++;
                }
            } else {
                _loc8_ = numChildren;
                _loc4_ = 0;
                while (_loc4_ < _loc8_) {
                    if (!((_loc9_ = getChildAt(_loc4_)) is IStyleClient) && _loc9_ is ILayoutDirectionElement) {
                        ILayoutDirectionElement(_loc9_).invalidateLayoutDirection();
                    }
                    _loc4_++;
                }
            }
        }
    }

    private function transformOffsetsChangedHandler(param1: Event): void {
        this.invalidateTransform();
    }

    public function stylesInitialized(): void {
    }

    public function styleChanged(param1: String): void {
        var _loc2_: Boolean = !param1 || param1 == "styleName";
        StyleProtoChain.styleChanged(this, param1);
        if (!_loc2_) {
            if (hasEventListener(param1 + "Changed")) {
                this.dispatchEvent(new Event(param1 + "Changed"));
            }
        } else if (hasEventListener("allStylesChanged")) {
            this.dispatchEvent(new Event("allStylesChanged"));
        }
        if (_loc2_ || param1 == "layoutDirection") {
            this.layoutDirectionCachedValue = LAYOUT_DIRECTION_CACHE_UNSET;
        }
    }

    public function validateNow(): void {
        UIComponentGlobals.mx_internal::layoutManager.validateClient(this);
    }

    mx_internal function validateBaselinePosition(): Boolean {
        var _loc1_: Number = NaN;
        var _loc2_: Number = NaN;
        if (!this.parent) {
            return false;
        }
        if (!this.mx_internal::setActualSizeCalled && (this.width == 0 || this.height == 0)) {
            this.validateNow();
            _loc1_ = this.getExplicitOrMeasuredWidth();
            _loc2_ = this.getExplicitOrMeasuredHeight();
            this.setActualSize(_loc1_, _loc2_);
        }
        this.validateNow();
        return true;
    }

    public function callLater(param1: Function, param2: Array = null): void {
        this.methodQueue.push(new MethodQueueElement(param1, param2));
        var _loc3_: ISystemManager = this.systemManager;
        if (Boolean(_loc3_) && (_loc3_.stage || this.usingBridge)) {
            if (!this.listeningForRender) {
                _loc3_.addEventListener(FlexEvent.RENDER, this.callLaterDispatcher);
                _loc3_.addEventListener(FlexEvent.ENTER_FRAME, this.callLaterDispatcher);
                this.listeningForRender = true;
            }
            if (_loc3_.stage) {
                _loc3_.stage.invalidate();
            }
        }
    }

    mx_internal function cancelAllCallLaters(): void {
        var _loc1_: ISystemManager = this.systemManager;
        if (Boolean(_loc1_) && (_loc1_.stage || this.usingBridge)) {
            if (this.listeningForRender) {
                _loc1_.removeEventListener(FlexEvent.RENDER, this.callLaterDispatcher);
                _loc1_.removeEventListener(FlexEvent.ENTER_FRAME, this.callLaterDispatcher);
                this.listeningForRender = false;
            }
        }
        this.methodQueue.splice(0);
    }

    public function validateProperties(): void {
        if (this.mx_internal::invalidatePropertiesFlag) {
            this.commitProperties();
            this.mx_internal::invalidatePropertiesFlag = false;
        }
    }

    protected function commitProperties(): void {
        var _loc1_: Number = NaN;
        var _loc2_: Number = NaN;
        var _loc3_: * = null;
        var _loc4_: * = null;
        if (false) {
            if (this._scaleX != this.oldScaleX) {
                _loc1_ = Math.abs(this._scaleX / this.oldScaleX);
                if (!isNaN(this.explicitMinWidth)) {
                    this.explicitMinWidth *= _loc1_;
                }
                if (!isNaN(this.explicitWidth)) {
                    this.explicitWidth *= _loc1_;
                }
                if (!isNaN(this.explicitMaxWidth)) {
                    this.explicitMaxWidth *= _loc1_;
                }
                this.mx_internal::_width *= _loc1_;
                super.scaleX = this.oldScaleX = this._scaleX;
            }
            if (this._scaleY != this.oldScaleY) {
                _loc2_ = Math.abs(this._scaleY / this.oldScaleY);
                if (!isNaN(this.explicitMinHeight)) {
                    this.explicitMinHeight *= _loc2_;
                }
                if (!isNaN(this.explicitHeight)) {
                    this.explicitHeight *= _loc2_;
                }
                if (!isNaN(this.explicitMaxHeight)) {
                    this.explicitMaxHeight *= _loc2_;
                }
                this.mx_internal::_height *= _loc2_;
                super.scaleY = this.oldScaleY = this._scaleY;
            }
        } else {
            if (this._currentStateDeferred != null) {
                _loc3_ = this._currentStateDeferred;
                this._currentStateDeferred = null;
                this.currentState = _loc3_;
            }
            this.oldScaleX = this.scaleX;
            this.oldScaleY = this.scaleY;
        }
        if (this._currentStateChanged && !this.initialized) {
            this._currentStateChanged = false;
            this.commitCurrentState();
        }
        if (true) {
            _loc4_ = this.parent as UIComponent;
            if (this.mx_internal::oldLayoutDirection != this.layoutDirection || this.parentChangedFlag || _loc4_ && _loc4_.layoutDirection != _loc4_.mx_internal::oldLayoutDirection) {
                this.invalidateLayoutDirection();
            }
        }
        if (this.x != this.oldX || this.y != this.oldY) {
            this.dispatchMoveEvent();
        }
        if (this.width != this.oldWidth || this.height != this.oldHeight) {
            this.dispatchResizeEvent();
        }
        if (this.errorStringChanged) {
            this.errorStringChanged = false;
            if (this.getStyle("showErrorTip")) {
                ToolTipManager.mx_internal::registerErrorString(this, this.oldErrorString, this.errorString);
            }
            this.setBorderColorForErrorString();
        }
        if (this.blendModeChanged) {
            this.blendModeChanged = false;
            if (!this.blendShaderChanged) {
                this.mx_internal::$blendMode = this._blendMode;
            } else {
                this.blendShaderChanged = false;
                this.mx_internal::$blendMode = BlendMode.NORMAL;
                switch (this._blendMode) {
                    case "color":
                        this.mx_internal::$blendShader = new ColorShader();
                        break;
                    case "colordodge":
                        this.mx_internal::$blendShader = new ColorDodgeShader();
                        break;
                    case "colorburn":
                        this.mx_internal::$blendShader = new ColorBurnShader();
                        break;
                    case "exclusion":
                        this.mx_internal::$blendShader = new ExclusionShader();
                        break;
                    case "hue":
                        this.mx_internal::$blendShader = new HueShader();
                        break;
                    case "luminosity":
                        this.mx_internal::$blendShader = new LuminosityShader();
                        break;
                    case "saturation":
                        this.mx_internal::$blendShader = new SaturationShader();
                        break;
                    case "softlight":
                        this.mx_internal::$blendShader = new SoftLightShader();
                }
            }
        }
        this.parentChangedFlag = false;
    }

    public function validateSize(param1: Boolean = false): void {
        var _loc2_: int = 0;
        var _loc3_: * = null;
        var _loc4_: Boolean = false;
        if (param1) {
            _loc2_ = 0;
            while (_loc2_ < numChildren) {
                _loc3_ = getChildAt(_loc2_);
                if (_loc3_ is ILayoutManagerClient) {
                    (_loc3_ as ILayoutManagerClient).validateSize(true);
                }
                _loc2_++;
            }
        }
        if (this.mx_internal::invalidateSizeFlag) {
            if ((_loc4_ = this.mx_internal::measureSizes()) && this.includeInLayout) {
                this.invalidateDisplayList();
                this.invalidateParentSizeAndDisplayList();
            }
        }
    }

    protected function canSkipMeasurement(): Boolean {
        return !isNaN(this.explicitWidth) && !isNaN(this.explicitHeight);
    }

    mx_internal function measureSizes(): Boolean {
        var _loc2_: Number = NaN;
        var _loc3_: Number = NaN;
        var _loc4_: Number = NaN;
        var _loc5_: Number = NaN;
        var _loc1_: Boolean = false;
        if (!this.mx_internal::invalidateSizeFlag) {
            return _loc1_;
        }
        if (this.canSkipMeasurement()) {
            this.mx_internal::invalidateSizeFlag = false;
            this._measuredMinWidth = 0;
            this._measuredMinHeight = 0;
        } else {
            _loc4_ = Math.abs(this.scaleX);
            _loc5_ = Math.abs(this.scaleY);
            if (false) {
                if (_loc4_ != 1) {
                    this._measuredMinWidth /= _loc4_;
                    this._measuredWidth /= _loc4_;
                }
                if (_loc5_ != 1) {
                    this._measuredMinHeight /= _loc5_;
                    this._measuredHeight /= _loc5_;
                }
            }
            this.measure();
            this.mx_internal::invalidateSizeFlag = false;
            if (!isNaN(this.explicitMinWidth) && this.measuredWidth < this.explicitMinWidth) {
                this.measuredWidth = this.explicitMinWidth;
            }
            if (!isNaN(this.explicitMaxWidth) && this.measuredWidth > this.explicitMaxWidth) {
                this.measuredWidth = this.explicitMaxWidth;
            }
            if (!isNaN(this.explicitMinHeight) && this.measuredHeight < this.explicitMinHeight) {
                this.measuredHeight = this.explicitMinHeight;
            }
            if (!isNaN(this.explicitMaxHeight) && this.measuredHeight > this.explicitMaxHeight) {
                this.measuredHeight = this.explicitMaxHeight;
            }
            if (false) {
                if (_loc4_ != 1) {
                    this._measuredMinWidth *= _loc4_;
                    this._measuredWidth *= _loc4_;
                }
                if (_loc5_ != 1) {
                    this._measuredMinHeight *= _loc5_;
                    this._measuredHeight *= _loc5_;
                }
            }
        }
        this.mx_internal::adjustSizesForScaleChanges();
        if (isNaN(this.oldMinWidth)) {
            this.oldMinWidth = !isNaN(this.explicitMinWidth) ? this.explicitMinWidth : this.measuredMinWidth;
            this.oldMinHeight = !isNaN(this.explicitMinHeight) ? this.explicitMinHeight : this.measuredMinHeight;
            this.oldExplicitWidth = !isNaN(this.explicitWidth) ? this.explicitWidth : this.measuredWidth;
            this.oldExplicitHeight = !isNaN(this.explicitHeight) ? this.explicitHeight : this.measuredHeight;
            _loc1_ = true;
        } else {
            _loc3_ = !isNaN(this.explicitMinWidth) ? this.explicitMinWidth : this.measuredMinWidth;
            if (_loc3_ != this.oldMinWidth) {
                this.oldMinWidth = _loc3_;
                _loc1_ = true;
            }
            _loc3_ = !isNaN(this.explicitMinHeight) ? this.explicitMinHeight : this.measuredMinHeight;
            if (_loc3_ != this.oldMinHeight) {
                this.oldMinHeight = _loc3_;
                _loc1_ = true;
            }
            _loc3_ = !isNaN(this.explicitWidth) ? this.explicitWidth : this.measuredWidth;
            if (_loc3_ != this.oldExplicitWidth) {
                this.oldExplicitWidth = _loc3_;
                _loc1_ = true;
            }
            _loc3_ = !isNaN(this.explicitHeight) ? this.explicitHeight : this.measuredHeight;
            if (_loc3_ != this.oldExplicitHeight) {
                this.oldExplicitHeight = _loc3_;
                _loc1_ = true;
            }
        }
        return _loc1_;
    }

    protected function measure(): void {
        this.measuredMinWidth = 0;
        this.measuredMinHeight = 0;
        this.measuredWidth = 0;
        this.measuredHeight = 0;
    }

    mx_internal function adjustSizesForScaleChanges(): void {
        var _loc3_: Number = NaN;
        var _loc1_: Number = this.scaleX;
        var _loc2_: Number = this.scaleY;
        if (_loc1_ != this.oldScaleX) {
            if (false) {
                _loc3_ = Math.abs(_loc1_ / this.oldScaleX);
                if (this.explicitMinWidth) {
                    this.explicitMinWidth *= _loc3_;
                }
                if (!isNaN(this.explicitWidth)) {
                    this.explicitWidth *= _loc3_;
                }
                if (this.explicitMaxWidth) {
                    this.explicitMaxWidth *= _loc3_;
                }
            }
            this.oldScaleX = _loc1_;
        }
        if (_loc2_ != this.oldScaleY) {
            if (false) {
                _loc3_ = Math.abs(_loc2_ / this.oldScaleY);
                if (this.explicitMinHeight) {
                    this.explicitMinHeight *= _loc3_;
                }
                if (this.explicitHeight) {
                    this.explicitHeight *= _loc3_;
                }
                if (this.explicitMaxHeight) {
                    this.explicitMaxHeight *= _loc3_;
                }
            }
            this.oldScaleY = _loc2_;
        }
    }

    public function getExplicitOrMeasuredWidth(): Number {
        return !isNaN(this.explicitWidth) ? this.explicitWidth : this.measuredWidth;
    }

    public function getExplicitOrMeasuredHeight(): Number {
        return !isNaN(this.explicitHeight) ? this.explicitHeight : this.measuredHeight;
    }

    protected function get unscaledWidth(): Number {
        if (false) {
            return this.width / Math.abs(this.scaleX);
        }
        return this.width;
    }

    mx_internal function getUnscaledWidth(): Number {
        return this.unscaledWidth;
    }

    mx_internal function setUnscaledWidth(param1: Number): void {
        var _loc2_: Number = param1;
        if (false) {
            _loc2_ *= Math.abs(this.oldScaleX);
        }
        if (this._explicitWidth == _loc2_) {
            return;
        }
        if (!isNaN(_loc2_)) {
            this._percentWidth = NaN;
        }
        this._explicitWidth = _loc2_;
        this.invalidateSize();
        this.invalidateParentSizeAndDisplayList();
    }

    protected function get unscaledHeight(): Number {
        if (false) {
            return this.height / Math.abs(this.scaleY);
        }
        return this.height;
    }

    mx_internal function getUnscaledHeight(): Number {
        return this.unscaledHeight;
    }

    mx_internal function setUnscaledHeight(param1: Number): void {
        var _loc2_: Number = param1;
        if (false) {
            _loc2_ *= Math.abs(this.oldScaleY);
        }
        if (this._explicitHeight == _loc2_) {
            return;
        }
        if (!isNaN(_loc2_)) {
            this._percentHeight = NaN;
        }
        this._explicitHeight = _loc2_;
        this.invalidateSize();
        this.invalidateParentSizeAndDisplayList();
    }

    public function measureText(param1: String): TextLineMetrics {
        return this.determineTextFormatFromStyles().measureText(param1);
    }

    public function measureHTMLText(param1: String): TextLineMetrics {
        return this.determineTextFormatFromStyles().measureHTMLText(param1);
    }

    protected function validateMatrix(): void {
        var _loc1_: * = null;
        if (this.mx_internal::_layoutFeatures != null && this.mx_internal::_layoutFeatures.updatePending == true) {
            this.applyComputedMatrix();
        }
        if (this._maintainProjectionCenter) {
            _loc1_ = super.transform.perspectiveProjection;
            if (_loc1_ != null) {
                _loc1_.projectionCenter = new Point(this.unscaledWidth / 2, this.unscaledHeight / 2);
            }
        }
    }

    public function validateDisplayList(): void {
        var _loc1_: * = null;
        var _loc2_: Number = NaN;
        var _loc3_: Number = NaN;
        this.mx_internal::oldLayoutDirection = this.layoutDirection;
        if (this.mx_internal::invalidateDisplayListFlag) {
            _loc1_ = this.parent as ISystemManager;
            if (_loc1_) {
                if (Boolean(_loc1_.isProxy) || _loc1_ == this.systemManager.topLevelSystemManager && _loc1_.document != this) {
                    this.setActualSize(this.getExplicitOrMeasuredWidth(), this.getExplicitOrMeasuredHeight());
                }
            }
            this.validateMatrix();
            _loc2_ = this.width;
            _loc3_ = this.height;
            if (false) {
                _loc2_ = this.scaleX == 0 ? 0 : this.width / this.scaleX;
                _loc3_ = this.scaleY == 0 ? 0 : this.height / this.scaleY;
                if (Math.abs(_loc2_ - this.lastUnscaledWidth) < 0.00001) {
                    _loc2_ = this.lastUnscaledWidth;
                }
                if (Math.abs(_loc3_ - this.lastUnscaledHeight) < 0.00001) {
                    _loc3_ = this.lastUnscaledHeight;
                }
            }
            this.updateDisplayList(_loc2_, _loc3_);
            this.lastUnscaledWidth = _loc2_;
            this.lastUnscaledHeight = _loc3_;
            this.mx_internal::invalidateDisplayListFlag = false;
        } else {
            this.validateMatrix();
        }
    }

    protected function updateDisplayList(param1: Number, param2: Number): void {
    }

    public function getConstraintValue(param1: String): * {
        return this.getStyle(param1);
    }

    public function setConstraintValue(param1: String, param2: *): void {
        this.setStyle(param1, param2);
    }

    public function get left(): Object {
        return this.getConstraintValue("left");
    }

    public function set left(param1: Object): void {
        this.setConstraintValue("left", param1 != null ? param1 : undefined);
    }

    public function get right(): Object {
        return this.getConstraintValue("right");
    }

    public function set right(param1: Object): void {
        this.setConstraintValue("right", param1 != null ? param1 : undefined);
    }

    public function get top(): Object {
        return this.getConstraintValue("top");
    }

    public function set top(param1: Object): void {
        this.setConstraintValue("top", param1 != null ? param1 : undefined);
    }

    public function get bottom(): Object {
        return this.getConstraintValue("bottom");
    }

    public function set bottom(param1: Object): void {
        this.setConstraintValue("bottom", param1 != null ? param1 : undefined);
    }

    public function get horizontalCenter(): Object {
        return this.getConstraintValue("horizontalCenter");
    }

    public function set horizontalCenter(param1: Object): void {
        this.setConstraintValue("horizontalCenter", param1 != null ? param1 : undefined);
    }

    public function get verticalCenter(): Object {
        return this.getConstraintValue("verticalCenter");
    }

    public function set verticalCenter(param1: Object): void {
        this.setConstraintValue("verticalCenter", param1 != null ? param1 : undefined);
    }

    public function get baseline(): Object {
        return this.getConstraintValue("baseline");
    }

    public function set baseline(param1: Object): void {
        this.setConstraintValue("baseline", param1 != null ? param1 : undefined);
    }

    public function horizontalGradientMatrix(param1: Number, param2: Number, param3: Number, param4: Number): Matrix {
        UIComponentGlobals.mx_internal::tempMatrix.createGradientBox(param3, param4, 0, param1, param2);
        return UIComponentGlobals.mx_internal::tempMatrix;
    }

    public function verticalGradientMatrix(param1: Number, param2: Number, param3: Number, param4: Number): Matrix {
        UIComponentGlobals.mx_internal::tempMatrix.createGradientBox(param3, param4, 0, param1, param2);
        return UIComponentGlobals.mx_internal::tempMatrix;
    }

    public function drawRoundRect(param1: Number, param2: Number, param3: Number, param4: Number, param5: Object = null, param6: Object = null, param7: Object = null, param8: Object = null, param9: String = null, param10: Array = null, param11: Object = null): void {
        var _loc13_: Number = NaN;
        var _loc14_: * = null;
        var _loc15_: * = null;
        var _loc16_: * = null;
        var _loc12_: Graphics = graphics;
        if (!param3 || !param4) {
            return;
        }
        if (param6 !== null) {
            if (param6 is Array) {
                if (param7 is Array) {
                    _loc14_ = param7 as Array;
                } else {
                    _loc14_ = [param7, param7];
                }
                if (!param10) {
                    param10 = [0, 255];
                }
                _loc15_ = null;
                if (param8) {
                    if (param8 is Matrix) {
                        _loc15_ = Matrix(param8);
                    } else {
                        _loc15_ = new Matrix();
                        if (param8 is Number) {
                            _loc15_.createGradientBox(param3, param4, Number(param8) * 0 / 180, param1, param2);
                        } else {
                            _loc15_.createGradientBox(param8.w, param8.h, param8.r, param8.x, param8.y);
                        }
                    }
                }
                if (param9 == GradientType.RADIAL) {
                    _loc12_.beginGradientFill(GradientType.RADIAL, param6 as Array, _loc14_, param10, _loc15_);
                } else {
                    _loc12_.beginGradientFill(GradientType.LINEAR, param6 as Array, _loc14_, param10, _loc15_);
                }
            } else {
                _loc12_.beginFill(Number(param6), Number(param7));
            }
        }
        if (!param5) {
            _loc12_.drawRect(param1, param2, param3, param4);
        } else if (param5 is Number) {
            _loc13_ = Number(param5) * 2;
            _loc12_.drawRoundRect(param1, param2, param3, param4, _loc13_, _loc13_);
        } else {
            GraphicsUtil.drawRoundRectComplex(_loc12_, param1, param2, param3, param4, param5.tl, param5.tr, param5.bl, param5.br);
        }
        if (param11) {
            if ((_loc16_ = param11.r) is Number) {
                _loc13_ = Number(_loc16_) * 2;
                _loc12_.drawRoundRect(param11.x, param11.y, param11.w, param11.h, _loc13_, _loc13_);
            } else {
                GraphicsUtil.drawRoundRectComplex(_loc12_, param11.x, param11.y, param11.w, param11.h, _loc16_.tl, _loc16_.tr, _loc16_.bl, _loc16_.br);
            }
        }
        if (param6 !== null) {
            _loc12_.endFill();
        }
    }

    public function move(param1: Number, param2: Number): void {
        var _loc3_: Boolean = false;
        if (param1 != this.x) {
            if (this.mx_internal::_layoutFeatures == null) {
                super.x = param1;
            } else {
                this.mx_internal::_layoutFeatures.layoutX = param1;
            }
            if (hasEventListener("xChanged")) {
                this.dispatchEvent(new Event("xChanged"));
            }
            _loc3_ = true;
        }
        if (param2 != this.y) {
            if (this.mx_internal::_layoutFeatures == null) {
                super.y = param2;
            } else {
                this.mx_internal::_layoutFeatures.layoutY = param2;
            }
            if (hasEventListener("yChanged")) {
                this.dispatchEvent(new Event("yChanged"));
            }
            _loc3_ = true;
        }
        if (_loc3_) {
            this.invalidateTransform();
            this.dispatchMoveEvent();
        }
    }

    public function setActualSize(param1: Number, param2: Number): void {
        var _loc3_: Boolean = false;
        if (this.mx_internal::_width != param1) {
            this.mx_internal::_width = param1;
            if (this.mx_internal::_layoutFeatures) {
                this.mx_internal::_layoutFeatures.layoutWidth = param1;
                this.invalidateTransform();
            }
            if (hasEventListener("widthChanged")) {
                this.dispatchEvent(new Event("widthChanged"));
            }
            _loc3_ = true;
        }
        if (this.mx_internal::_height != param2) {
            this.mx_internal::_height = param2;
            if (hasEventListener("heightChanged")) {
                this.dispatchEvent(new Event("heightChanged"));
            }
            _loc3_ = true;
        }
        if (_loc3_) {
            this.invalidateDisplayList();
            this.dispatchResizeEvent();
        }
        this.mx_internal::setActualSizeCalled = true;
    }

    public function contentToGlobal(param1: Point): Point {
        return localToGlobal(param1);
    }

    public function globalToContent(param1: Point): Point {
        return globalToLocal(param1);
    }

    public function contentToLocal(param1: Point): Point {
        return param1;
    }

    public function localToContent(param1: Point): Point {
        return param1;
    }

    public function getFocus(): InteractiveObject {
        var _loc1_: ISystemManager = this.systemManager;
        if (!_loc1_) {
            return null;
        }
        if (false) {
            return UIComponentGlobals.mx_internal::nextFocusObject;
        }
        if (_loc1_.stage) {
            return _loc1_.stage.focus;
        }
        return null;
    }

    public function setFocus(): void {
        var _loc1_: ISystemManager = this.systemManager;
        if (Boolean(_loc1_) && (_loc1_.stage || this.usingBridge)) {
            if (false) {
                _loc1_.stage.focus = this;
                UIComponentGlobals.mx_internal::nextFocusObject = null;
            } else {
                UIComponentGlobals.mx_internal::nextFocusObject = this;
                _loc1_.addEventListener(FlexEvent.ENTER_FRAME, this.setFocusLater);
            }
        } else {
            UIComponentGlobals.mx_internal::nextFocusObject = this;
            this.callLater(this.setFocusLater);
        }
    }

    mx_internal function getFocusObject(): DisplayObject {
        var _loc1_: IFocusManager = this.focusManager;
        if (!_loc1_ || !_loc1_.focusPane) {
            return null;
        }
        return _loc1_.focusPane.numChildren == 0 ? null : _loc1_.focusPane.getChildAt(0);
    }

    public function drawFocus(param1: Boolean): void {
        var _loc4_: * = null;
        var _loc5_: * = null;
        if (!this.parent) {
            return;
        }
        var _loc2_: * = this.mx_internal::getFocusObject();
        var _loc3_: Sprite = !!this.focusManager ? this.focusManager.focusPane : null;
        if (param1 && !this.preventDrawFocus) {
            if ((_loc4_ = _loc3_.parent) != this.parent) {
                if (_loc4_) {
                    if (_loc4_ is ISystemManager) {
                        ISystemManager(_loc4_).focusPane = null;
                    } else {
                        IUIComponent(_loc4_).focusPane = null;
                    }
                }
                if (this.parent is ISystemManager) {
                    ISystemManager(this.parent).focusPane = _loc3_;
                } else {
                    IUIComponent(this.parent).focusPane = _loc3_;
                }
            }
            if (!(_loc5_ = this.getStyle("focusSkin"))) {
                return;
            }
            if (Boolean(_loc2_) && !(_loc2_ is _loc5_)) {
                _loc3_.removeChild(_loc2_);
                _loc2_ = null;
            }
            if (!_loc2_) {
                _loc2_ = new _loc5_();
                _loc2_.name = "focus";
                _loc3_.addChild(_loc2_);
            }
            if (_loc2_ is ILayoutManagerClient) {
                ILayoutManagerClient(_loc2_).nestLevel = this.nestLevel;
            }
            if (_loc2_ is ISimpleStyleClient) {
                ISimpleStyleClient(_loc2_).styleName = this;
            }
            addEventListener(MoveEvent.MOVE, this.focusObj_moveHandler, true);
            addEventListener(MoveEvent.MOVE, this.focusObj_moveHandler);
            addEventListener(ResizeEvent.RESIZE, this.focusObj_resizeHandler, true);
            addEventListener(ResizeEvent.RESIZE, this.focusObj_resizeHandler);
            addEventListener(Event.REMOVED, this.focusObj_removedHandler, true);
            _loc2_.visible = true;
            this.hasFocusRect = true;
            this.adjustFocusRect();
        } else if (this.hasFocusRect) {
            this.hasFocusRect = false;
            if (_loc2_) {
                _loc2_.visible = false;
                if (_loc2_ is ISimpleStyleClient) {
                    ISimpleStyleClient(_loc2_).styleName = null;
                }
            }
            removeEventListener(MoveEvent.MOVE, this.focusObj_moveHandler);
            removeEventListener(MoveEvent.MOVE, this.focusObj_moveHandler, true);
            removeEventListener(ResizeEvent.RESIZE, this.focusObj_resizeHandler, true);
            removeEventListener(ResizeEvent.RESIZE, this.focusObj_resizeHandler);
            removeEventListener(Event.REMOVED, this.focusObj_removedHandler, true);
        }
    }

    protected function adjustFocusRect(param1: DisplayObject = null): void {
        var _loc2_: Number = NaN;
        var _loc3_: Number = NaN;
        var _loc6_: Number = NaN;
        var _loc7_: Boolean = false;
        var _loc8_: Number = NaN;
        var _loc9_: * = null;
        var _loc10_: Number = NaN;
        if (!param1) {
            param1 = this;
        }
        if (param1 is UIComponent) {
            _loc2_ = Number(UIComponent(param1).unscaledWidth) * Math.abs(param1.scaleX);
            _loc3_ = Number(UIComponent(param1).unscaledHeight) * Math.abs(param1.scaleY);
        } else {
            _loc2_ = param1.width;
            _loc3_ = param1.height;
        }
        if (isNaN(_loc2_) || isNaN(_loc3_)) {
            return;
        }
        var _loc4_: IFocusManager;
        if (!(_loc4_ = this.focusManager)) {
            return;
        }
        var _loc5_: IFlexDisplayObject;
        if (_loc5_ = IFlexDisplayObject(this.mx_internal::getFocusObject())) {
            _loc7_ = this.getStyle("showErrorSkin");
            if (this.errorString && this.errorString != "" && _loc7_) {
                _loc6_ = this.getStyle("errorColor");
            } else if (false) {
                _loc6_ = this.getStyle("themeColor");
            } else {
                _loc6_ = this.getStyle("focusColor");
            }
            _loc8_ = this.getStyle("focusThickness");
            if (_loc5_ is IStyleClient) {
                IStyleClient(_loc5_).setStyle("focusColor", _loc6_);
            }
            _loc5_.setActualSize(_loc2_ + 2 * _loc8_, _loc3_ + 2 * _loc8_);
            if (this.rotation) {
                _loc10_ = this.rotation * 0 / 180;
                _loc9_ = new Point(param1.x - _loc8_ * (Math.cos(_loc10_) - Math.sin(_loc10_)), param1.y - _loc8_ * (Math.cos(_loc10_) + Math.sin(_loc10_)));
                DisplayObject(_loc5_).rotation = this.rotation;
            } else {
                _loc9_ = new Point(param1.x - _loc8_, param1.y - _loc8_);
                DisplayObject(_loc5_).rotation = 0;
            }
            if (param1.parent == this) {
                _loc9_.x += this.x;
                _loc9_.y += this.y;
            }
            if (param1 != this) {
                if (Boolean(this.mx_internal::_layoutFeatures) && this.mx_internal::_layoutFeatures.mirror) {
                    _loc9_.x += this.width - param1.width;
                }
            }
            _loc9_ = this.parent.localToGlobal(_loc9_);
            _loc9_ = this.parent.globalToLocal(_loc9_);
            _loc5_.move(_loc9_.x, _loc9_.y);
            if (_loc5_ is IInvalidating) {
                IInvalidating(_loc5_).validateNow();
            } else if (_loc5_ is IProgrammaticSkin) {
                IProgrammaticSkin(_loc5_).validateNow();
            }
        }
    }

    protected function dispatchPropertyChangeEvent(param1: String, param2: *, param3: *): void {
        if (hasEventListener("propertyChange")) {
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, param1, param2, param3));
        }
    }

    private function dispatchMoveEvent(): void {
        var _loc1_: * = null;
        if (hasEventListener(MoveEvent.MOVE)) {
            _loc1_ = new MoveEvent(MoveEvent.MOVE);
            _loc1_.oldX = this.oldX;
            _loc1_.oldY = this.oldY;
            this.dispatchEvent(_loc1_);
        }
        this.oldX = this.x;
        this.oldY = this.y;
    }

    private function dispatchResizeEvent(): void {
        var _loc1_: * = null;
        if (hasEventListener(ResizeEvent.RESIZE)) {
            _loc1_ = new ResizeEvent(ResizeEvent.RESIZE);
            _loc1_.oldWidth = this.oldWidth;
            _loc1_.oldHeight = this.oldHeight;
            this.dispatchEvent(_loc1_);
        }
        this.oldWidth = this.width;
        this.oldHeight = this.height;
    }

    mx_internal function childXYChanged(): void {
    }

    mx_internal function mapKeycodeForLayoutDirection(param1: KeyboardEvent, param2: Boolean = false): uint {
        var _loc3_: * = param1.keyCode;
        switch (_loc3_) {
            case Keyboard.DOWN:
                if (param2 && this.layoutDirection == LayoutDirection.RTL) {
                    _loc3_ = 0;
                    break;
                }
                break;
            case Keyboard.RIGHT:
                if (this.layoutDirection == LayoutDirection.RTL) {
                    _loc3_ = 0;
                    break;
                }
                break;
            case Keyboard.UP:
                if (param2 && this.layoutDirection == LayoutDirection.RTL) {
                    _loc3_ = 0;
                    break;
                }
                break;
            case Keyboard.LEFT:
                if (this.layoutDirection == LayoutDirection.RTL) {
                    _loc3_ = 0;
                    break;
                }
        }
        return _loc3_;
    }

    public function setCurrentState(param1: String, param2: Boolean = true): void {
        param1 = this.isBaseState(param1) ? this.getDefaultState() : param1;
        if (param1 != this.currentState && !(this.isBaseState(param1) && this.isBaseState(this.currentState))) {
            this.requestedCurrentState = param1;
            this.playStateTransition = this is IStateClient2 && this.isBaseState(this.currentState) ? false : param2;
            if (this.initialized) {
                this.commitCurrentState();
            } else {
                this._currentStateChanged = true;
                this.invalidateProperties();
            }
        }
    }

    public function hasState(param1: String): Boolean {
        return this.getState(param1, false) != null;
    }

    private function isBaseState(param1: String): Boolean {
        return !param1 || param1 == "";
    }

    private function getDefaultState(): String {
        return this is IStateClient2 && this.states.length > 0 ? this.states[0].name : null;
    }

    private function commitCurrentState(): void {
        var _loc3_: * = null;
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc8_: Number = NaN;
        var _loc9_: Boolean = false;
        var _loc1_: Transition = this.playStateTransition ? this.getTransition(this._currentState, this.requestedCurrentState) : null;
        var _loc2_: String = this.findCommonBaseState(this._currentState, this.requestedCurrentState);
        var _loc4_: String = !!this._currentState ? this._currentState : "";
        var _loc5_: State = this.getState(this.requestedCurrentState);
        if (Boolean(_loc1_) && !effectLoaded) {
            effectLoaded = true;
            if (ApplicationDomain.currentDomain.hasDefinition("mx.effects.Effect")) {
                effectType = Class(ApplicationDomain.currentDomain.getDefinition("mx.effects.Effect"));
            }
        }
        if (this._currentTransition) {
            this._currentTransition.effect.removeEventListener(EffectEvent.EFFECT_END, this.transition_effectEndHandler);
            if (Boolean(_loc1_) && this._currentTransition.interruptionBehavior == "stop") {
                (_loc6_ = this._currentTransition.effect).transitionInterruption = true;
                _loc7_ = _loc6_.propertyChangesArray;
                _loc6_.applyEndValuesWhenDone = false;
                _loc6_.stop();
                _loc6_.applyEndValuesWhenDone = true;
            } else {
                if (this._currentTransition.autoReverse && this.transitionFromState == this.requestedCurrentState && this.transitionToState == this._currentState) {
                    if (this._currentTransition.effect.duration == 0) {
                        _loc8_ = 0;
                    } else {
                        _loc8_ = this._currentTransition.effect.playheadTime / this.getTotalDuration(this._currentTransition.effect);
                    }
                }
                this._currentTransition.effect.end();
            }
            if (hasEventListener(FlexEvent.STATE_CHANGE_INTERRUPTED)) {
                this.dispatchEvent(new FlexEvent(FlexEvent.STATE_CHANGE_INTERRUPTED));
            }
            this._currentTransition = null;
        }
        this.initializeState(this.requestedCurrentState);
        if (_loc1_) {
            _loc1_.effect.captureStartValues();
        }
        if (_loc7_) {
            _loc6_.applyEndValues(_loc7_, _loc6_.targets);
        }
        if (hasEventListener(StateChangeEvent.CURRENT_STATE_CHANGING)) {
            _loc3_ = new StateChangeEvent(StateChangeEvent.CURRENT_STATE_CHANGING);
            _loc3_.oldState = _loc4_;
            _loc3_.newState = !!this.requestedCurrentState ? this.requestedCurrentState : "";
            this.dispatchEvent(_loc3_);
        }
        if (this.isBaseState(this._currentState) && hasEventListener(FlexEvent.EXIT_STATE)) {
            this.dispatchEvent(new FlexEvent(FlexEvent.EXIT_STATE));
        }
        this.removeState(this._currentState, _loc2_);
        this._currentState = this.requestedCurrentState;
        this.stateChanged(_loc4_, this._currentState, true);
        if (this.isBaseState(this.currentState)) {
            if (hasEventListener(FlexEvent.ENTER_STATE)) {
                this.dispatchEvent(new FlexEvent(FlexEvent.ENTER_STATE));
            }
        } else {
            this.applyState(this._currentState, _loc2_);
        }
        if (hasEventListener(StateChangeEvent.CURRENT_STATE_CHANGE)) {
            _loc3_ = new StateChangeEvent(StateChangeEvent.CURRENT_STATE_CHANGE);
            _loc3_.oldState = _loc4_;
            _loc3_.newState = !!this._currentState ? this._currentState : "";
            this.dispatchEvent(_loc3_);
        }
        if (_loc1_) {
            _loc9_ = Boolean(_loc1_) && _loc1_.autoReverse && (_loc1_.toState == _loc4_ || _loc1_.fromState == this._currentState);
            UIComponentGlobals.mx_internal::layoutManager.validateNow();
            this._currentTransition = _loc1_;
            this.transitionFromState = _loc4_;
            this.transitionToState = this._currentState;
            Object(_loc1_.effect).transitionInterruption = _loc6_ != null;
            _loc1_.effect.addEventListener(EffectEvent.EFFECT_END, this.transition_effectEndHandler);
            _loc1_.effect.play(null, _loc9_);
            if (!isNaN(_loc8_) && _loc1_.effect.duration != 0) {
                _loc1_.effect.playheadTime = (1 - _loc8_) * this.getTotalDuration(_loc1_.effect);
            }
        } else if (hasEventListener(FlexEvent.STATE_CHANGE_COMPLETE)) {
            this.dispatchEvent(new FlexEvent(FlexEvent.STATE_CHANGE_COMPLETE));
        }
    }

    private function getTotalDuration(param1: IEffect): Number {
        var _loc2_: Number = 0;
        var _loc3_: Object = Object(param1);
        if (!compositeEffectLoaded) {
            compositeEffectLoaded = true;
            if (ApplicationDomain.currentDomain.hasDefinition("mx.effects.CompositeEffect")) {
                compositeEffectType = Class(ApplicationDomain.currentDomain.getDefinition("mx.effects.CompositeEffect"));
            }
        }
        if (Boolean(compositeEffectType) && param1 is compositeEffectType) {
            _loc2_ = Number(_loc3_.compositeDuration);
        } else {
            _loc2_ = param1.duration;
        }
        var _loc4_: int = "repeatDelay" in param1 ? int(_loc3_.repeatDelay) : 0;
        var _loc5_: int = "repeatCount" in param1 ? int(_loc3_.repeatCount) : 0;
        var _loc6_: int = "startDelay" in param1 ? int(_loc3_.startDelay) : 0;
        return _loc2_ * _loc5_ + _loc4_ * (_loc5_ - 1) + _loc6_;
    }

    private function transition_effectEndHandler(param1: EffectEvent): void {
        this._currentTransition = null;
        if (hasEventListener(FlexEvent.STATE_CHANGE_COMPLETE)) {
            this.dispatchEvent(new FlexEvent(FlexEvent.STATE_CHANGE_COMPLETE));
        }
    }

    private function getState(param1: String, param2: Boolean = true): State {
        var _loc4_: * = null;
        if (!this.states || this.isBaseState(param1)) {
            return null;
        }
        var _loc3_: int = 0;
        while (_loc3_ < this.states.length) {
            if (this.states[_loc3_].name == param1) {
                return this.states[_loc3_];
            }
            _loc3_++;
        }
        if (param2) {
            _loc4_ = this.resourceManager.getString("core", "stateUndefined", [param1]);
            throw new ArgumentError(_loc4_);
        }
        return null;
    }

    private function findCommonBaseState(param1: String, param2: String): String {
        var _loc3_: State = this.getState(param1);
        var _loc4_: State = this.getState(param2);
        if (!_loc3_ || !_loc4_) {
            return "";
        }
        if (this.isBaseState(_loc3_.basedOn) && this.isBaseState(_loc4_.basedOn)) {
            return "";
        }
        var _loc5_: Array = this.getBaseStates(_loc3_);
        var _loc6_: Array = this.getBaseStates(_loc4_);
        var _loc7_: String = "";
        while (_loc5_[_loc5_.length - 1] == _loc6_[_loc6_.length - 1]) {
            _loc7_ = _loc5_.pop();
            _loc6_.pop();
            if (!_loc5_.length || !_loc6_.length) {
                break;
            }
        }
        if (Boolean(_loc5_.length) && _loc5_[_loc5_.length - 1] == _loc4_.name) {
            _loc7_ = _loc4_.name;
        } else if (Boolean(_loc6_.length) && _loc6_[_loc6_.length - 1] == _loc3_.name) {
            _loc7_ = _loc3_.name;
        }
        return _loc7_;
    }

    private function getBaseStates(param1: State): Array {
        var _loc2_: * = [];
        while (Boolean(param1) && Boolean(param1.basedOn)) {
            _loc2_.push(param1.basedOn);
            param1 = this.getState(param1.basedOn);
        }
        return _loc2_;
    }

    private function removeState(param1: String, param2: String): void {
        var _loc4_: * = null;
        var _loc5_: int = 0;
        var _loc3_: State = this.getState(param1);
        if (param1 == param2) {
            return;
        }
        if (_loc3_) {
            _loc3_.mx_internal::dispatchExitState();
            _loc5_ = (_loc4_ = _loc3_.overrides).length;
            while (_loc5_) {
                _loc4_[_loc5_ - 1].remove(this);
                _loc5_--;
            }
            if (_loc3_.basedOn != param2) {
                this.removeState(_loc3_.basedOn, param2);
            }
        }
    }

    private function applyState(param1: String, param2: String): void {
        var _loc4_: * = null;
        var _loc5_: int = 0;
        var _loc3_: State = this.getState(param1);
        if (param1 == param2) {
            return;
        }
        if (_loc3_) {
            if (_loc3_.basedOn != param2) {
                this.applyState(_loc3_.basedOn, param2);
            }
            _loc4_ = _loc3_.overrides;
            _loc5_ = 0;
            while (_loc5_ < _loc4_.length) {
                _loc4_[_loc5_].apply(this);
                _loc5_++;
            }
            _loc3_.mx_internal::dispatchEnterState();
        }
    }

    private function initializeState(param1: String): void {
        var _loc2_: State = this.getState(param1);
        while (_loc2_) {
            _loc2_.mx_internal::initialize();
            _loc2_ = this.getState(_loc2_.basedOn);
        }
    }

    private function getTransition(param1: String, param2: String): Transition {
        var _loc6_: * = null;
        var _loc3_: * = null;
        var _loc4_: int = 0;
        if (!this.transitions) {
            return null;
        }
        if (!param1) {
            param1 = "";
        }
        if (!param2) {
            param2 = "";
        }
        var _loc5_: int = 0;
        while (_loc5_ < this.transitions.length) {
            if ((_loc6_ = this.transitions[_loc5_]).fromState == "package_1" && _loc6_.toState == "package_1" && _loc4_ < 1) {
                _loc3_ = _loc6_;
                _loc4_ = 1;
            } else if (_loc6_.toState == param1 && _loc6_.fromState == "package_1" && _loc6_.autoReverse && _loc4_ < 2) {
                _loc3_ = _loc6_;
                _loc4_ = 2;
            } else if (_loc6_.toState == "package_1" && _loc6_.fromState == param2 && _loc6_.autoReverse && _loc4_ < 3) {
                _loc3_ = _loc6_;
                _loc4_ = 3;
            } else if (_loc6_.toState == param1 && _loc6_.fromState == param2 && _loc6_.autoReverse && _loc4_ < 4) {
                _loc3_ = _loc6_;
                _loc4_ = 4;
            } else if (_loc6_.fromState == param1 && _loc6_.toState == "package_1" && _loc4_ < 5) {
                _loc3_ = _loc6_;
                _loc4_ = 5;
            } else if (_loc6_.fromState == "package_1" && _loc6_.toState == param2 && _loc4_ < 6) {
                _loc3_ = _loc6_;
                _loc4_ = 6;
            } else if (_loc6_.fromState == param1 && _loc6_.toState == param2 && _loc4_ < 7) {
                _loc3_ = _loc6_;
                _loc4_ = 7;
                break;
            }
            _loc5_++;
        }
        if (Boolean(_loc3_) && !_loc3_.effect) {
            _loc3_ = null;
        }
        return _loc3_;
    }

    protected function get currentCSSState(): String {
        return this.currentState;
    }

    public function get styleParent(): IAdvancedStyleClient {
        return this.parent as IAdvancedStyleClient;
    }

    public function set styleParent(param1: IAdvancedStyleClient): void {
    }

    public function matchesCSSState(param1: String): Boolean {
        return this.currentCSSState == param1;
    }

    public function matchesCSSType(param1: String): Boolean {
        return StyleProtoChain.matchesCSSType(this, param1);
    }

    public function hasCSSState(): Boolean {
        return this.currentCSSState != null;
    }

    mx_internal function initProtoChain(): void {
        StyleProtoChain.initProtoChain(this);
    }

    public function getClassStyleDeclarations(): Array {
        return StyleProtoChain.getClassStyleDeclarations(this);
    }

    public function regenerateStyleCache(param1: Boolean): void {
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc7_: * = null;
        this.mx_internal::initProtoChain();
        var _loc2_: IChildList = this is IRawChildrenContainer ? IRawChildrenContainer(this).rawChildren : IChildList(this);
        var _loc3_: int = int(_loc2_.numChildren);
        var _loc4_: int = 0;
        while (_loc4_ < _loc3_) {
            if ((_loc5_ = _loc2_.getChildAt(_loc4_)) is IStyleClient) {
                if (IStyleClient(_loc5_).inheritingStyles != StyleProtoChain.STYLE_UNINITIALIZED) {
                    IStyleClient(_loc5_).regenerateStyleCache(param1);
                }
            } else if (_loc5_ is IUITextField) {
                if (IUITextField(_loc5_).inheritingStyles) {
                    StyleProtoChain.initTextField(IUITextField(_loc5_));
                }
            }
            _loc4_++;
        }
        if (this.mx_internal::advanceStyleClientChildren != null) {
            for (_loc6_ in this.mx_internal::advanceStyleClientChildren) {
                if ((Boolean(_loc7_ = _loc6_ as IAdvancedStyleClient)) && _loc7_.inheritingStyles != StyleProtoChain.STYLE_UNINITIALIZED) {
                    _loc7_.regenerateStyleCache(param1);
                }
            }
        }
    }

    protected function stateChanged(param1: String, param2: String, param3: Boolean): void {
        if (this.currentCSSState && param1 != param2 && (this.styleManager.hasPseudoCondition(param1) || this.styleManager.hasPseudoCondition(param2))) {
            this.regenerateStyleCache(param3);
            this.mx_internal::initThemeColor();
            this.styleChanged(null);
            this.notifyStyleChangeInChildren(null, param3);
        }
    }

    [Bindable(style="true")]
    public function getStyle(param1: String): * {
        if (!this.moduleFactory) {
            if (Boolean(this.deferredSetStyles) && this.deferredSetStyles[param1] !== undefined) {
                return this.deferredSetStyles[param1];
            }
        }
        return !!this.styleManager.inheritingStyles[param1] ? this._inheritingStyles[param1] : this._nonInheritingStyles[param1];
    }

    public function setStyle(param1: String, param2: *): void {
        if (this.moduleFactory) {
            StyleProtoChain.setStyle(this, param1, param2);
        } else {
            if (!this.deferredSetStyles) {
                this.deferredSetStyles = new Object();
            }
            this.deferredSetStyles[param1] = param2;
        }
    }

    private function setDeferredStyles(): void {
        var _loc1_: * = null;
        if (!this.deferredSetStyles) {
            return;
        }
        for (_loc1_ in this.deferredSetStyles) {
            StyleProtoChain.setStyle(this, _loc1_, this.deferredSetStyles[_loc1_]);
        }
        this.deferredSetStyles = null;
    }

    public function clearStyle(param1: String): void {
        this.setStyle(param1, undefined);
    }

    public function addStyleClient(param1: IAdvancedStyleClient): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        if (!(param1 is DisplayObject)) {
            if (param1.styleParent != null) {
                _loc2_ = param1.styleParent as UIComponent;
                if (_loc2_) {
                    _loc2_.removeStyleClient(param1);
                }
            }
            if (this.mx_internal::advanceStyleClientChildren == null) {
                this.mx_internal::advanceStyleClientChildren = new Dictionary(true);
            }
            this.mx_internal::advanceStyleClientChildren[param1] = true;
            param1.styleParent = this;
            param1.regenerateStyleCache(true);
            param1.styleChanged(null);
            return;
        }
        _loc3_ = this.resourceManager.getString("core", "badParameter", [param1]);
        throw new ArgumentError(_loc3_);
    }

    public function removeStyleClient(param1: IAdvancedStyleClient): void {
        if (Boolean(this.mx_internal::advanceStyleClientChildren) && Boolean(this.mx_internal::advanceStyleClientChildren[param1])) {
            delete this.mx_internal::advanceStyleClientChildren[param1];
            param1.styleParent = null;
            param1.regenerateStyleCache(true);
            param1.styleChanged(null);
        }
    }

    public function notifyStyleChangeInChildren(param1: String, param2: Boolean): void {
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc7_: * = null;
        this.cachedTextFormat = null;
        var _loc3_: int = numChildren;
        var _loc4_: int = 0;
        while (_loc4_ < _loc3_) {
            if (_loc5_ = getChildAt(_loc4_) as ISimpleStyleClient) {
                _loc5_.styleChanged(param1);
                if (_loc5_ is IStyleClient) {
                    IStyleClient(_loc5_).notifyStyleChangeInChildren(param1, param2);
                }
            }
            _loc4_++;
        }
        if (this.mx_internal::advanceStyleClientChildren != null) {
            for (_loc6_ in this.mx_internal::advanceStyleClientChildren) {
                if (_loc7_ = _loc6_ as IAdvancedStyleClient) {
                    _loc7_.styleChanged(param1);
                }
            }
        }
    }

    mx_internal function initThemeColor(): Boolean {
        var _loc2_: * = null;
        var _loc3_: Number = NaN;
        var _loc4_: Number = NaN;
        var _loc5_: int = 0;
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc9_: * = null;
        var _loc10_: * = null;
        if (true) {
            return true;
        }
        var _loc1_: Object = this._styleName;
        if (this._styleDeclaration) {
            _loc2_ = this._styleDeclaration.getStyle("themeColor");
            _loc3_ = this._styleDeclaration.getStyle("rollOverColor");
            _loc4_ = this._styleDeclaration.getStyle("selectionColor");
        }
        if (this.styleManager.hasAdvancedSelectors()) {
            if (_loc2_ === null || !this.styleManager.isValidStyleValue(_loc2_)) {
                _loc5_ = (_loc6_ = StyleProtoChain.getMatchingStyleDeclarations(this)).length - 1;
                while (true) {
                    if (_loc5_ >= 0) {
                        if (_loc7_ = _loc6_[_loc5_]) {
                            _loc2_ = _loc7_.getStyle("themeColor");
                            _loc3_ = _loc7_.getStyle("rollOverColor");
                            _loc4_ = _loc7_.getStyle("selectionColor");
                        }
                        if (!(_loc2_ !== null && Boolean(this.styleManager.isValidStyleValue(_loc2_)))) {
                            continue;
                        }
                    }
                }
            }
        } else {
            if ((_loc2_ === null || !this.styleManager.isValidStyleValue(_loc2_)) && (_loc1_ && !(_loc1_ is ISimpleStyleClient))) {
                if (_loc8_ = _loc1_ is String ? this.styleManager.getMergedStyleDeclaration("." + _loc1_) : _loc1_) {
                    _loc2_ = _loc8_.getStyle("themeColor");
                    _loc3_ = Number(_loc8_.getStyle("rollOverColor"));
                    _loc4_ = Number(_loc8_.getStyle("selectionColor"));
                }
            }
            if (_loc2_ === null || !this.styleManager.isValidStyleValue(_loc2_)) {
                _loc9_ = this.getClassStyleDeclarations();
                _loc5_ = 0;
                while (_loc5_ < _loc9_.length) {
                    if (_loc10_ = _loc9_[_loc5_]) {
                        _loc2_ = _loc10_.getStyle("themeColor");
                        _loc3_ = _loc10_.getStyle("rollOverColor");
                        _loc4_ = _loc10_.getStyle("selectionColor");
                    }
                    if (_loc2_ !== null && Boolean(this.styleManager.isValidStyleValue(_loc2_))) {
                        break;
                    }
                    _loc5_++;
                }
            }
        }
        if (_loc2_ !== null && Boolean(this.styleManager.isValidStyleValue(_loc2_)) && isNaN(_loc3_) && isNaN(_loc4_)) {
            this.mx_internal::setThemeColor(_loc2_);
            return true;
        }
        return _loc2_ !== null && Boolean(this.styleManager.isValidStyleValue(_loc2_)) && !isNaN(_loc3_) && !isNaN(_loc4_);
    }

    mx_internal function setThemeColor(param1: Object): void {
        var _loc2_: Number = NaN;
        if (_loc2_ is String) {
            _loc2_ = parseInt(String(param1));
        } else {
            _loc2_ = Number(param1);
        }
        if (isNaN(_loc2_)) {
            _loc2_ = Number(this.styleManager.getColorName(param1));
        }
        var _loc3_: Number = ColorUtil.adjustBrightness2(_loc2_, 50);
        var _loc4_: Number = ColorUtil.adjustBrightness2(_loc2_, 70);
        this.setStyle("selectionColor", _loc3_);
        this.setStyle("rollOverColor", _loc4_);
    }

    public function determineTextFormatFromStyles(): UITextFormat {
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc1_: UITextFormat = this.cachedTextFormat;
        if (!_loc1_) {
            _loc2_ = StringUtil.trimArrayElements(this._inheritingStyles.fontFamily, ",");
            _loc1_ = new UITextFormat(this.mx_internal::getNonNullSystemManager(), _loc2_);
            _loc1_.moduleFactory = this.moduleFactory;
            _loc3_ = this._inheritingStyles.textAlign;
            if (_loc3_ == "start") {
                _loc3_ = "null";
            } else if (_loc3_ == "end") {
                _loc3_ = "null";
            }
            _loc1_.align = _loc3_;
            _loc1_.bold = this._inheritingStyles.fontWeight == "bold";
            _loc1_.color = this.enabled ? this._inheritingStyles.color : this._inheritingStyles.disabledColor;
            _loc1_.font = _loc2_;
            _loc1_.indent = this._inheritingStyles.textIndent;
            _loc1_.italic = this._inheritingStyles.fontStyle == "italic";
            _loc1_.kerning = this._inheritingStyles.kerning;
            _loc1_.leading = this._nonInheritingStyles.leading;
            _loc1_.leftMargin = this._nonInheritingStyles.paddingLeft;
            _loc1_.letterSpacing = this._inheritingStyles.letterSpacing;
            _loc1_.rightMargin = this._nonInheritingStyles.paddingRight;
            _loc1_.size = this._inheritingStyles.fontSize;
            _loc1_.underline = this._nonInheritingStyles.textDecoration == "underline";
            _loc1_.antiAliasType = this._inheritingStyles.fontAntiAliasType;
            _loc1_.gridFitType = this._inheritingStyles.fontGridFitType;
            _loc1_.sharpness = this._inheritingStyles.fontSharpness;
            _loc1_.thickness = this._inheritingStyles.fontThickness;
            _loc1_.useFTE = this.getTextFieldClassName() == "mx.core::UIFTETextField" || this.getTextInputClassName() == "mx.controls::MXFTETextInput";
            if (_loc1_.useFTE) {
                _loc1_.direction = this._inheritingStyles.direction;
                _loc1_.locale = this._inheritingStyles.locale;
            }
            this.cachedTextFormat = _loc1_;
        }
        return _loc1_;
    }

    public function executeBindings(param1: Boolean = false): void {
        var _loc2_: Object = Boolean(this.descriptor) && Boolean(this.descriptor.document) ? this.descriptor.document : this.parentDocument;
        BindingManager.executeBindings(_loc2_, this.id, this);
    }

    public function registerEffects(param1: Array): void {
        var _loc4_: * = null;
        var _loc2_: int = param1.length;
        var _loc3_: int = 0;
        while (_loc3_ < _loc2_) {
            if ((_loc4_ = EffectManager.mx_internal::getEventForEffectTrigger(param1[_loc3_])) != null && _loc4_ != "") {
                addEventListener(_loc4_, EffectManager.mx_internal::eventHandler, false, EventPriority.EFFECT);
            }
            _loc3_++;
        }
    }

    mx_internal function addOverlay(param1: uint, param2: RoundedRectangle = null): void {
        if (!this.mx_internal::effectOverlay) {
            this.mx_internal::effectOverlayColor = param1;
            this.mx_internal::effectOverlay = new UIComponent();
            this.mx_internal::effectOverlay.name = "overlay";
            this.mx_internal::effectOverlay.mx_internal::$visible = true;
            this.mx_internal::fillOverlay(this.mx_internal::effectOverlay, param1, param2);
            this.attachOverlay();
            if (!param2) {
                addEventListener(ResizeEvent.RESIZE, this.overlay_resizeHandler);
            }
            this.mx_internal::effectOverlay.x = 0;
            this.mx_internal::effectOverlay.y = 0;
            this.invalidateDisplayList();
            this.mx_internal::effectOverlayReferenceCount = 1;
        } else {
            ++this.mx_internal::effectOverlayReferenceCount;
        }
        this.dispatchEvent(new ChildExistenceChangedEvent(ChildExistenceChangedEvent.OVERLAY_CREATED, true, false, this.mx_internal::effectOverlay));
    }

    protected function attachOverlay(): void {
        this.addChild(this.mx_internal::effectOverlay);
    }

    mx_internal function fillOverlay(param1: UIComponent, param2: uint, param3: RoundedRectangle = null): void {
        if (!param3) {
            param3 = new RoundedRectangle(0, 0, this.unscaledWidth, this.unscaledHeight, 0);
        }
        var _loc4_: Graphics;
        (_loc4_ = param1.graphics).clear();
        _loc4_.beginFill(param2);
        _loc4_.drawRoundRect(param3.x, param3.y, param3.width, param3.height, param3.cornerRadius * 2, param3.cornerRadius * 2);
        _loc4_.endFill();
    }

    mx_internal function removeOverlay(): void {
        if (this.mx_internal::effectOverlayReferenceCount > 0 && --this.mx_internal::effectOverlayReferenceCount == 0 && Boolean(this.mx_internal::effectOverlay)) {
            removeEventListener(ResizeEvent.RESIZE, this.overlay_resizeHandler);
            if (super.getChildByName("overlay")) {
                this.mx_internal::$removeChild(this.mx_internal::effectOverlay);
            }
            this.mx_internal::effectOverlay = null;
        }
    }

    private function overlay_resizeHandler(param1: Event): void {
        this.mx_internal::fillOverlay(this.mx_internal::effectOverlay, this.mx_internal::effectOverlayColor, null);
    }

    mx_internal function get isEffectStarted(): Boolean {
        return this._isEffectStarted;
    }

    mx_internal function set isEffectStarted(param1: Boolean): void {
        this._isEffectStarted = param1;
    }

    public function effectStarted(param1: IEffectInstance): void {
        var _loc4_: * = null;
        this.mx_internal::_effectsStarted.push(param1);
        var _loc2_: Array = param1.effect.getAffectedProperties();
        var _loc3_: int = 0;
        while (_loc3_ < _loc2_.length) {
            _loc4_ = _loc2_[_loc3_];
            if (this.mx_internal::_affectedProperties[_loc4_] == undefined) {
                this.mx_internal::_affectedProperties[_loc4_] = [];
            }
            this.mx_internal::_affectedProperties[_loc4_].push(param1);
            _loc3_++;
        }
        this.mx_internal::isEffectStarted = true;
        if (param1.hideFocusRing) {
            this.preventDrawFocus = true;
            this.drawFocus(false);
        }
    }

    public function effectFinished(param1: IEffectInstance): void {
        this._endingEffectInstances.push(param1);
        this.invalidateProperties();
        UIComponentGlobals.mx_internal::layoutManager.addEventListener(FlexEvent.UPDATE_COMPLETE, this.updateCompleteHandler, false, 0, true);
    }

    public function endEffectsStarted(): void {
        var _loc1_: int = this.mx_internal::_effectsStarted.length;
        var _loc2_: int = 0;
        while (_loc2_ < _loc1_) {
            this.mx_internal::_effectsStarted[_loc2_].end();
            _loc2_++;
        }
    }

    private function updateCompleteHandler(param1: FlexEvent): void {
        UIComponentGlobals.mx_internal::layoutManager.removeEventListener(FlexEvent.UPDATE_COMPLETE, this.updateCompleteHandler);
        this.processEffectFinished(this._endingEffectInstances);
        this._endingEffectInstances = [];
    }

    private function processEffectFinished(param1: Array): void {
        var _loc3_: int = 0;
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc7_: int = 0;
        var _loc8_: * = null;
        var _loc9_: int = 0;
        var _loc2_: int = this.mx_internal::_effectsStarted.length - 1;
        while (_loc2_ >= 0) {
            _loc3_ = 0;
            while (_loc3_ < param1.length) {
                if ((_loc4_ = param1[_loc3_]) == this.mx_internal::_effectsStarted[_loc2_]) {
                    _loc5_ = this.mx_internal::_effectsStarted[_loc2_];
                    this.mx_internal::_effectsStarted.splice(_loc2_, 1);
                    _loc6_ = _loc5_.effect.getAffectedProperties();
                    _loc7_ = 0;
                    while (_loc7_ < _loc6_.length) {
                        _loc8_ = _loc6_[_loc7_];
                        if (this.mx_internal::_affectedProperties[_loc8_] != undefined) {
                            _loc9_ = 0;
                            while (_loc9_ < this.mx_internal::_affectedProperties[_loc8_].length) {
                                if (this.mx_internal::_affectedProperties[_loc8_][_loc9_] == _loc4_) {
                                    this.mx_internal::_affectedProperties[_loc8_].splice(_loc9_, 1);
                                    break;
                                }
                                _loc9_++;
                            }
                            if (this.mx_internal::_affectedProperties[_loc8_].length == 0) {
                                delete this.mx_internal::_affectedProperties[_loc8_];
                            }
                        }
                        _loc7_++;
                    }
                    break;
                }
                _loc3_++;
            }
            _loc2_--;
        }
        this.mx_internal::isEffectStarted = this.mx_internal::_effectsStarted.length > 0 ? true : false;
        if (Boolean(_loc4_) && _loc4_.hideFocusRing) {
            this.preventDrawFocus = false;
        }
    }

    mx_internal function getEffectsForProperty(param1: String): Array {
        return this.mx_internal::_affectedProperties[param1] != undefined ? this.mx_internal::_affectedProperties[param1] : [];
    }

    public function createReferenceOnParentDocument(param1: IFlexDisplayObject): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: int = 0;
        var _loc5_: int = 0;
        var _loc6_: * = null;
        var _loc7_: * = null;
        if (Boolean(this.id) && this.id != "") {
            _loc2_ = this._instanceIndices;
            if (!_loc2_) {
                param1[this.id] = this;
            } else {
                _loc3_ = param1[this.id];
                if (!(_loc3_ is Array)) {
                    _loc3_ = param1[this.id] = [];
                }
                _loc4_ = _loc2_.length;
                _loc5_ = 0;
                while (_loc5_ < _loc4_ - 1) {
                    if (!((_loc6_ = _loc3_[_loc2_[_loc5_]]) is Array)) {
                        _loc6_ = _loc3_[_loc2_[_loc5_]] = [];
                    }
                    _loc3_ = _loc6_;
                    _loc5_++;
                }
                _loc3_[_loc2_[_loc4_ - 1]] = this;
                if (param1.hasEventListener("propertyChange")) {
                    _loc7_ = PropertyChangeEvent.createUpdateEvent(param1, this.id, param1[this.id], param1[this.id]);
                    param1.dispatchEvent(_loc7_);
                }
            }
        }
    }

    public function deleteReferenceOnParentDocument(param1: IFlexDisplayObject): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: int = 0;
        var _loc6_: int = 0;
        var _loc7_: int = 0;
        var _loc8_: * = null;
        var _loc9_: * = null;
        if (Boolean(this.id) && this.id != "") {
            _loc2_ = this._instanceIndices;
            if (!_loc2_) {
                param1[this.id] = null;
            } else {
                _loc3_ = param1[this.id];
                if (!_loc3_) {
                    return;
                }
                (_loc4_ = []).push(_loc3_);
                _loc5_ = _loc2_.length;
                _loc6_ = 0;
                while (_loc6_ < _loc5_ - 1) {
                    if (!(_loc8_ = _loc3_[_loc2_[_loc6_]])) {
                        return;
                    }
                    _loc3_ = _loc8_;
                    _loc4_.push(_loc3_);
                    _loc6_++;
                }
                _loc3_.splice(_loc2_[_loc5_ - 1], 1);
                _loc7_ = _loc4_.length - 1;
                while (_loc7_ > 0) {
                    if (_loc4_[_loc7_].length == 0) {
                        _loc4_[_loc7_ - 1].splice(_loc2_[_loc7_], 1);
                    }
                    _loc7_--;
                }
                if (_loc4_.length > 0 && _loc4_[0].length == 0) {
                    param1[this.id] = null;
                } else if (param1.hasEventListener("propertyChange")) {
                    _loc9_ = PropertyChangeEvent.createUpdateEvent(param1, this.id, param1[this.id], param1[this.id]);
                    param1.dispatchEvent(_loc9_);
                }
            }
        }
    }

    public function getRepeaterItem(param1: int = -1): Object {
        var _loc2_: Array = this.repeaters;
        if (_loc2_.length == 0) {
            return null;
        }
        if (param1 == -1) {
            param1 = _loc2_.length - 1;
        }
        return _loc2_[param1].getItemAt(this.repeaterIndices[param1]);
    }

    protected function resourcesChanged(): void {
    }

    public function prepareToPrint(param1: IFlexDisplayObject): Object {
        return null;
    }

    public function finishPrint(param1: Object, param2: IFlexDisplayObject): void {
    }

    private function callLaterDispatcher(param1: Event): void {
        var callLaterErrorEvent: DynamicEvent = null;
        var var_6: Event = param1;
        ++UIComponentGlobals.mx_internal::callLaterDispatcherCount;
        if (true) {
            this.callLaterDispatcher2(var_6);
        } else {
            try {
                this.callLaterDispatcher2(var_6);
            } catch (e: Error) {
                callLaterErrorEvent = new DynamicEvent("callLaterError");
                callLaterErrorEvent.error = e;
                callLaterErrorEvent.source = this;
                systemManager.dispatchEvent(callLaterErrorEvent);
            }
        }
        --UIComponentGlobals.mx_internal::callLaterDispatcherCount;
    }

    private function callLaterDispatcher2(param1: Event): void {
        var _loc6_: * = null;
        if (false) {
            return;
        }
        var _loc2_: ISystemManager = this.systemManager;
        if (_loc2_ && (_loc2_.stage || this.usingBridge) && this.listeningForRender) {
            _loc2_.removeEventListener(FlexEvent.RENDER, this.callLaterDispatcher);
            _loc2_.removeEventListener(FlexEvent.ENTER_FRAME, this.callLaterDispatcher);
            this.listeningForRender = false;
        }
        var _loc3_: Array = this.methodQueue;
        this.methodQueue = [];
        var _loc4_: int = _loc3_.length;
        var _loc5_: int = 0;
        while (_loc5_ < _loc4_) {
            (_loc6_ = MethodQueueElement(_loc3_[_loc5_])).method.apply(null, _loc6_.args);
            _loc5_++;
        }
    }

    protected function keyDownHandler(param1: KeyboardEvent): void {
    }

    protected function keyUpHandler(param1: KeyboardEvent): void {
    }

    protected function isOurFocus(param1: DisplayObject): Boolean {
        return param1 == this;
    }

    protected function focusInHandler(param1: FocusEvent): void {
        var _loc2_: * = null;
        if (this.isOurFocus(DisplayObject(param1.target))) {
            _loc2_ = this.focusManager;
            if (Boolean(_loc2_) && _loc2_.showFocusIndicator) {
                this.drawFocus(true);
            }
            ContainerGlobals.checkFocus(param1.relatedObject, this);
        }
    }

    protected function focusOutHandler(param1: FocusEvent): void {
        if (this.isOurFocus(DisplayObject(param1.target))) {
            this.drawFocus(false);
        }
    }

    private function addedHandler(param1: Event): void {
        if (param1.eventPhase != EventPhase.AT_TARGET) {
            return;
        }
        try {
            if (this.parent is IContainer && Boolean(IContainer(this.parent).creatingContentPane)) {
                param1.stopImmediatePropagation();
                return;
            }
        } catch (error: SecurityError) {
        }
    }

    private function removedHandler(param1: Event): void {
        if (param1.eventPhase != EventPhase.AT_TARGET) {
            return;
        }
        try {
            if (this.parent is IContainer && Boolean(IContainer(this.parent).creatingContentPane)) {
                param1.stopImmediatePropagation();
                return;
            }
        } catch (error: SecurityError) {
        }
    }

    private function removedFromStageHandler(param1: Event): void {
        this._systemManagerDirty = true;
    }

    private function setFocusLater(param1: Event = null): void {
        var _loc2_: ISystemManager = this.systemManager;
        if (Boolean(_loc2_) && Boolean(_loc2_.stage)) {
            _loc2_.stage.removeEventListener(Event.ENTER_FRAME, this.setFocusLater);
            if (false) {
                _loc2_.stage.focus = UIComponentGlobals.mx_internal::nextFocusObject;
            }
            UIComponentGlobals.mx_internal::nextFocusObject = null;
        }
    }

    private function focusObj_scrollHandler(param1: Event): void {
        this.adjustFocusRect();
    }

    private function focusObj_moveHandler(param1: MoveEvent): void {
        this.adjustFocusRect();
    }

    private function focusObj_resizeHandler(param1: Event): void {
        if (param1 is ResizeEvent) {
            this.adjustFocusRect();
        }
    }

    private function focusObj_removedHandler(param1: Event): void {
        if (param1.target != this) {
            return;
        }
        var _loc2_: DisplayObject = this.mx_internal::getFocusObject();
        if (_loc2_) {
            _loc2_.visible = false;
        }
    }

    protected function layer_PropertyChange(param1: PropertyChangeEvent): void {
        var _loc2_: Boolean = false;
        var _loc3_: Number = NaN;
        switch (param1.property) {
            case "effectiveVisibility":
                _loc2_ = Boolean(param1.newValue) && this._visible;
                if (_loc2_ != this.mx_internal::$visible) {
                    this.mx_internal::$visible = _loc2_;
                    break;
                }
                break;
            case "effectiveAlpha":
                _loc3_ = Number(param1.newValue) * this._alpha;
                if (_loc3_ != this.mx_internal::$alpha) {
                    this.mx_internal::$alpha = _loc3_;
                    break;
                }
        }
    }

    public function validationResultHandler(param1: ValidationResultEvent): void {
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: int = 0;
        if (this.errorObjectArray === null) {
            this.errorObjectArray = new Array();
            this.errorArray = new Array();
        }
        var _loc2_: int = this.errorObjectArray.indexOf(param1.target);
        if (param1.type == ValidationResultEvent.VALID) {
            if (_loc2_ != -1) {
                this.errorObjectArray.splice(_loc2_, 1);
                this.errorArray.splice(_loc2_, 1);
                this.errorString = this.errorArray.join("\n");
                if (this.errorArray.length == 0) {
                    this.dispatchEvent(new FlexEvent(FlexEvent.VALID));
                }
            }
        } else {
            if (this.validationSubField != null && this.validationSubField != "" && Boolean(param1.results)) {
                _loc5_ = 0;
                while (_loc5_ < param1.results.length) {
                    if ((_loc4_ = param1.results[_loc5_]).subField == this.validationSubField) {
                        if (_loc4_.isError) {
                            _loc3_ = _loc4_.errorMessage;
                            break;
                        }
                        if (_loc2_ != -1) {
                            this.errorObjectArray.splice(_loc2_, 1);
                            this.errorArray.splice(_loc2_, 1);
                            this.errorString = this.errorArray.join("\n");
                            if (this.errorArray.length == 0) {
                                this.dispatchEvent(new FlexEvent(FlexEvent.VALID));
                                break;
                            }
                            break;
                        }
                        break;
                    }
                    _loc5_++;
                }
            } else if (Boolean(param1.results) && param1.results.length > 0) {
                _loc3_ = param1.results[0].errorMessage;
            }
            if (Boolean(_loc3_) && _loc2_ != -1) {
                this.errorArray[_loc2_] = _loc3_;
                this.errorString = this.errorArray.join("\n");
                this.dispatchEvent(new FlexEvent(FlexEvent.INVALID));
            } else if (Boolean(_loc3_) && _loc2_ == -1) {
                this.errorObjectArray.push(param1.target);
                this.errorArray.push(_loc3_);
                this.errorString = this.errorArray.join("\n");
                this.dispatchEvent(new FlexEvent(FlexEvent.INVALID));
            }
        }
    }

    private function resourceManager_changeHandler(param1: Event): void {
        this.resourcesChanged();
    }

    private function filterChangeHandler(param1: Event): void {
        this.filters = this._filters;
    }

    public function owns(param1: DisplayObject): Boolean {
        var child: DisplayObject = param1;
        var childList: IChildList = this is IRawChildrenContainer ? IRawChildrenContainer(this).rawChildren : IChildList(this);
        if (childList.contains(child)) {
            return true;
        }
        try {
            while (Boolean(child) && child != this) {
                if (child is IUIComponent) {
                    child = IUIComponent(child).owner;
                } else {
                    child = child.parent;
                }
            }
        } catch (e: SecurityError) {
            return false;
        }
        return child == this;
    }

    mx_internal function getFontContext(param1: String, param2: Boolean, param3: Boolean, param4: * = undefined): IFlexModuleFactory {
        if (noEmbeddedFonts) {
            return null;
        }
        var _loc5_: IEmbeddedFontRegistry;
        return !!(_loc5_ = mx_internal::embeddedFontRegistry) ? _loc5_.getAssociatedModuleFactory(param1, param2, param3, this, this.moduleFactory, this.systemManager, param4) : null;
    }

    protected function createInFontContext(param1: Class): Object {
        this.hasFontContextBeenSaved = true;
        var _loc2_: String = StringUtil.trimArrayElements(this.getStyle("fontFamily"), ",");
        var _loc3_: String = this.getStyle("fontWeight");
        var _loc4_: String = this.getStyle("fontStyle");
        var _loc5_: * = _loc3_ == "bold";
        var _loc6_: * = _loc4_ == "italic";
        var _loc7_: String;
        if ((_loc7_ = getQualifiedClassName(param1)) == "mx.core::UITextField") {
            if ((_loc7_ = this.getTextFieldClassName()) == "mx.core::UIFTETextField") {
                param1 = Class(ApplicationDomain.currentDomain.getDefinition(_loc7_));
            }
        }
        this.oldEmbeddedFontContext = this.mx_internal::getFontContext(_loc2_, _loc5_, _loc6_, _loc7_ == "mx.core::UIFTETextField");
        var _loc8_: IFlexModuleFactory = !!this.oldEmbeddedFontContext ? this.oldEmbeddedFontContext : this.moduleFactory;
        var _loc9_: Object;
        if ((_loc9_ = this.createInModuleContext(_loc8_, _loc7_)) == null) {
            _loc9_ = new param1();
        }
        if (_loc7_ == "mx.core::UIFTETextField") {
            _loc9_.fontContext = _loc8_;
        }
        return _loc9_;
    }

    private function getTextFieldClassName(): String {
        var _loc1_: Class = this.getStyle("textFieldClass");
        if (!_loc1_ || false) {
            return "mx.core::UITextField";
        }
        return getQualifiedClassName(_loc1_);
    }

    private function getTextInputClassName(): String {
        var _loc1_: Class = this.getStyle("textInputClass");
        if (!_loc1_ || false) {
            return "mx.core::TextInput";
        }
        return getQualifiedClassName(_loc1_);
    }

    protected function createInModuleContext(param1: IFlexModuleFactory, param2: String): Object {
        var _loc3_: * = null;
        if (param1) {
            _loc3_ = param1.create(param2);
        }
        return _loc3_;
    }

    public function hasFontContextChanged(): Boolean {
        if (!this.hasFontContextBeenSaved) {
            return false;
        }
        var _loc1_: String = StringUtil.trimArrayElements(this.getStyle("fontFamily"), ",");
        var _loc2_: String = this.getStyle("fontWeight");
        var _loc3_: String = this.getStyle("fontStyle");
        var _loc4_: * = _loc2_ == "bold";
        var _loc5_: * = _loc3_ == "italic";
        return (noEmbeddedFonts ? null : mx_internal::embeddedFontRegistry.getAssociatedModuleFactory(_loc1_, _loc4_, _loc5_, this, this.moduleFactory, this.systemManager)) != this.oldEmbeddedFontContext;
    }

    public function createAutomationIDPart(param1: IAutomationObject): Object {
        if (this.automationDelegate) {
            return this.automationDelegate.createAutomationIDPart(param1);
        }
        return null;
    }

    public function createAutomationIDPartWithRequiredProperties(param1: IAutomationObject, param2: Array): Object {
        if (this.automationDelegate) {
            return this.automationDelegate.createAutomationIDPartWithRequiredProperties(param1, param2);
        }
        return null;
    }

    public function resolveAutomationIDPart(param1: Object): Array {
        if (this.automationDelegate) {
            return this.automationDelegate.resolveAutomationIDPart(param1);
        }
        return [];
    }

    public function getAutomationChildAt(param1: int): IAutomationObject {
        if (this.automationDelegate) {
            return this.automationDelegate.getAutomationChildAt(param1);
        }
        return null;
    }

    public function getAutomationChildren(): Array {
        if (this.automationDelegate) {
            return this.automationDelegate.getAutomationChildren();
        }
        return null;
    }

    public function get numAutomationChildren(): int {
        if (this.automationDelegate) {
            return this.automationDelegate.numAutomationChildren;
        }
        return 0;
    }

    public function get automationTabularData(): Object {
        if (this.automationDelegate) {
            return this.automationDelegate.automationTabularData;
        }
        return null;
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
        return this.visible;
    }

    public function replayAutomatableEvent(param1: Event): Boolean {
        if (this.automationDelegate) {
            return this.automationDelegate.replayAutomatableEvent(param1);
        }
        return false;
    }

    public function getVisibleRect(param1: DisplayObject = null): Rectangle {
        if (!param1) {
            param1 = DisplayObject(this.systemManager);
        }
        var _loc2_: DisplayObject = !!this.mx_internal::$parent ? this.mx_internal::$parent : this.parent;
        if (!_loc2_) {
            return new Rectangle();
        }
        var _loc3_: Point = new Point(this.x, this.y);
        _loc3_ = _loc2_.localToGlobal(_loc3_);
        var _loc4_: Rectangle = new Rectangle(_loc3_.x, _loc3_.y, this.width, this.height);
        var _loc5_: DisplayObject = this;
        var _loc6_: Rectangle = new Rectangle();
        do {
            if (_loc5_ is UIComponent) {
                if (UIComponent(_loc5_).mx_internal::$parent) {
                    _loc5_ = UIComponent(_loc5_).mx_internal::$parent;
                } else {
                    _loc5_ = UIComponent(_loc5_).parent;
                }
            } else {
                _loc5_ = _loc5_.parent;
            }
            if (Boolean(_loc5_) && Boolean(_loc5_.scrollRect)) {
                _loc6_ = _loc5_.scrollRect.clone();
                _loc3_ = _loc5_.localToGlobal(_loc6_.topLeft);
                _loc6_.x = _loc3_.x;
                _loc6_.y = _loc3_.y;
                _loc4_ = _loc4_.intersection(_loc6_);
            }
        }
        while (Boolean(_loc5_) && _loc5_ != param1);

        return _loc4_;
    }

    override public function dispatchEvent(param1: Event): Boolean {
        if (mx_internal::dispatchEventHook != null) {
            mx_internal::dispatchEventHook(param1, this);
        }
        return super.dispatchEvent(param1);
    }

    override public function get mouseX(): Number {
        if (!root || root is Stage || root[fakeMouseX] === undefined) {
            return super.mouseX;
        }
        return globalToLocal(new Point(root[fakeMouseX], 0)).x;
    }

    override public function get mouseY(): Number {
        if (!root || root is Stage || root[fakeMouseY] === undefined) {
            return super.mouseY;
        }
        return globalToLocal(new Point(0, root[fakeMouseY])).y;
    }

    protected function initAdvancedLayoutFeatures(): void {
        this.internal_initAdvancedLayoutFeatures();
    }

    mx_internal function transformRequiresValidations(): Boolean {
        return this.mx_internal::_layoutFeatures != null;
    }

    mx_internal function clearAdvancedLayoutFeatures(): void {
        if (this.mx_internal::_layoutFeatures) {
            this.validateMatrix();
            this.mx_internal::_layoutFeatures = null;
        }
    }

    private function internal_initAdvancedLayoutFeatures(): AdvancedLayoutFeatures {
        var _loc1_: AdvancedLayoutFeatures = new AdvancedLayoutFeatures();
        this._hasComplexLayoutMatrix = true;
        _loc1_.layoutScaleX = this.scaleX;
        _loc1_.layoutScaleY = this.scaleY;
        _loc1_.layoutScaleZ = this.scaleZ;
        _loc1_.layoutRotationX = this.rotationX;
        _loc1_.layoutRotationY = this.rotationY;
        _loc1_.layoutRotationZ = this.rotation;
        _loc1_.layoutX = this.x;
        _loc1_.layoutY = this.y;
        _loc1_.layoutZ = this.z;
        _loc1_.layoutWidth = this.width;
        this.mx_internal::_layoutFeatures = _loc1_;
        this.invalidateTransform();
        return _loc1_;
    }

    private function setTransform(param1: flash.geom.Transform): void {
        var _loc2_: mx.geom.Transform = this._transform as mx.geom.Transform;
        if (_loc2_) {
            _loc2_.target = null;
        }
        var _loc3_: mx.geom.Transform = param1 as mx.geom.Transform;
        if (_loc3_) {
            _loc3_.target = this;
        }
        this._transform = param1;
    }

    mx_internal function get $transform(): flash.geom.Transform {
        return super.transform;
    }

    override public function get transform(): flash.geom.Transform {
        if (this._transform == null) {
            this.setTransform(new mx.geom.Transform(this));
        }
        return this._transform;
    }

    override public function set transform(param1: flash.geom.Transform): void {
        var _loc2_: * = param1.matrix;
        var _loc3_: * = param1.matrix3D;
        var _loc4_: ColorTransform = param1.colorTransform;
        var _loc5_: PerspectiveProjection = param1.perspectiveProjection;
        var _loc6_: Boolean = this.is3D;
        var _loc7_: mx.geom.Transform;
        if (_loc7_ = param1 as mx.geom.Transform) {
            if (!_loc7_.mx_internal::applyMatrix) {
                _loc2_ = null;
            }
            if (!_loc7_.mx_internal::applyMatrix3D) {
                _loc3_ = null;
            }
        }
        this.setTransform(param1);
        if (_loc2_ != null) {
            this.setLayoutMatrix(_loc2_.clone(), true);
        } else if (_loc3_ != null) {
            this.setLayoutMatrix3D(_loc3_.clone(), true);
        }
        super.transform.colorTransform = _loc4_;
        super.transform.perspectiveProjection = _loc5_;
        if (this.maintainProjectionCenter) {
            this.invalidateDisplayList();
        }
        if (_loc6_ != this.is3D) {
            this.validateMatrix();
        }
    }

    public function get postLayoutTransformOffsets(): TransformOffsets {
        return this.mx_internal::_layoutFeatures != null ? this.mx_internal::_layoutFeatures.postLayoutTransformOffsets : null;
    }

    public function set postLayoutTransformOffsets(param1: TransformOffsets): void {
        var _loc2_: Boolean = this.is3D;
        if (this.mx_internal::_layoutFeatures == null) {
            this.initAdvancedLayoutFeatures();
        }
        if (this.mx_internal::_layoutFeatures.postLayoutTransformOffsets != null) {
            this.mx_internal::_layoutFeatures.postLayoutTransformOffsets.removeEventListener(Event.CHANGE, this.transformOffsetsChangedHandler);
        }
        this.mx_internal::_layoutFeatures.postLayoutTransformOffsets = param1;
        if (this.mx_internal::_layoutFeatures.postLayoutTransformOffsets != null) {
            this.mx_internal::_layoutFeatures.postLayoutTransformOffsets.addEventListener(Event.CHANGE, this.transformOffsetsChangedHandler);
        }
        if (_loc2_ != this.is3D) {
            this.validateMatrix();
        }
        this.invalidateTransform();
    }

    public function set maintainProjectionCenter(param1: Boolean): void {
        this._maintainProjectionCenter = param1;
        if (param1 && super.transform.perspectiveProjection == null) {
            super.transform.perspectiveProjection = new PerspectiveProjection();
        }
        this.invalidateDisplayList();
    }

    public function get maintainProjectionCenter(): Boolean {
        return this._maintainProjectionCenter;
    }

    public function setLayoutMatrix(param1: Matrix, param2: Boolean): void {
        var _loc3_: Matrix = !!this.mx_internal::_layoutFeatures ? this.mx_internal::_layoutFeatures.layoutMatrix : super.transform.matrix;
        var _loc4_: Boolean = this.is3D;
        this._hasComplexLayoutMatrix = true;
        if (this.mx_internal::_layoutFeatures == null) {
            super.transform.matrix = param1;
        } else {
            this.mx_internal::_layoutFeatures.layoutMatrix = param1;
            this.invalidateTransform();
        }
        if (MatrixUtil.isEqual(_loc3_, !!this.mx_internal::_layoutFeatures ? this.mx_internal::_layoutFeatures.layoutMatrix : super.transform.matrix)) {
            return;
        }
        this.invalidateProperties();
        if (param2) {
            this.invalidateParentSizeAndDisplayList();
        }
        if (_loc4_ != this.is3D) {
            this.validateMatrix();
        }
    }

    public function setLayoutMatrix3D(param1: Matrix3D, param2: Boolean): void {
        if (Boolean(this.mx_internal::_layoutFeatures) && MatrixUtil.isEqual3D(this.mx_internal::_layoutFeatures.layoutMatrix3D, param1)) {
            return;
        }
        var _loc3_: Boolean = this.is3D;
        if (this.mx_internal::_layoutFeatures == null) {
            this.initAdvancedLayoutFeatures();
        }
        this.mx_internal::_layoutFeatures.layoutMatrix3D = param1;
        this.invalidateTransform();
        this.invalidateProperties();
        if (param2) {
            this.invalidateParentSizeAndDisplayList();
        }
        if (_loc3_ != this.is3D) {
            this.validateMatrix();
        }
    }

    public function transformAround(param1: Vector3D, param2: Vector3D = null, param3: Vector3D = null, param4: Vector3D = null, param5: Vector3D = null, param6: Vector3D = null, param7: Vector3D = null, param8: Boolean = true): void {
        var _loc9_: Boolean = false;
        if (!param8) {
            _loc9_ = this._includeInLayout;
            this._includeInLayout = false;
        }
        var _loc10_: Number = this.x;
        var _loc11_: Number = this.y;
        var _loc12_: Number = this.z;
        TransformUtil.transformAround(this, param1, param2, param3, param4, param5, param6, param7, this.mx_internal::_layoutFeatures, this.internal_initAdvancedLayoutFeatures);
        if (this.mx_internal::_layoutFeatures != null) {
            this.invalidateTransform();
            this.invalidateParentSizeAndDisplayList();
            if (_loc10_ != this.mx_internal::_layoutFeatures.layoutX) {
                this.dispatchEvent(new Event("xChanged"));
            }
            if (_loc11_ != this.mx_internal::_layoutFeatures.layoutY) {
                this.dispatchEvent(new Event("yChanged"));
            }
            if (_loc12_ != this.mx_internal::_layoutFeatures.layoutZ) {
                this.dispatchEvent(new Event("zChanged"));
            }
        }
        if (!param8) {
            this._includeInLayout = _loc9_;
        }
    }

    public function transformPointToParent(param1: Vector3D, param2: Vector3D, param3: Vector3D): void {
        TransformUtil.transformPointToParent(this, param1, param2, param3, this.mx_internal::_layoutFeatures);
    }

    public function set layoutMatrix3D(param1: Matrix3D): void {
        this.setLayoutMatrix3D(param1, true);
    }

    public function get depth(): Number {
        return this.mx_internal::_layoutFeatures == null ? 0 : this.mx_internal::_layoutFeatures.depth;
    }

    public function set depth(param1: Number): void {
        if (param1 == this.depth) {
            return;
        }
        if (this.mx_internal::_layoutFeatures == null) {
            this.initAdvancedLayoutFeatures();
        }
        this.mx_internal::_layoutFeatures.depth = param1;
        if (this.parent is UIComponent) {
            UIComponent(this.parent).invalidateLayering();
        }
    }

    public function invalidateLayering(): void {
    }

    protected function applyComputedMatrix(): void {
        this.mx_internal::_layoutFeatures.updatePending = false;
        if (this.mx_internal::_layoutFeatures.is3D) {
            super.transform.matrix3D = this.mx_internal::_layoutFeatures.computedMatrix3D;
        } else {
            super.transform.matrix = this.mx_internal::_layoutFeatures.computedMatrix;
        }
    }

    mx_internal function get computedMatrix(): Matrix {
        return !!this.mx_internal::_layoutFeatures ? this.mx_internal::_layoutFeatures.computedMatrix : this.transform.matrix;
    }

    protected function setStretchXY(param1: Number, param2: Number): void {
        if (this.mx_internal::_layoutFeatures == null) {
            this.initAdvancedLayoutFeatures();
        }
        if (param1 != this.mx_internal::_layoutFeatures.stretchX || param2 != this.mx_internal::_layoutFeatures.stretchY) {
            this.mx_internal::_layoutFeatures.stretchX = param1;
            this.mx_internal::_layoutFeatures.stretchY = param2;
            this.invalidateTransform();
        }
    }

    public function getPreferredBoundsWidth(param1: Boolean = true): Number {
        return LayoutElementUIComponentUtils.getPreferredBoundsWidth(this, param1 ? this.nonDeltaLayoutMatrix() : null);
    }

    public function getPreferredBoundsHeight(param1: Boolean = true): Number {
        return LayoutElementUIComponentUtils.getPreferredBoundsHeight(this, param1 ? this.nonDeltaLayoutMatrix() : null);
    }

    public function getMinBoundsWidth(param1: Boolean = true): Number {
        return LayoutElementUIComponentUtils.getMinBoundsWidth(this, param1 ? this.nonDeltaLayoutMatrix() : null);
    }

    public function getMinBoundsHeight(param1: Boolean = true): Number {
        return LayoutElementUIComponentUtils.getMinBoundsHeight(this, param1 ? this.nonDeltaLayoutMatrix() : null);
    }

    public function getMaxBoundsWidth(param1: Boolean = true): Number {
        return LayoutElementUIComponentUtils.getMaxBoundsWidth(this, param1 ? this.nonDeltaLayoutMatrix() : null);
    }

    public function getMaxBoundsHeight(param1: Boolean = true): Number {
        return LayoutElementUIComponentUtils.getMaxBoundsHeight(this, param1 ? this.nonDeltaLayoutMatrix() : null);
    }

    public function getBoundsXAtSize(param1: Number, param2: Number, param3: Boolean = true): Number {
        return LayoutElementUIComponentUtils.getBoundsXAtSize(this, param1, param2, param3 ? this.nonDeltaLayoutMatrix() : null);
    }

    public function getBoundsYAtSize(param1: Number, param2: Number, param3: Boolean = true): Number {
        return LayoutElementUIComponentUtils.getBoundsYAtSize(this, param1, param2, param3 ? this.nonDeltaLayoutMatrix() : null);
    }

    public function getLayoutBoundsWidth(param1: Boolean = true): Number {
        return LayoutElementUIComponentUtils.getLayoutBoundsWidth(this, param1 ? this.nonDeltaLayoutMatrix() : null);
    }

    public function getLayoutBoundsHeight(param1: Boolean = true): Number {
        return LayoutElementUIComponentUtils.getLayoutBoundsHeight(this, param1 ? this.nonDeltaLayoutMatrix() : null);
    }

    public function getLayoutBoundsX(param1: Boolean = true): Number {
        return LayoutElementUIComponentUtils.getLayoutBoundsX(this, param1 ? this.nonDeltaLayoutMatrix() : null);
    }

    public function getLayoutBoundsY(param1: Boolean = true): Number {
        return LayoutElementUIComponentUtils.getLayoutBoundsY(this, param1 ? this.nonDeltaLayoutMatrix() : null);
    }

    public function setLayoutBoundsPosition(param1: Number, param2: Number, param3: Boolean = true): void {
        LayoutElementUIComponentUtils.setLayoutBoundsPosition(this, param1, param2, param3 ? this.nonDeltaLayoutMatrix() : null);
    }

    public function setLayoutBoundsSize(param1: Number, param2: Number, param3: Boolean = true): void {
        LayoutElementUIComponentUtils.setLayoutBoundsSize(this, param1, param2, param3 ? this.nonDeltaLayoutMatrix() : null);
    }

    public function getLayoutMatrix(): Matrix {
        if (this.mx_internal::_layoutFeatures != null || super.transform.matrix == null) {
            if (this.mx_internal::_layoutFeatures == null) {
                this.initAdvancedLayoutFeatures();
            }
            return this.mx_internal::_layoutFeatures.layoutMatrix.clone();
        }
        return super.transform.matrix;
    }

    public function get hasLayoutMatrix3D(): Boolean {
        return !!this.mx_internal::_layoutFeatures ? this.mx_internal::_layoutFeatures.layoutIs3D : false;
    }

    public function get is3D(): Boolean {
        return !!this.mx_internal::_layoutFeatures ? this.mx_internal::_layoutFeatures.is3D : false;
    }

    public function getLayoutMatrix3D(): Matrix3D {
        if (this.mx_internal::_layoutFeatures == null) {
            this.initAdvancedLayoutFeatures();
        }
        return this.mx_internal::_layoutFeatures.layoutMatrix3D.clone();
    }

    protected function nonDeltaLayoutMatrix(): Matrix {
        if (!this.hasComplexLayoutMatrix) {
            return null;
        }
        if (this.mx_internal::_layoutFeatures != null) {
            return this.mx_internal::_layoutFeatures.layoutMatrix;
        }
        return super.transform.matrix;
    }
}
}

class MethodQueueElement {


    public var method: Function;

    public var args: Array;

    function MethodQueueElement(param1: Function, param2: Array = null) {
        super();
        this.method = param1;
        this.args = param2;
    }
}
