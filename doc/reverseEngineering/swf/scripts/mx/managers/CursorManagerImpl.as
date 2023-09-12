package mx.managers {

import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.InteractiveObject;
import flash.display.Sprite;
import flash.events.ContextMenuEvent;
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import flash.events.IOErrorEvent;
import flash.events.MouseEvent;
import flash.events.ProgressEvent;
import flash.geom.Point;
import flash.text.TextField;
import flash.text.TextFieldType;
import flash.ui.Mouse;

import mx.core.EventPriority;
import mx.core.FlexGlobals;
import mx.core.FlexSprite;
import mx.core.IFlexModuleFactory;
import mx.core.ISystemCursorClient;
import mx.core.mx_internal;
import mx.events.Request;
import mx.styles.CSSStyleDeclaration;
import mx.styles.StyleManager;

public class CursorManagerImpl extends EventDispatcher implements ICursorManager {

    mx_internal static const VERSION: String = "4.6.0.23201";

    private static var instance: ICursorManager;

    public static var mixins: Array;


    private var nextCursorID: int = 1;

    private var cursorList: Array;

    private var busyCursorList: Array;

    mx_internal var initialized: Boolean = false;

    mx_internal var cursorHolder: Sprite;

    private var currentCursor: DisplayObject;

    private var listenForContextMenu: Boolean = false;

    private var overTextField: Boolean = false;

    private var overLink: Boolean = false;

    private var showSystemCursor: Boolean = false;

    private var showCustomCursor: Boolean = false;

    private var customCursorLeftStage: Boolean = false;

    mx_internal var systemManager: ISystemManager = null;

    mx_internal var sandboxRoot: IEventDispatcher = null;

    private var sourceArray: Array;

    mx_internal var _currentCursorID: int = 0;

    mx_internal var _currentCursorXOffset: Number = 0;

    mx_internal var _currentCursorYOffset: Number = 0;

    public function CursorManagerImpl(param1: ISystemManager = null) {
        var _loc2_: int = 0;
        var _loc3_: int = 0;
        this.cursorList = [];
        this.busyCursorList = [];
        this.sourceArray = [];
        super();
        if (Boolean(instance) && !param1) {
            throw new Error("Instance already exists.");
        }
        if (param1) {
            this.mx_internal::systemManager = param1 as ISystemManager;
        } else {
            this.mx_internal::systemManager = SystemManagerGlobals.topLevelSystemManagers[0] as ISystemManager;
        }
        if (mixins) {
            _loc2_ = 0;
            _loc3_ = 0;
            while (_loc3_ < _loc2_) {
                new mixins[_loc3_](this);
                _loc3_++;
            }
        }
    }

    public static function getInstance(): ICursorManager {
        if (!instance) {
            instance = new CursorManagerImpl();
        }
        return instance;
    }

    public function get currentCursorID(): int {
        return this.mx_internal::_currentCursorID;
    }

    public function set currentCursorID(param1: int): void {
        this.mx_internal::_currentCursorID = param1;
        if (hasEventListener("currentCursorID")) {
            dispatchEvent(new Event("currentCursorID"));
        }
    }

    public function get currentCursorXOffset(): Number {
        return this.mx_internal::_currentCursorXOffset;
    }

    public function set currentCursorXOffset(param1: Number): void {
        this.mx_internal::_currentCursorXOffset = param1;
        if (hasEventListener("currentCursorXOffset")) {
            dispatchEvent(new Event("currentCursorXOffset"));
        }
    }

    public function get currentCursorYOffset(): Number {
        return this.mx_internal::_currentCursorYOffset;
    }

    public function set currentCursorYOffset(param1: Number): void {
        this.mx_internal::_currentCursorYOffset = param1;
        if (hasEventListener("currentCursorYOffset")) {
            dispatchEvent(new Event("currentCursorYOffset"));
        }
    }

    public function showCursor(): void {
        if (this.mx_internal::cursorHolder) {
            this.mx_internal::cursorHolder.visible = true;
        }
        if (hasEventListener("showCursor")) {
            dispatchEvent(new Event("showCursor"));
        }
    }

    public function hideCursor(): void {
        if (this.mx_internal::cursorHolder) {
            this.mx_internal::cursorHolder.visible = false;
        }
        if (hasEventListener("hideCursor")) {
            dispatchEvent(new Event("hideCursor"));
        }
    }

    public function setCursor(param1: Class, param2: int = 2, param3: Number = 0, param4: Number = 0): int {
        var _loc7_: * = null;
        if (hasEventListener("setCursor")) {
            (_loc7_ = new Request("setCursor", false, true)).value = [param1, param2, param3, param4];
            if (!dispatchEvent(_loc7_)) {
                return _loc7_.value as int;
            }
        }
        var _loc5_: int = this.nextCursorID++;
        var _loc6_: CursorQueueItem;
        (_loc6_ = new CursorQueueItem()).cursorID = _loc5_;
        _loc6_.cursorClass = param1;
        _loc6_.priority = param2;
        _loc6_.x = param3;
        _loc6_.y = param4;
        if (this.mx_internal::systemManager) {
            _loc6_.systemManager = this.mx_internal::systemManager;
        } else {
            _loc6_.systemManager = FlexGlobals.topLevelApplication.systemManager;
        }
        this.cursorList.push(_loc6_);
        this.cursorList.sort(this.priorityCompare);
        this.showCurrentCursor();
        return _loc5_;
    }

    private function priorityCompare(param1: CursorQueueItem, param2: CursorQueueItem): int {
        if (param1.priority < param2.priority) {
            return -1;
        }
        if (param1.priority == param2.priority) {
            return 0;
        }
        return 1;
    }

    public function removeCursor(param1: int): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        if (hasEventListener("removeCursor")) {
            if (!dispatchEvent(new Request("removeCursor", false, true, param1))) {
                return;
            }
        }
        for (_loc2_ in this.cursorList) {
            _loc3_ = this.cursorList[_loc2_];
            if (_loc3_.cursorID == param1) {
                this.cursorList.splice(_loc2_, 1);
                this.showCurrentCursor();
                break;
            }
        }
    }

    public function removeAllCursors(): void {
        if (hasEventListener("removeAllCursors")) {
            if (!dispatchEvent(new Event("removeAllCursors", false, true))) {
                return;
            }
        }
        this.cursorList.splice(0);
        this.showCurrentCursor();
    }

    public function setBusyCursor(): void {
        if (hasEventListener("setBusyCursor")) {
            if (!dispatchEvent(new Event("setBusyCursor", false, true))) {
                return;
            }
        }
        var _loc1_: CSSStyleDeclaration = StyleManager.getStyleManager(this.mx_internal::systemManager as IFlexModuleFactory).getMergedStyleDeclaration("mx.managers.CursorManager");
        var _loc2_: Class = _loc1_.getStyle("busyCursor");
        this.busyCursorList.push(this.setCursor(_loc2_, CursorManagerPriority.LOW));
    }

    public function removeBusyCursor(): void {
        if (hasEventListener("removeBusyCursor")) {
            if (!dispatchEvent(new Event("removeBusyCursor", false, true))) {
                return;
            }
        }
        if (this.busyCursorList.length > 0) {
            this.removeCursor(int(this.busyCursorList.pop()));
        }
    }

    private function showCurrentCursor(): void {
        var _loc1_: * = null;
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc7_: * = null;
        if (this.cursorList.length > 0) {
            if (!this.mx_internal::initialized) {
                this.mx_internal::initialized = true;
                if (hasEventListener("initialize")) {
                    _loc2_ = new Event("initialize", false, true);
                }
                if (!_loc2_ || dispatchEvent(_loc2_)) {
                    this.mx_internal::cursorHolder = new FlexSprite();
                    this.mx_internal::cursorHolder.name = "cursorHolder";
                    this.mx_internal::cursorHolder.mouseEnabled = false;
                    this.mx_internal::cursorHolder.mouseChildren = false;
                    this.mx_internal::systemManager.cursorChildren.addChild(this.mx_internal::cursorHolder);
                }
            }
            _loc1_ = this.cursorList[0];
            if (this.currentCursorID == CursorManager.NO_CURSOR) {
                Mouse.hide();
            }
            if (_loc1_.cursorID != this.currentCursorID) {
                if (this.mx_internal::cursorHolder.numChildren > 0) {
                    this.mx_internal::cursorHolder.removeChildAt(0);
                }
                this.currentCursor = new _loc1_.cursorClass();
                if (this.currentCursor) {
                    if (this.currentCursor is InteractiveObject) {
                        InteractiveObject(this.currentCursor).mouseEnabled = false;
                    }
                    if (this.currentCursor is DisplayObjectContainer) {
                        DisplayObjectContainer(this.currentCursor).mouseChildren = false;
                    }
                    this.mx_internal::cursorHolder.addChild(this.currentCursor);
                    this.addContextMenuHandlers();
                    if (this.mx_internal::systemManager is SystemManager) {
                        _loc3_ = new Point(SystemManager(this.mx_internal::systemManager).mouseX + _loc1_.x, SystemManager(this.mx_internal::systemManager).mouseY + _loc1_.y);
                        _loc3_ = SystemManager(this.mx_internal::systemManager).localToGlobal(_loc3_);
                        _loc3_ = this.mx_internal::cursorHolder.parent.globalToLocal(_loc3_);
                        this.mx_internal::cursorHolder.x = _loc3_.x;
                        this.mx_internal::cursorHolder.y = _loc3_.y;
                    } else if (this.mx_internal::systemManager is DisplayObject) {
                        _loc3_ = new Point(DisplayObject(this.mx_internal::systemManager).mouseX + _loc1_.x, DisplayObject(this.mx_internal::systemManager).mouseY + _loc1_.y);
                        _loc3_ = DisplayObject(this.mx_internal::systemManager).localToGlobal(_loc3_);
                        _loc3_ = this.mx_internal::cursorHolder.parent.globalToLocal(_loc3_);
                        this.mx_internal::cursorHolder.x = DisplayObject(this.mx_internal::systemManager).mouseX + _loc1_.x;
                        this.mx_internal::cursorHolder.y = DisplayObject(this.mx_internal::systemManager).mouseY + _loc1_.y;
                    } else {
                        this.mx_internal::cursorHolder.x = _loc1_.x;
                        this.mx_internal::cursorHolder.y = _loc1_.y;
                    }
                    if (hasEventListener("addMouseMoveListener")) {
                        _loc4_ = new Event("addMouseMoveListener", false, true);
                    }
                    if (!_loc4_ || dispatchEvent(_loc4_)) {
                        this.mx_internal::systemManager.stage.addEventListener(MouseEvent.MOUSE_MOVE, this.mx_internal::mouseMoveHandler, true, EventPriority.CURSOR_MANAGEMENT);
                    }
                    if (hasEventListener("addMouseOutListener")) {
                        _loc5_ = new Event("addMouseOutListener", false, true);
                    }
                    if (!_loc5_ || dispatchEvent(_loc5_)) {
                        this.mx_internal::systemManager.stage.addEventListener(MouseEvent.MOUSE_OUT, this.mx_internal::mouseOutHandler, true, EventPriority.CURSOR_MANAGEMENT);
                    }
                }
                this.currentCursorID = _loc1_.cursorID;
                this.currentCursorXOffset = _loc1_.x;
                this.currentCursorYOffset = _loc1_.y;
            }
        } else {
            this.showCustomCursor = false;
            if (this.currentCursorID != CursorManager.NO_CURSOR) {
                this.currentCursorID = CursorManager.NO_CURSOR;
                this.currentCursorXOffset = 0;
                this.currentCursorYOffset = 0;
                if (hasEventListener("removeMouseMoveListener")) {
                    _loc6_ = new Event("removeMouseMoveListener", false, true);
                }
                if (!_loc6_ || dispatchEvent(_loc6_)) {
                    this.mx_internal::systemManager.stage.removeEventListener(MouseEvent.MOUSE_MOVE, this.mx_internal::mouseMoveHandler, true);
                }
                if (hasEventListener("removeMouseMoveListener")) {
                    _loc7_ = new Event("removeMouseOutListener", false, true);
                }
                if (!_loc7_ || dispatchEvent(_loc7_)) {
                    this.mx_internal::systemManager.stage.removeEventListener(MouseEvent.MOUSE_OUT, this.mx_internal::mouseOutHandler, true);
                }
                this.mx_internal::cursorHolder.removeChild(this.currentCursor);
                this.removeContextMenuHandlers();
            }
            Mouse.show();
        }
    }

    private function addContextMenuHandlers(): void {
        var _loc1_: * = null;
        var _loc2_: * = null;
        if (!this.listenForContextMenu) {
            _loc1_ = this.mx_internal::systemManager.document as InteractiveObject;
            _loc2_ = this.mx_internal::systemManager as InteractiveObject;
            if (Boolean(_loc1_) && Boolean(_loc1_.contextMenu)) {
                _loc1_.contextMenu.addEventListener(ContextMenuEvent.MENU_SELECT, this.contextMenu_menuSelectHandler, true, EventPriority.CURSOR_MANAGEMENT);
                this.listenForContextMenu = true;
            }
            if (Boolean(_loc2_) && Boolean(_loc2_.contextMenu)) {
                _loc2_.contextMenu.addEventListener(ContextMenuEvent.MENU_SELECT, this.contextMenu_menuSelectHandler, true, EventPriority.CURSOR_MANAGEMENT);
                this.listenForContextMenu = true;
            }
        }
    }

    private function removeContextMenuHandlers(): void {
        var _loc1_: * = null;
        var _loc2_: * = null;
        if (this.listenForContextMenu) {
            _loc1_ = this.mx_internal::systemManager.document as InteractiveObject;
            _loc2_ = this.mx_internal::systemManager as InteractiveObject;
            if (Boolean(_loc1_) && Boolean(_loc1_.contextMenu)) {
                _loc1_.contextMenu.removeEventListener(ContextMenuEvent.MENU_SELECT, this.contextMenu_menuSelectHandler, true);
            }
            if (Boolean(_loc2_) && Boolean(_loc2_.contextMenu)) {
                _loc2_.contextMenu.removeEventListener(ContextMenuEvent.MENU_SELECT, this.contextMenu_menuSelectHandler, true);
            }
            this.listenForContextMenu = false;
        }
    }

    public function registerToUseBusyCursor(param1: Object): void {
        if (hasEventListener("registerToUseBusyCursor")) {
            if (!dispatchEvent(new Request("registerToUseBusyCursor", false, true, param1))) {
                return;
            }
        }
        if (Boolean(param1) && param1 is EventDispatcher) {
            param1.addEventListener(ProgressEvent.PROGRESS, this.progressHandler);
            param1.addEventListener(Event.COMPLETE, this.completeHandler);
            param1.addEventListener(IOErrorEvent.IO_ERROR, this.completeHandler);
        }
    }

    public function unRegisterToUseBusyCursor(param1: Object): void {
        if (hasEventListener("unRegisterToUseBusyCursor")) {
            if (!dispatchEvent(new Request("unRegisterToUseBusyCursor", false, true, param1))) {
                return;
            }
        }
        if (Boolean(param1) && param1 is EventDispatcher) {
            param1.removeEventListener(ProgressEvent.PROGRESS, this.progressHandler);
            param1.removeEventListener(Event.COMPLETE, this.completeHandler);
            param1.removeEventListener(IOErrorEvent.IO_ERROR, this.completeHandler);
        }
    }

    private function contextMenu_menuSelectHandler(param1: ContextMenuEvent): void {
        this.showCustomCursor = true;
        this.mx_internal::sandboxRoot.addEventListener(MouseEvent.MOUSE_OVER, this.mouseOverHandler);
    }

    private function mouseOverHandler(param1: MouseEvent): void {
        this.mx_internal::sandboxRoot.removeEventListener(MouseEvent.MOUSE_OVER, this.mouseOverHandler);
        this.mx_internal::mouseMoveHandler(param1);
    }

    private function findSource(param1: Object): int {
        var _loc2_: int = this.sourceArray.length;
        var _loc3_: int = 0;
        while (_loc3_ < _loc2_) {
            if (this.sourceArray[_loc3_] === param1) {
                return _loc3_;
            }
            _loc3_++;
        }
        return -1;
    }

    mx_internal function mouseOutHandler(param1: MouseEvent): void {
        if (param1.relatedObject == null && this.cursorList.length > 0) {
            this.customCursorLeftStage = true;
            this.hideCursor();
            Mouse.show();
        }
    }

    mx_internal function mouseMoveHandler(param1: MouseEvent): void {
        var _loc2_: Point = new Point(param1.stageX, param1.stageY);
        _loc2_ = this.mx_internal::cursorHolder.parent.globalToLocal(_loc2_);
        _loc2_.x += this.currentCursorXOffset;
        _loc2_.y += this.currentCursorYOffset;
        this.mx_internal::cursorHolder.x = _loc2_.x;
        this.mx_internal::cursorHolder.y = _loc2_.y;
        var _loc3_: Object = param1.target;
        var _loc4_: Boolean = _loc3_ is TextField && _loc3_.type == TextFieldType.INPUT || _loc3_ is ISystemCursorClient && Boolean(ISystemCursorClient(_loc3_).showSystemCursor);
        if (!this.overTextField && _loc4_) {
            this.overTextField = true;
            this.showSystemCursor = true;
        } else if (this.overTextField && !_loc4_) {
            this.overTextField = false;
            this.showCustomCursor = true;
        } else {
            this.showCustomCursor = true;
        }
        if (this.showSystemCursor) {
            this.showSystemCursor = false;
            this.mx_internal::cursorHolder.visible = false;
            Mouse.show();
        }
        if (this.showCustomCursor) {
            this.showCustomCursor = false;
            this.mx_internal::cursorHolder.visible = true;
            Mouse.hide();
            if (hasEventListener("showCustomCursor")) {
                dispatchEvent(new Event("showCustomCursor"));
            }
        }
    }

    private function progressHandler(param1: ProgressEvent): void {
        var _loc2_: int = this.findSource(param1.target);
        if (_loc2_ == -1) {
            this.sourceArray.push(param1.target);
            this.setBusyCursor();
        }
    }

    private function completeHandler(param1: Event): void {
        var _loc2_: int = this.findSource(param1.target);
        if (_loc2_ != -1) {
            this.sourceArray.splice(_loc2_, 1);
            this.removeBusyCursor();
        }
    }
}
}

import mx.core.mx_internal;
import mx.managers.ISystemManager;

class CursorQueueItem {

    mx_internal static const VERSION: String = "4.6.0.23201";


    public var cursorID: int = 0;

    public var cursorClass: Class = null;

    public var priority: int = 2;

    public var systemManager: ISystemManager;

    public var x: Number;

    public var y: Number;

    function CursorQueueItem() {
        super();
    }
}
