package mx.managers {

import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.Graphics;
import flash.display.Loader;
import flash.display.LoaderInfo;
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.display.Stage;
import flash.display.StageAlign;
import flash.display.StageQuality;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.events.EventPhase;
import flash.events.FocusEvent;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.events.TimerEvent;
import flash.geom.Point;
import flash.geom.Rectangle;
import flash.system.ApplicationDomain;
import flash.text.Font;
import flash.text.TextFormat;
import flash.ui.Keyboard;
import flash.utils.Dictionary;
import flash.utils.Timer;
import flash.utils.getQualifiedClassName;

import mx.core.FlexSprite;
import mx.core.IChildList;
import mx.core.IFlexDisplayObject;
import mx.core.IFlexModuleFactory;
import mx.core.IInvalidating;
import mx.core.IRawChildrenContainer;
import mx.core.IUIComponent;
import mx.core.RSLData;
import mx.core.RSLItem;
import mx.core.Singleton;
import mx.core.mx_internal;
import mx.events.DynamicEvent;
import mx.events.FlexEvent;
import mx.events.RSLEvent;
import mx.events.Request;
import mx.events.SandboxMouseEvent;
import mx.preloaders.Preloader;
import mx.utils.DensityUtil;
import mx.utils.LoaderUtil;

public class SystemManager extends MovieClip implements IChildList, IFlexDisplayObject, IFlexModuleFactory, ISystemManager {

    mx_internal static const VERSION: String = "4.6.0.23201";

    private static const IDLE_THRESHOLD: Number = 1000;

    private static const IDLE_INTERVAL: Number = 100;

    mx_internal static var allSystemManagers: Dictionary = new Dictionary(true);


    mx_internal var topLevel: Boolean = true;

    private var isDispatchingResizeEvent: Boolean;

    mx_internal var isStageRoot: Boolean = true;

    mx_internal var isBootstrapRoot: Boolean = false;

    private var _topLevelSystemManager: ISystemManager;

    mx_internal var childManager: ISystemManagerChildManager;

    private var _stage: Stage;

    mx_internal var nestLevel: int = 0;

    mx_internal var preloader: Preloader;

    private var mouseCatcher: Sprite;

    mx_internal var topLevelWindow: IUIComponent;

    mx_internal var idleCounter: int = 0;

    private var idleTimer: Timer;

    private var nextFrameTimer: Timer = null;

    private var lastFrame: int;

    private var readyForKickOff: Boolean;

    public var _resourceBundles: Array;

    private var rslDataList: Array;

    private var _height: Number;

    private var _width: Number;

    private var _allowDomainsInNewRSLs: Boolean = true;

    private var _allowInsecureDomainsInNewRSLs: Boolean = true;

    private var _applicationIndex: int = 1;

    private var _cursorChildren: SystemChildrenList;

    private var _cursorIndex: int = 0;

    private var _densityScale: Number = NaN;

    private var _document: Object;

    private var _fontList: Object = null;

    private var _explicitHeight: Number;

    private var _explicitWidth: Number;

    private var _focusPane: Sprite;

    private var _noTopMostIndex: int = 0;

    private var _numModalWindows: int = 0;

    private var _popUpChildren: SystemChildrenList;

    private var _rawChildren: SystemRawChildrenList;

    mx_internal var _screen: Rectangle;

    private var _toolTipChildren: SystemChildrenList;

    private var _toolTipIndex: int = 0;

    private var _topMostIndex: int = 0;

    mx_internal var _mouseX;

    mx_internal var _mouseY;

    private var implMap: Object;

    public function SystemManager() {
        this.implMap = {};
        super();
        if (this.stage) {
            this.stage.scaleMode = StageScaleMode.NO_SCALE;
            this.stage.align = StageAlign.TOP_LEFT;
            this.stage.quality = StageQuality.HIGH;
        }
        if (SystemManagerGlobals.topLevelSystemManagers.length > 0 && !this.stage) {
            this.mx_internal::topLevel = false;
        }
        if (!this.stage) {
            this.mx_internal::isStageRoot = false;
        }
        if (this.mx_internal::topLevel) {
            SystemManagerGlobals.topLevelSystemManagers.push(this);
        }
        stop();
        if (Boolean(root) && false) {
            root.loaderInfo.addEventListener(Event.INIT, this.initHandler);
        }
    }

    public static function getSWFRoot(param1: Object): DisplayObject {
        var _loc3_: * = undefined;
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc2_: String = getQualifiedClassName(param1);
        for (_loc3_ in mx_internal::allSystemManagers) {
            _loc5_ = (_loc4_ = _loc3_ as ISystemManager).loaderInfo.applicationDomain;
            try {
                _loc6_ = Class(_loc5_.getDefinition(_loc2_));
                if (param1 is _loc6_) {
                    return _loc4_ as DisplayObject;
                }
            } catch (e: Error) {
                continue;
            }
        }
        return null;
    }

    private static function getChildListIndex(param1: IChildList, param2: Object): int {
        var _loc3_: int = -1;
        try {
            _loc3_ = param1.getChildIndex(DisplayObject(param2));
        } catch (e: ArgumentError) {
        }
        return _loc3_;
    }

    private function deferredNextFrame(): void {
        if (currentFrame + 1 > totalFrames) {
            return;
        }
        if (currentFrame + 1 <= framesLoaded) {
            nextFrame();
        } else {
            this.nextFrameTimer = new Timer(100);
            this.nextFrameTimer.addEventListener(TimerEvent.TIMER, this.nextFrameTimerHandler);
            this.nextFrameTimer.start();
        }
    }

    override public function get height(): Number {
        return this._height;
    }

    override public function get stage(): Stage {
        var _loc2_: * = null;
        if (this._stage) {
            return this._stage;
        }
        var _loc1_: Stage = super.stage;
        if (_loc1_) {
            this._stage = _loc1_;
            return _loc1_;
        }
        if (!this.mx_internal::topLevel && Boolean(this._topLevelSystemManager)) {
            this._stage = this._topLevelSystemManager.stage;
            return this._stage;
        }
        if (!this.mx_internal::isStageRoot && this.mx_internal::topLevel) {
            _loc2_ = this.getTopLevelRoot();
            if (_loc2_) {
                this._stage = _loc2_.stage;
                return this._stage;
            }
        }
        return null;
    }

    override public function get width(): Number {
        return this._width;
    }

    override public function get numChildren(): int {
        return this.mx_internal::noTopMostIndex - this.mx_internal::applicationIndex;
    }

    public function get allowDomainsInNewRSLs(): Boolean {
        return this._allowDomainsInNewRSLs;
    }

    public function set allowDomainsInNewRSLs(param1: Boolean): void {
        this._allowDomainsInNewRSLs = param1;
    }

    public function get allowInsecureDomainsInNewRSLs(): Boolean {
        return this._allowInsecureDomainsInNewRSLs;
    }

    public function set allowInsecureDomainsInNewRSLs(param1: Boolean): void {
        this._allowInsecureDomainsInNewRSLs = param1;
    }

    public function get application(): IUIComponent {
        return IUIComponent(this._document);
    }

    mx_internal function get applicationIndex(): int {
        return this._applicationIndex;
    }

    mx_internal function set applicationIndex(param1: int): void {
        this._applicationIndex = param1;
    }

    public function get cursorChildren(): IChildList {
        if (!this.mx_internal::topLevel) {
            return this._topLevelSystemManager.cursorChildren;
        }
        if (!this._cursorChildren) {
            this._cursorChildren = new SystemChildrenList(this, new QName(mx_internal, "toolTipIndex"), new QName(mx_internal, "cursorIndex"));
        }
        return this._cursorChildren;
    }

    mx_internal function get cursorIndex(): int {
        return this._cursorIndex;
    }

    mx_internal function set cursorIndex(param1: int): void {
        var _loc2_: int = param1 - this._cursorIndex;
        this._cursorIndex = param1;
    }

    mx_internal function get densityScale(): Number {
        var _loc1_: Number = NaN;
        var _loc2_: Number = NaN;
        if (isNaN(this._densityScale)) {
            _loc1_ = Number(this.info()["applicationDPI"]);
            _loc2_ = DensityUtil.getRuntimeDPI();
            this._densityScale = DensityUtil.getDPIScale(_loc1_, _loc2_);
            if (isNaN(this._densityScale)) {
                this._densityScale = 1;
            }
        }
        return this._densityScale;
    }

    public function get document(): Object {
        return this._document;
    }

    public function set document(param1: Object): void {
        this._document = param1;
    }

    public function get embeddedFontList(): Object {
        var _loc1_: * = null;
        var _loc2_: * = null;
        var _loc3_: * = null;
        if (this._fontList == null) {
            this._fontList = {};
            _loc1_ = this.info()["fonts"];
            for (_loc2_ in _loc1_) {
                this._fontList[_loc2_] = _loc1_[_loc2_];
            }
            if (!this.mx_internal::topLevel && Boolean(this._topLevelSystemManager)) {
                _loc3_ = this._topLevelSystemManager.embeddedFontList;
                for (_loc2_ in _loc3_) {
                    this._fontList[_loc2_] = _loc3_[_loc2_];
                }
            }
        }
        return this._fontList;
    }

    public function get explicitHeight(): Number {
        return this._explicitHeight;
    }

    public function set explicitHeight(param1: Number): void {
        this._explicitHeight = param1;
    }

    public function get explicitWidth(): Number {
        return this._explicitWidth;
    }

    public function set explicitWidth(param1: Number): void {
        this._explicitWidth = param1;
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
            this._focusPane = null;
        }
    }

    public function get isProxy(): Boolean {
        return false;
    }

    public function get measuredHeight(): Number {
        return !!this.mx_internal::topLevelWindow ? this.mx_internal::topLevelWindow.getExplicitOrMeasuredHeight() : loaderInfo.height;
    }

    public function get measuredWidth(): Number {
        return !!this.mx_internal::topLevelWindow ? this.mx_internal::topLevelWindow.getExplicitOrMeasuredWidth() : loaderInfo.width;
    }

    mx_internal function get noTopMostIndex(): int {
        return this._noTopMostIndex;
    }

    mx_internal function set noTopMostIndex(param1: int): void {
        var _loc2_: int = param1 - this._noTopMostIndex;
        this._noTopMostIndex = param1;
        this.mx_internal::topMostIndex += _loc2_;
    }

    mx_internal final function get $numChildren(): int {
        return super.numChildren;
    }

    public function get numModalWindows(): int {
        return this._numModalWindows;
    }

    public function set numModalWindows(param1: int): void {
        this._numModalWindows = param1;
    }

    public function get preloadedRSLs(): Dictionary {
        return null;
    }

    public function addPreloadedRSL(param1: LoaderInfo, param2: Vector.<RSLData>): void {
        var _loc3_: * = null;
        this.preloadedRSLs[param1] = param2;
        if (hasEventListener(RSLEvent.RSL_ADD_PRELOADED)) {
            _loc3_ = new RSLEvent(RSLEvent.RSL_ADD_PRELOADED);
            _loc3_.loaderInfo = param1;
            dispatchEvent(_loc3_);
        }
    }

    public function get preloaderBackgroundAlpha(): Number {
        return this.info()["backgroundAlpha"];
    }

    public function get preloaderBackgroundColor(): uint {
        var _loc1_: * = this.info()["backgroundColor"];
        if (_loc1_ == undefined) {
            return 4294967295;
        }
        return _loc1_;
    }

    public function get preloaderBackgroundImage(): Object {
        return this.info()["backgroundImage"];
    }

    public function get preloaderBackgroundSize(): String {
        return this.info()["backgroundSize"];
    }

    public function get popUpChildren(): IChildList {
        if (!this.mx_internal::topLevel) {
            return this._topLevelSystemManager.popUpChildren;
        }
        if (!this._popUpChildren) {
            this._popUpChildren = new SystemChildrenList(this, new QName(mx_internal, "noTopMostIndex"), new QName(mx_internal, "topMostIndex"));
        }
        return this._popUpChildren;
    }

    public function get rawChildren(): IChildList {
        if (!this._rawChildren) {
            this._rawChildren = new SystemRawChildrenList(this);
        }
        return this._rawChildren;
    }

    public function get screen(): Rectangle {
        if (!this.mx_internal::_screen) {
            this.Stage_resizeHandler();
        }
        if (!this.mx_internal::isStageRoot) {
            this.Stage_resizeHandler();
        }
        return this.mx_internal::_screen;
    }

    public function get toolTipChildren(): IChildList {
        if (!this.mx_internal::topLevel) {
            return this._topLevelSystemManager.toolTipChildren;
        }
        if (!this._toolTipChildren) {
            this._toolTipChildren = new SystemChildrenList(this, new QName(mx_internal, "topMostIndex"), new QName(mx_internal, "toolTipIndex"));
        }
        return this._toolTipChildren;
    }

    mx_internal function get toolTipIndex(): int {
        return this._toolTipIndex;
    }

    mx_internal function set toolTipIndex(param1: int): void {
        var _loc2_: int = param1 - this._toolTipIndex;
        this._toolTipIndex = param1;
        this.mx_internal::cursorIndex += _loc2_;
    }

    public function get topLevelSystemManager(): ISystemManager {
        if (this.mx_internal::topLevel) {
            return this;
        }
        return this._topLevelSystemManager;
    }

    mx_internal function get topMostIndex(): int {
        return this._topMostIndex;
    }

    mx_internal function set topMostIndex(param1: int): void {
        var _loc2_: int = param1 - this._topMostIndex;
        this._topMostIndex = param1;
        this.mx_internal::toolTipIndex += _loc2_;
    }

    mx_internal final function $addEventListener(param1: String, param2: Function, param3: Boolean = false, param4: int = 0, param5: Boolean = false): void {
        super.addEventListener(param1, param2, param3, param4, param5);
    }

    public function get childAllowsParent(): Boolean {
        try {
            return loaderInfo.childAllowsParent;
        } catch (error: Error) {
            return false;
        }
    }

    public function get parentAllowsChild(): Boolean {
        try {
            return loaderInfo.parentAllowsChild;
        } catch (error: Error) {
            return false;
        }
    }

    override public function addEventListener(param1: String, param2: Function, param3: Boolean = false, param4: int = 0, param5: Boolean = false): void {
        var var_3: DynamicEvent = null;
        var type: String = param1;
        var listener: Function = param2;
        var useCapture: Boolean = param3;
        var priority: int = param4;
        var useWeakReference: Boolean = param5;
        if (type == MouseEvent.MOUSE_MOVE || type == MouseEvent.MOUSE_UP || type == MouseEvent.MOUSE_DOWN || type == Event.ACTIVATE || type == Event.DEACTIVATE) {
            try {
                if (this.stage) {
                    this.stage.addEventListener(type, this.stageEventHandler, false, 0, true);
                }
            } catch (error: SecurityError) {
            }
        }
        if (hasEventListener("addEventListener")) {
            var_3 = new DynamicEvent("addEventListener", false, true);
            var_3.eventType = type;
            var_3.listener = listener;
            var_3.useCapture = useCapture;
            var_3.priority = priority;
            var_3.useWeakReference = useWeakReference;
            if (!dispatchEvent(var_3)) {
                return;
            }
        }
        if (type == SandboxMouseEvent.MOUSE_UP_SOMEWHERE) {
            try {
                if (this.stage) {
                    this.stage.addEventListener(Event.MOUSE_LEAVE, this.mouseLeaveHandler, false, 0, true);
                } else {
                    super.addEventListener(Event.MOUSE_LEAVE, this.mouseLeaveHandler, false, 0, true);
                }
            } catch (error: SecurityError) {
                super.addEventListener(Event.MOUSE_LEAVE, mouseLeaveHandler, false, 0, true);
            }
        }
        if (type == FlexEvent.RENDER || type == FlexEvent.ENTER_FRAME) {
            if (type == FlexEvent.RENDER) {
                type = "null";
            } else {
                type = "null";
            }
            try {
                if (this.stage) {
                    this.stage.addEventListener(type, listener, useCapture, priority, useWeakReference);
                } else {
                    super.addEventListener(type, listener, useCapture, priority, useWeakReference);
                }
            } catch (error: SecurityError) {
                super.addEventListener(type, listener, useCapture, priority, useWeakReference);
            }
            if (Boolean(this.stage) && type == Event.RENDER) {
                this.stage.invalidate();
            }
            return;
        }
        if (type == FlexEvent.IDLE && !this.idleTimer) {
            this.idleTimer = new Timer(IDLE_INTERVAL);
            this.idleTimer.addEventListener(TimerEvent.TIMER, this.idleTimer_timerHandler);
            this.idleTimer.start();
            this.addEventListener(MouseEvent.MOUSE_MOVE, this.mouseMoveHandler, true);
            this.addEventListener(MouseEvent.MOUSE_UP, this.mouseUpHandler, true);
        }
        super.addEventListener(type, listener, useCapture, priority, useWeakReference);
    }

    mx_internal final function $removeEventListener(param1: String, param2: Function, param3: Boolean = false): void {
        super.removeEventListener(param1, param2, param3);
    }

    override public function removeEventListener(param1: String, param2: Function, param3: Boolean = false): void {
        var _loc4_: * = null;
        if (hasEventListener("removeEventListener")) {
            (_loc4_ = new DynamicEvent("removeEventListener", false, true)).eventType = param1;
            _loc4_.listener = param2;
            _loc4_.useCapture = param3;
            if (!dispatchEvent(_loc4_)) {
                return;
            }
        }
        if (param1 == FlexEvent.RENDER || param1 == FlexEvent.ENTER_FRAME) {
            if (param1 == FlexEvent.RENDER) {
                param1 = "null";
            } else {
                param1 = "null";
            }
            try {
                if (this.stage) {
                    this.stage.removeEventListener(param1, param2, param3);
                }
            } catch (error: SecurityError) {
            }
            super.removeEventListener(param1, param2, param3);
            return;
        }
        if (param1 == FlexEvent.IDLE) {
            super.removeEventListener(param1, param2, param3);
            if (!hasEventListener(FlexEvent.IDLE) && Boolean(this.idleTimer)) {
                this.idleTimer.stop();
                this.idleTimer = null;
                this.removeEventListener(MouseEvent.MOUSE_MOVE, this.mouseMoveHandler);
                this.removeEventListener(MouseEvent.MOUSE_UP, this.mouseUpHandler);
            }
        } else {
            super.removeEventListener(param1, param2, param3);
        }
        if (param1 == MouseEvent.MOUSE_MOVE || param1 == MouseEvent.MOUSE_UP || param1 == MouseEvent.MOUSE_DOWN || param1 == Event.ACTIVATE || param1 == Event.DEACTIVATE) {
            if (!hasEventListener(param1)) {
                try {
                    if (this.stage) {
                        this.stage.removeEventListener(param1, this.stageEventHandler, false);
                    }
                } catch (error: SecurityError) {
                }
            }
        }
        if (param1 == SandboxMouseEvent.MOUSE_UP_SOMEWHERE) {
            if (!hasEventListener(SandboxMouseEvent.MOUSE_UP_SOMEWHERE)) {
                try {
                    if (this.stage) {
                        this.stage.removeEventListener(Event.MOUSE_LEAVE, this.mouseLeaveHandler);
                    }
                } catch (error: SecurityError) {
                }
                super.removeEventListener(Event.MOUSE_LEAVE, this.mouseLeaveHandler);
            }
        }
    }

    override public function addChild(param1: DisplayObject): DisplayObject {
        var _loc2_: int = this.numChildren;
        if (param1.parent == this) {
            _loc2_--;
        }
        return this.addChildAt(param1, _loc2_);
    }

    override public function addChildAt(param1: DisplayObject, param2: int): DisplayObject {
        ++this.mx_internal::noTopMostIndex;
        var _loc3_: DisplayObjectContainer = param1.parent;
        if (_loc3_) {
            _loc3_.removeChild(param1);
        }
        return this.mx_internal::rawChildren_addChildAt(param1, this.mx_internal::applicationIndex + param2);
    }

    mx_internal final function $addChildAt(param1: DisplayObject, param2: int): DisplayObject {
        return super.addChildAt(param1, param2);
    }

    mx_internal final function $removeChildAt(param1: int): DisplayObject {
        return super.removeChildAt(param1);
    }

    override public function removeChild(param1: DisplayObject): DisplayObject {
        --this.mx_internal::noTopMostIndex;
        return this.mx_internal::rawChildren_removeChild(param1);
    }

    override public function removeChildAt(param1: int): DisplayObject {
        --this.mx_internal::noTopMostIndex;
        return this.mx_internal::rawChildren_removeChildAt(this.mx_internal::applicationIndex + param1);
    }

    override public function getChildAt(param1: int): DisplayObject {
        return super.getChildAt(this.mx_internal::applicationIndex + param1);
    }

    override public function getChildByName(param1: String): DisplayObject {
        return super.getChildByName(param1);
    }

    override public function getChildIndex(param1: DisplayObject): int {
        return super.getChildIndex(param1) - this.mx_internal::applicationIndex;
    }

    override public function setChildIndex(param1: DisplayObject, param2: int): void {
        super.setChildIndex(param1, this.mx_internal::applicationIndex + param2);
    }

    override public function getObjectsUnderPoint(param1: Point): Array {
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc2_: * = [];
        var _loc3_: int = this.mx_internal::topMostIndex;
        var _loc4_: int = 0;
        while (_loc4_ < _loc3_) {
            if ((_loc5_ = super.getChildAt(_loc4_)) is DisplayObjectContainer) {
                if (_loc6_ = DisplayObjectContainer(_loc5_).getObjectsUnderPoint(param1)) {
                    _loc2_ = _loc2_.concat(_loc6_);
                }
            }
            _loc4_++;
        }
        return _loc2_;
    }

    override public function contains(param1: DisplayObject): Boolean {
        var _loc2_: int = 0;
        var _loc3_: int = 0;
        var _loc4_: * = null;
        if (super.contains(param1)) {
            if (param1.parent == this) {
                _loc2_ = super.getChildIndex(param1);
                if (_loc2_ < this.mx_internal::noTopMostIndex) {
                    return true;
                }
            } else {
                _loc3_ = 0;
                while (_loc3_ < this.mx_internal::noTopMostIndex) {
                    if ((_loc4_ = super.getChildAt(_loc3_)) is IRawChildrenContainer) {
                        if (IRawChildrenContainer(_loc4_).rawChildren.contains(param1)) {
                            return true;
                        }
                    }
                    if (_loc4_ is DisplayObjectContainer) {
                        if (DisplayObjectContainer(_loc4_).contains(param1)) {
                            return true;
                        }
                    }
                    _loc3_++;
                }
            }
        }
        return false;
    }

    public function callInContext(param1: Function, param2: Object, param3: Array, param4: Boolean = true): * {
        return undefined;
    }

    public function create(...rest): Object {
        var _loc4_: * = null;
        var _loc5_: int = 0;
        var _loc6_: int = 0;
        var _loc2_: String = this.info()["mainClassName"];
        if (_loc2_ == null) {
            _loc5_ = (_loc4_ = "null").lastIndexOf(".");
            _loc6_ = _loc4_.lastIndexOf("/");
            _loc2_ = _loc4_.substring(_loc6_ + 1, _loc5_);
        }
        var _loc3_: Class = Class(this.getDefinitionByName(_loc2_));
        return !!_loc3_ ? new _loc3_() : null;
    }

    public function info(): Object {
        return {};
    }

    mx_internal function initialize(): void {
        var _loc7_: int = 0;
        var _loc8_: int = 0;
        var _loc12_: * = null;
        var _loc13_: * = null;
        var _loc14_: * = null;
        var _loc15_: * = null;
        var _loc16_: * = null;
        var _loc1_: Class = this.info()["runtimeDPIProvider"] as Class;
        if (_loc1_) {
            Singleton.registerClass("mx.core::RuntimeDPIProvider", _loc1_);
        }
        if (this.mx_internal::isStageRoot) {
            this.Stage_resizeHandler();
        } else {
            this._width = loaderInfo.width;
            this._height = loaderInfo.height;
        }
        this.mx_internal::preloader = new Preloader();
        this.mx_internal::preloader.addEventListener(FlexEvent.PRELOADER_DOC_FRAME_READY, this.preloader_preloaderDocFrameReadyHandler);
        this.mx_internal::preloader.addEventListener(Event.COMPLETE, this.mx_internal::preloader_completeHandler);
        this.mx_internal::preloader.addEventListener(FlexEvent.PRELOADER_DONE, this.preloader_preloaderDoneHandler);
        this.mx_internal::preloader.addEventListener(RSLEvent.RSL_COMPLETE, this.preloader_rslCompleteHandler);
        if (!this._popUpChildren) {
            this._popUpChildren = new SystemChildrenList(this, new QName(mx_internal, "noTopMostIndex"), new QName(mx_internal, "topMostIndex"));
        }
        this._popUpChildren.addChild(this.mx_internal::preloader);
        var _loc2_: Array = this.info()["rsls"];
        var _loc3_: Array = this.info()["cdRsls"];
        var _loc4_: Boolean = true;
        if (this.info()["usePreloader"] != undefined) {
            _loc4_ = Boolean(this.info()["usePreloader"]);
        }
        var _loc5_: Class = this.info()["preloader"] as Class;
        var _loc6_: * = [];
        if (Boolean(_loc3_) && _loc3_.length > 0) {
            if (this.isTopLevel()) {
                this.rslDataList = _loc3_;
            } else {
                this.rslDataList = LoaderUtil.mx_internal::processRequiredRSLs(this, _loc3_);
            }
            _loc12_ = LoaderUtil.normalizeURL(this.loaderInfo);
            _loc13_ = Class(this.getDefinitionByName("mx.core::CrossDomainRSLItem"));
            _loc7_ = this.rslDataList.length;
            _loc8_ = 0;
            while (_loc8_ < _loc7_) {
                _loc14_ = this.rslDataList[_loc8_];
                _loc15_ = new _loc13_(_loc14_, _loc12_, this);
                _loc6_.push(_loc15_);
                _loc8_++;
            }
        }
        if (_loc2_ != null && _loc2_.length > 0) {
            if (this.rslDataList == null) {
                this.rslDataList = [];
            }
            if (_loc12_ == null) {
                _loc12_ = LoaderUtil.normalizeURL(this.loaderInfo);
            }
            _loc7_ = _loc2_.length;
            _loc8_ = 0;
            while (_loc8_ < _loc7_) {
                _loc16_ = new RSLItem(_loc2_[_loc8_].url, _loc12_, this);
                _loc6_.push(_loc16_);
                this.rslDataList.push([new RSLData(_loc2_[_loc8_].url, null, null, null, false, false, "current")]);
                _loc8_++;
            }
        }
        var _loc9_: String;
        var _loc10_: Array = !!(_loc9_ = loaderInfo.parameters["resourceModuleURLs"]) ? _loc9_.split(",") : null;
        var _loc11_: ApplicationDomain = !this.mx_internal::topLevel && this.parent is Loader ? Loader(this.parent).contentLoaderInfo.applicationDomain : this.info()["currentDomain"] as ApplicationDomain;
        this.mx_internal::preloader.initialize(_loc4_, _loc5_, this.preloaderBackgroundColor, this.preloaderBackgroundAlpha, this.preloaderBackgroundImage, this.preloaderBackgroundSize, this.mx_internal::isStageRoot ? this.stage.stageWidth : loaderInfo.width, this.mx_internal::isStageRoot ? this.stage.stageHeight : loaderInfo.height, null, null, _loc6_, _loc10_, _loc11_);
    }

    mx_internal function rawChildren_addChild(param1: DisplayObject): DisplayObject {
        this.mx_internal::childManager.addingChild(param1);
        super.addChild(param1);
        this.mx_internal::childManager.childAdded(param1);
        return param1;
    }

    mx_internal function rawChildren_addChildAt(param1: DisplayObject, param2: int): DisplayObject {
        if (this.mx_internal::childManager) {
            this.mx_internal::childManager.addingChild(param1);
        }
        super.addChildAt(param1, param2);
        if (this.mx_internal::childManager) {
            this.mx_internal::childManager.childAdded(param1);
        }
        return param1;
    }

    mx_internal function rawChildren_removeChild(param1: DisplayObject): DisplayObject {
        this.mx_internal::childManager.removingChild(param1);
        super.removeChild(param1);
        this.mx_internal::childManager.childRemoved(param1);
        return param1;
    }

    mx_internal function rawChildren_removeChildAt(param1: int): DisplayObject {
        var _loc2_: DisplayObject = super.getChildAt(param1);
        this.mx_internal::childManager.removingChild(_loc2_);
        super.removeChildAt(param1);
        this.mx_internal::childManager.childRemoved(_loc2_);
        return _loc2_;
    }

    mx_internal function rawChildren_getChildAt(param1: int): DisplayObject {
        return super.getChildAt(param1);
    }

    mx_internal function rawChildren_getChildByName(param1: String): DisplayObject {
        return super.getChildByName(param1);
    }

    mx_internal function rawChildren_getChildIndex(param1: DisplayObject): int {
        return super.getChildIndex(param1);
    }

    mx_internal function rawChildren_setChildIndex(param1: DisplayObject, param2: int): void {
        super.setChildIndex(param1, param2);
    }

    mx_internal function rawChildren_getObjectsUnderPoint(param1: Point): Array {
        return super.getObjectsUnderPoint(param1);
    }

    mx_internal function rawChildren_contains(param1: DisplayObject): Boolean {
        return super.contains(param1);
    }

    public function allowDomain(...rest): void {
    }

    public function allowInsecureDomain(...rest): void {
    }

    public function getExplicitOrMeasuredWidth(): Number {
        return !isNaN(this.explicitWidth) ? this.explicitWidth : this.measuredWidth;
    }

    public function getExplicitOrMeasuredHeight(): Number {
        return !isNaN(this.explicitHeight) ? this.explicitHeight : this.measuredHeight;
    }

    public function move(param1: Number, param2: Number): void {
    }

    public function setActualSize(param1: Number, param2: Number): void {
        if (this.mx_internal::isStageRoot) {
            return;
        }
        if (this.mouseCatcher) {
            this.mouseCatcher.width = param1;
            this.mouseCatcher.height = param2;
        }
        if (this._width != param1 || this._height != param2) {
            this._width = param1;
            this._height = param2;
            dispatchEvent(new Event(Event.RESIZE));
        }
    }

    public function getDefinitionByName(param1: String): Object {
        var _loc3_: * = null;
        var _loc2_: ApplicationDomain = !this.mx_internal::topLevel && this.parent is Loader ? Loader(this.parent).contentLoaderInfo.applicationDomain : this.info()["currentDomain"] as ApplicationDomain;
        if (_loc2_.hasDefinition(param1)) {
            _loc3_ = _loc2_.getDefinition(param1);
        }
        return _loc3_;
    }

    public function isTopLevel(): Boolean {
        return this.mx_internal::topLevel;
    }

    public function isTopLevelRoot(): Boolean {
        return this.mx_internal::isStageRoot || this.mx_internal::isBootstrapRoot;
    }

    public function isTopLevelWindow(param1: DisplayObject): Boolean {
        return param1 is IUIComponent && IUIComponent(param1) == this.mx_internal::topLevelWindow;
    }

    public function isFontFaceEmbedded(param1: TextFormat): Boolean {
        var _loc9_: * = null;
        var _loc10_: * = null;
        var _loc2_: String = param1.font;
        var _loc3_: Boolean = Boolean(param1.bold);
        var _loc4_: Boolean = Boolean(param1.italic);
        var _loc5_: Array;
        var _loc6_: int = (_loc5_ = Font.enumerateFonts()).length;
        var _loc7_: int = 0;
        while (_loc7_ < _loc6_) {
            if ((_loc9_ = Font(_loc5_[_loc7_])).fontName == _loc2_) {
                _loc10_ = "regular";
                if (_loc3_ && _loc4_) {
                    _loc10_ = "boldItalic";
                } else if (_loc3_) {
                    _loc10_ = "bold";
                } else if (_loc4_) {
                    _loc10_ = "italic";
                }
                if (_loc9_.fontStyle == _loc10_) {
                    return true;
                }
            }
            _loc7_++;
        }
        if (!_loc2_ || !this.embeddedFontList || !this.embeddedFontList[_loc2_]) {
            return false;
        }
        var _loc8_: Object = this.embeddedFontList[_loc2_];
        return !(_loc3_ && !_loc8_.bold || _loc4_ && !_loc8_.italic || !_loc3_ && !_loc4_ && !_loc8_.regular);
    }

    private function resizeMouseCatcher(): void {
        var _loc1_: * = null;
        var _loc2_: * = null;
        if (this.mouseCatcher) {
            try {
                _loc1_ = this.mouseCatcher.graphics;
                _loc2_ = this.screen;
                _loc1_.clear();
                _loc1_.beginFill(0, 0);
                _loc1_.drawRect(0, 0, _loc2_.width, _loc2_.height);
                _loc1_.endFill();
            } catch (e: SecurityError) {
            }
        }
    }

    private function initHandler(param1: Event): void {
        if (!this.mx_internal::isStageRoot) {
            if (root.loaderInfo.parentAllowsChild) {
                try {
                    if (!this.parent.dispatchEvent(new Event("mx.managers.SystemManager.isBootstrapRoot", false, true)) || !root.loaderInfo.sharedEvents.hasEventListener("bridgeNewApplication")) {
                        this.mx_internal::isBootstrapRoot = true;
                    }
                } catch (e: Error) {
                }
            }
        }
        mx_internal::allSystemManagers[this] = this.loaderInfo.url;
        root.loaderInfo.removeEventListener(Event.INIT, this.initHandler);
        if (true) {
            SystemManagerGlobals.info = this.info();
        }
        if (true) {
            SystemManagerGlobals.parameters = loaderInfo.parameters;
        }
        var _loc2_: int = totalFrames == 1 ? 0 : 1;
        this.addEventListener(Event.ENTER_FRAME, this.docFrameListener);
        this.mx_internal::initialize();
    }

    private function docFrameListener(param1: Event): void {
        if (currentFrame == 2) {
            this.removeEventListener(Event.ENTER_FRAME, this.docFrameListener);
            if (totalFrames > 2) {
                this.addEventListener(Event.ENTER_FRAME, this.extraFrameListener);
            }
            this.mx_internal::docFrameHandler();
        }
    }

    private function extraFrameListener(param1: Event): void {
        if (this.lastFrame == currentFrame) {
            return;
        }
        this.lastFrame = currentFrame;
        if (currentFrame + 1 > totalFrames) {
            this.removeEventListener(Event.ENTER_FRAME, this.extraFrameListener);
        }
        this.extraFrameHandler();
    }

    private function preloader_preloaderDocFrameReadyHandler(param1: Event): void {
        this.mx_internal::preloader.removeEventListener(FlexEvent.PRELOADER_DOC_FRAME_READY, this.preloader_preloaderDocFrameReadyHandler);
        this.deferredNextFrame();
    }

    private function preloader_preloaderDoneHandler(param1: Event): void {
        var _loc2_: IUIComponent = this.mx_internal::topLevelWindow;
        this.mx_internal::preloader.removeEventListener(FlexEvent.PRELOADER_DONE, this.preloader_preloaderDoneHandler);
        this.mx_internal::preloader.removeEventListener(RSLEvent.RSL_COMPLETE, this.preloader_rslCompleteHandler);
        this._popUpChildren.removeChild(this.mx_internal::preloader);
        this.mx_internal::preloader = null;
        this.mouseCatcher = new FlexSprite();
        this.mouseCatcher.name = "mouseCatcher";
        ++this.mx_internal::noTopMostIndex;
        super.addChildAt(this.mouseCatcher, 0);
        this.resizeMouseCatcher();
        if (!this.mx_internal::topLevel) {
            this.mouseCatcher.visible = false;
            mask = this.mouseCatcher;
        }
        ++this.mx_internal::noTopMostIndex;
        super.addChildAt(DisplayObject(_loc2_), 1);
        _loc2_.dispatchEvent(new FlexEvent(FlexEvent.APPLICATION_COMPLETE));
        dispatchEvent(new FlexEvent(FlexEvent.APPLICATION_COMPLETE));
    }

    private function preloader_rslCompleteHandler(param1: RSLEvent): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        if (!param1.isResourceModule && Boolean(param1.loaderInfo)) {
            _loc2_ = Vector.<RSLData>(this.rslDataList[param1.rslIndex]);
            _loc3_ = {};
            if (Boolean(_loc2_) && Boolean(_loc2_[0].moduleFactory)) {
                _loc3_ = _loc2_[0].moduleFactory;
            }
            if (_loc3_ == this) {
                this.preloadedRSLs[param1.loaderInfo] = _loc2_;
            } else {
                _loc3_.addPreloadedRSL(param1.loaderInfo, _loc2_);
            }
        }
    }

    mx_internal function docFrameHandler(param1: Event = null): void {
        if (this.readyForKickOff) {
            this.mx_internal::kickOff();
        }
    }

    mx_internal function preloader_completeHandler(param1: Event): void {
        this.mx_internal::preloader.removeEventListener(Event.COMPLETE, this.mx_internal::preloader_completeHandler);
        this.readyForKickOff = true;
        if (currentFrame >= 2) {
            this.mx_internal::kickOff();
        }
    }

    mx_internal function kickOff(): void {
        var _loc5_: int = 0;
        var _loc6_: int = 0;
        var _loc7_: * = null;
        if (this.document) {
            return;
        }
        if (!this.isTopLevel()) {
            SystemManagerGlobals.topLevelSystemManagers[0].dispatchEvent(new FocusEvent(FlexEvent.NEW_CHILD_APPLICATION, false, false, this));
        }
        Singleton.registerClass("mx.core::IEmbeddedFontRegistry", Class(this.getDefinitionByName("mx.core::EmbeddedFontRegistry")));
        Singleton.registerClass("mx.styles::IStyleManager", Class(this.getDefinitionByName("mx.styles::StyleManagerImpl")));
        Singleton.registerClass("mx.styles::IStyleManager2", Class(this.getDefinitionByName("mx.styles::StyleManagerImpl")));
        Singleton.registerClass("mx.managers::IBrowserManager", Class(this.getDefinitionByName("mx.managers::BrowserManagerImpl")));
        Singleton.registerClass("mx.managers::ICursorManager", Class(this.getDefinitionByName("mx.managers::CursorManagerImpl")));
        Singleton.registerClass("mx.managers::IHistoryManager", Class(this.getDefinitionByName("mx.managers::HistoryManagerImpl")));
        Singleton.registerClass("mx.managers::ILayoutManager", Class(this.getDefinitionByName("mx.managers::LayoutManager")));
        Singleton.registerClass("mx.managers::IPopUpManager", Class(this.getDefinitionByName("mx.managers::PopUpManagerImpl")));
        Singleton.registerClass("mx.managers::IToolTipManager2", Class(this.getDefinitionByName("mx.managers::ToolTipManagerImpl")));
        var _loc1_: * = null;
        var _loc2_: Object = this.info()["useNativeDragManager"];
        var _loc3_: Boolean = _loc2_ == null ? true : String(_loc2_) == "true";
        if (_loc3_) {
            _loc1_ = Class(this.getDefinitionByName("mx.managers::NativeDragManagerImpl"));
        }
        if (_loc1_ == null) {
            _loc1_ = Class(this.getDefinitionByName("mx.managers::DragManagerImpl"));
        }
        Singleton.registerClass("mx.managers::IDragManager", _loc1_);
        Singleton.registerClass("mx.core::ITextFieldFactory", Class(this.getDefinitionByName("mx.core::TextFieldFactory")));
        var _loc4_: Array;
        if ((Boolean(_loc4_ = this.info()["mixins"])) && _loc4_.length > 0) {
            _loc5_ = _loc4_.length;
            _loc6_ = 0;
            while (_loc6_ < _loc5_) {
                (_loc7_ = Class(this.getDefinitionByName(_loc4_[_loc6_])))["init"](this);
                _loc6_++;
            }
        }
        if (_loc7_ = Singleton.getClass("mx.managers::IActiveWindowManager")) {
            this.registerImplementation("mx.managers::IActiveWindowManager", new _loc7_(this));
        }
        if (_loc7_ = Singleton.getClass("mx.managers::IMarshalSystemManager")) {
            this.registerImplementation("mx.managers::IMarshalSystemManager", new _loc7_(this));
        }
        this.initializeTopLevelWindow(null);
        this.deferredNextFrame();
    }

    private function keyDownHandler(param1: KeyboardEvent): void {
        var _loc2_: * = null;
        if (!param1.cancelable) {
            switch (param1.keyCode) {
                case Keyboard.UP:
                case Keyboard.DOWN:
                case Keyboard.PAGE_UP:
                case Keyboard.PAGE_DOWN:
                case Keyboard.HOME:
                case Keyboard.END:
                case Keyboard.LEFT:
                case Keyboard.RIGHT:
                case Keyboard.ENTER:
                    param1.stopImmediatePropagation();
                    _loc2_ = new KeyboardEvent(param1.type, param1.bubbles, true, param1.charCode, param1.keyCode, param1.keyLocation, param1.ctrlKey, param1.altKey, param1.shiftKey);
                    param1.target.dispatchEvent(_loc2_);
            }
        }
    }

    private function mouseEventHandler(param1: MouseEvent): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        if (!param1.cancelable && param1.eventPhase != EventPhase.BUBBLING_PHASE) {
            param1.stopImmediatePropagation();
            _loc2_ = null;
            if ("clickCount" in param1) {
                _loc3_ = MouseEvent;
                _loc2_ = new _loc3_(param1.type, param1.bubbles, true, param1.localX, param1.localY, param1.relatedObject, param1.ctrlKey, param1.altKey, param1.shiftKey, param1.buttonDown, param1.delta, param1["commandKey"], param1["controlKey"], param1["clickCount"]);
            } else {
                _loc2_ = new MouseEvent(param1.type, param1.bubbles, true, param1.localX, param1.localY, param1.relatedObject, param1.ctrlKey, param1.altKey, param1.shiftKey, param1.buttonDown, param1.delta);
            }
            param1.target.dispatchEvent(_loc2_);
        }
    }

    private function extraFrameHandler(param1: Event = null): void {
        var _loc3_: * = null;
        var _loc2_: Object = this.info()["frames"];
        if (Boolean(_loc2_) && Boolean(_loc2_[currentLabel])) {
            _loc3_ = Class(this.getDefinitionByName(_loc2_[currentLabel]));
            _loc3_["frame"](this);
        }
        this.deferredNextFrame();
    }

    private function nextFrameTimerHandler(param1: TimerEvent): void {
        if (currentFrame + 1 <= framesLoaded) {
            nextFrame();
            this.nextFrameTimer.removeEventListener(TimerEvent.TIMER, this.nextFrameTimerHandler);
            this.nextFrameTimer.reset();
        }
    }

    private function initializeTopLevelWindow(param1: Event): void {
        var _loc2_: Number = NaN;
        var _loc3_: Number = NaN;
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: * = null;
        if (this.getSandboxRoot() == this) {
            this.addEventListener(KeyboardEvent.KEY_DOWN, this.keyDownHandler, true, 1000);
            this.addEventListener(MouseEvent.MOUSE_WHEEL, this.mouseEventHandler, true, 1000);
            this.addEventListener(MouseEvent.MOUSE_DOWN, this.mouseEventHandler, true, 1000);
        }
        if (this.isTopLevelRoot() && Boolean(this.stage)) {
            this.stage.addEventListener(KeyboardEvent.KEY_DOWN, this.keyDownHandler, false, 1000);
            this.stage.addEventListener(MouseEvent.MOUSE_WHEEL, this.mouseEventHandler, false, 1000);
            this.stage.addEventListener(MouseEvent.MOUSE_DOWN, this.mouseEventHandler, false, 1000);
        }
        if (!this.parent && this.parentAllowsChild) {
            return;
        }
        if (!this.mx_internal::topLevel) {
            if (!this.parent) {
                return;
            }
            if (!(_loc4_ = this.parent.parent)) {
                return;
            }
            while (_loc4_) {
                if (_loc4_ is IUIComponent) {
                    if ((Boolean(_loc5_ = IUIComponent(_loc4_).systemManager)) && !_loc5_.isTopLevel()) {
                        _loc5_ = _loc5_.topLevelSystemManager;
                    }
                    this._topLevelSystemManager = _loc5_;
                    break;
                }
                _loc4_ = _loc4_.parent;
            }
        }
        if (this.isTopLevelRoot() && Boolean(this.stage)) {
            this.stage.addEventListener(Event.RESIZE, this.Stage_resizeHandler, false, 0, true);
        } else if (this.mx_internal::topLevel && Boolean(this.stage)) {
            if ((_loc6_ = this.getSandboxRoot()) != this) {
                _loc6_.addEventListener(Event.RESIZE, this.Stage_resizeHandler, false, 0, true);
            }
        }
        if (this.mx_internal::isStageRoot && Boolean(this.stage)) {
            this.Stage_resizeHandler();
            if (this._width == 0 && this._height == 0 && loaderInfo.width != this._width && loaderInfo.height != this._height) {
                this._width = loaderInfo.width;
                this._height = loaderInfo.height;
            }
            _loc2_ = this._width;
            _loc3_ = this._height;
        } else {
            _loc2_ = 0;
            _loc3_ = 0;
        }
        this.mx_internal::childManager.initializeTopLevelWindow(_loc2_, _loc3_);
    }

    private function appCreationCompleteHandler(param1: FlexEvent): void {
        this.invalidateParentSizeAndDisplayList();
    }

    public function invalidateParentSizeAndDisplayList(): void {
        var _loc1_: * = null;
        if (!this.mx_internal::topLevel && Boolean(this.parent)) {
            _loc1_ = this.parent.parent;
            while (_loc1_) {
                if (_loc1_ is IInvalidating) {
                    IInvalidating(_loc1_).invalidateSize();
                    IInvalidating(_loc1_).invalidateDisplayList();
                    return;
                }
                _loc1_ = _loc1_.parent;
            }
        }
        dispatchEvent(new Event("invalidateParentSizeAndDisplayList"));
    }

    private function Stage_resizeHandler(param1: Event = null): void {
        var w: Number;
        var h: Number;
        var align: String;
        var x: Number;
        var y: Number;
        var m: Number = NaN;
        var n: Number = NaN;
        var scale: Number = NaN;
        var var_6: Event = param1;
        if (this.isDispatchingResizeEvent) {
            return;
        }
        w = 0;
        h = 0;
        try {
            m = 0;
            n = 0;
        } catch (error: Error) {
            if (!mx_internal::_screen) {
                mx_internal::_screen = new Rectangle();
            }
            return;
        }
        align = "null";
        try {
            if (this.stage) {
                w = this.stage.stageWidth;
                h = this.stage.stageHeight;
                align = this.stage.align;
            }
        } catch (error: SecurityError) {
            if (hasEventListener("getScreen")) {
                dispatchEvent(new Event("getScreen"));
                if (mx_internal::_screen) {
                    w = 0;
                    h = 0;
                }
            }
        }
        x = (m - w) / 2;
        y = (n - h) / 2;
        if (align == StageAlign.TOP) {
            y = 0;
        } else if (align == StageAlign.BOTTOM) {
            y = n - h;
        } else if (align == StageAlign.LEFT) {
            x = 0;
        } else if (align == StageAlign.RIGHT) {
            x = m - w;
        } else if (align == StageAlign.TOP_LEFT || align == "LT") {
            y = 0;
            x = 0;
        } else if (align == StageAlign.TOP_RIGHT) {
            y = 0;
            x = m - w;
        } else if (align == StageAlign.BOTTOM_LEFT) {
            y = n - h;
            x = 0;
        } else if (align == StageAlign.BOTTOM_RIGHT) {
            y = n - h;
            x = m - w;
        }
        if (!this.mx_internal::_screen) {
            this.mx_internal::_screen = new Rectangle();
        }
        this.mx_internal::_screen.x = x;
        this.mx_internal::_screen.y = y;
        this.mx_internal::_screen.width = w;
        this.mx_internal::_screen.height = h;
        if (this.mx_internal::isStageRoot) {
            scale = this.mx_internal::densityScale;
            root.scaleX = root.scaleY = scale;
            this._width = this.stage.stageWidth / scale;
            this._height = this.stage.stageHeight / scale;
            this.mx_internal::_screen.x /= scale;
            this.mx_internal::_screen.y /= scale;
            this.mx_internal::_screen.width /= scale;
            this.mx_internal::_screen.height /= scale;
        }
        if (var_6) {
            this.resizeMouseCatcher();
            this.isDispatchingResizeEvent = true;
            dispatchEvent(var_6);
            this.isDispatchingResizeEvent = false;
        }
    }

    private function mouseMoveHandler(param1: MouseEvent): void {
        this.mx_internal::idleCounter = 0;
    }

    private function mouseUpHandler(param1: MouseEvent): void {
        this.mx_internal::idleCounter = 0;
    }

    private function idleTimer_timerHandler(param1: TimerEvent): void {
        ++this.mx_internal::idleCounter;
        if (this.mx_internal::idleCounter * IDLE_INTERVAL > IDLE_THRESHOLD) {
            dispatchEvent(new FlexEvent(FlexEvent.IDLE));
        }
    }

    override public function get mouseX(): Number {
        if (this.mx_internal::_mouseX === undefined) {
            return super.mouseX;
        }
        return this.mx_internal::_mouseX;
    }

    override public function get mouseY(): Number {
        if (this.mx_internal::_mouseY === undefined) {
            return super.mouseY;
        }
        return this.mx_internal::_mouseY;
    }

    private function getTopLevelSystemManager(param1: DisplayObject): ISystemManager {
        var _loc3_: * = null;
        var _loc2_: DisplayObjectContainer = DisplayObjectContainer(param1.root);
        if ((!_loc2_ || _loc2_ is Stage) && param1 is IUIComponent) {
            _loc2_ = DisplayObjectContainer(IUIComponent(param1).systemManager);
        }
        if (_loc2_ is ISystemManager) {
            _loc3_ = ISystemManager(_loc2_);
            if (!_loc3_.isTopLevel()) {
                _loc3_ = _loc3_.topLevelSystemManager;
            }
        }
        return _loc3_;
    }

    override public function get parent(): DisplayObjectContainer {
        try {
            return super.parent;
        } catch (e: SecurityError) {
            return null;
        }
    }

    public function getTopLevelRoot(): DisplayObject {
        var _loc1_: * = null;
        var _loc2_: * = null;
        var _loc3_: * = null;
        try {
            _loc1_ = {};
            if (_loc1_.topLevelSystemManager) {
                _loc1_ = _loc1_.topLevelSystemManager;
            }
            _loc2_ = DisplayObject(_loc1_).parent;
            _loc3_ = DisplayObject(_loc1_);
            while (_loc2_) {
                if (_loc2_ is Stage) {
                    return _loc3_;
                }
                _loc3_ = _loc2_;
                _loc2_ = _loc2_.parent;
            }
        } catch (error: SecurityError) {
        }
        return null;
    }

    public function getSandboxRoot(): DisplayObject {
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc1_: * = {};
        try {
            if (_loc1_.topLevelSystemManager) {
                _loc1_ = _loc1_.topLevelSystemManager;
            }
            _loc2_ = DisplayObject(_loc1_).parent;
            if (_loc2_ is Stage) {
                return DisplayObject(_loc1_);
            }
            if (Boolean(_loc2_) && !_loc2_.dispatchEvent(new Event("mx.managers.SystemManager.isBootstrapRoot", false, true))) {
                return this;
            }
            _loc3_ = {};
            while (_loc2_) {
                if (_loc2_ is Stage) {
                    return _loc3_;
                }
                if (!_loc2_.dispatchEvent(new Event("mx.managers.SystemManager.isBootstrapRoot", false, true))) {
                    return _loc3_;
                }
                if (_loc2_ is Loader) {
                    if (!(_loc5_ = (_loc4_ = Loader(_loc2_)).contentLoaderInfo).childAllowsParent) {
                        return _loc5_.content;
                    }
                }
                if (_loc2_.hasEventListener("systemManagerRequest")) {
                    _loc3_ = _loc2_;
                }
                _loc2_ = _loc2_.parent;
            }
        } catch (error: Error) {
        }
        return _loc3_ != null ? _loc3_ : DisplayObject(_loc1_);
    }

    public function registerImplementation(param1: String, param2: Object): void {
        var _loc3_: Object = this.implMap[param1];
        if (!_loc3_) {
            this.implMap[param1] = param2;
        }
    }

    public function getImplementation(param1: String): Object {
        return this.implMap[param1];
    }

    public function getVisibleApplicationRect(param1: Rectangle = null, param2: Boolean = false): Rectangle {
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc9_: * = null;
        if (hasEventListener("getVisibleApplicationRect")) {
            _loc3_ = new Request("getVisibleApplicationRect", false, true);
            _loc3_.value = {
                "bounds": param1,
                "skipToSandboxRoot": param2
            };
            if (!dispatchEvent(_loc3_)) {
                return Rectangle(_loc3_.value);
            }
        }
        if (param2 && !this.mx_internal::topLevel) {
            return this.topLevelSystemManager.getVisibleApplicationRect(param1, param2);
        }
        if (!param1) {
            param1 = getBounds(DisplayObject(this));
            _loc4_ = this.getSandboxRoot();
            (_loc5_ = this.screen.clone()).topLeft = _loc4_.localToGlobal(this.screen.topLeft);
            _loc5_.bottomRight = _loc4_.localToGlobal(this.screen.bottomRight);
            _loc6_ = new Point(Math.max(0, param1.x), Math.max(0, param1.y));
            _loc6_ = localToGlobal(_loc6_);
            param1.x = _loc6_.x;
            param1.y = _loc6_.y;
            param1.width = _loc5_.width;
            param1.height = _loc5_.height;
            _loc7_ = this.stage.softKeyboardRect;
            param1.height -= _loc7_.height;
        }
        if (!this.mx_internal::topLevel) {
            _loc8_ = this.parent.parent;
            if ("getVisibleApplicationRect" in _loc8_) {
                _loc9_ = _loc8_["getVisibleApplicationRect"](true);
                param1 = param1.intersection(_loc9_);
            }
        }
        return param1;
    }

    public function deployMouseShields(param1: Boolean): void {
        var _loc2_: * = null;
        if (hasEventListener("deployMouseShields")) {
            _loc2_ = new DynamicEvent("deployMouseShields");
            _loc2_.deploy = param1;
            dispatchEvent(_loc2_);
        }
    }

    private function stageEventHandler(param1: Event): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: * = null;
        if (param1.target is Stage && Boolean(this.mouseCatcher)) {
            if (param1 is MouseEvent) {
                _loc2_ = MouseEvent(param1);
                _loc3_ = new Point(_loc2_.stageX, _loc2_.stageY);
                _loc4_ = this.mouseCatcher.globalToLocal(_loc3_);
                _loc2_.localX = _loc4_.x;
                _loc2_.localY = _loc4_.y;
            }
            this.mouseCatcher.dispatchEvent(param1);
        }
    }

    private function mouseLeaveHandler(param1: Event): void {
        dispatchEvent(new SandboxMouseEvent(SandboxMouseEvent.MOUSE_UP_SOMEWHERE));
    }
}
}
