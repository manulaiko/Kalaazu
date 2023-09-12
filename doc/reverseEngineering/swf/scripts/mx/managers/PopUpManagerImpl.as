package mx.managers {

import flash.accessibility.Accessibility;
import flash.accessibility.AccessibilityProperties;
import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.Graphics;
import flash.display.InteractiveObject;
import flash.display.Sprite;
import flash.display.Stage;
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.MouseEvent;
import flash.geom.Point;
import flash.geom.Rectangle;
import flash.system.Capabilities;

import mx.automation.IAutomationObject;
import mx.core.FlexGlobals;
import mx.core.FlexSprite;
import mx.core.FlexVersion;
import mx.core.IChildList;
import mx.core.IFlexDisplayObject;
import mx.core.IFlexModule;
import mx.core.IFlexModuleFactory;
import mx.core.IInvalidating;
import mx.core.ILayoutDirectionElement;
import mx.core.IUIComponent;
import mx.core.LayoutDirection;
import mx.core.UIComponent;
import mx.core.UIComponentGlobals;
import mx.core.mx_internal;
import mx.effects.Blur;
import mx.effects.Fade;
import mx.effects.IEffect;
import mx.events.DynamicEvent;
import mx.events.EffectEvent;
import mx.events.FlexEvent;
import mx.events.FlexMouseEvent;
import mx.events.Request;
import mx.styles.IStyleClient;

public class PopUpManagerImpl extends EventDispatcher implements IPopUpManager {

    mx_internal static const VERSION: String = "4.6.0.23201";

    private static var instance: IPopUpManager;

    public static var mixins: Array;

    mx_internal static var popUpInfoClass: Class;


    mx_internal var modalWindowClass: Class;

    mx_internal var popupInfo: Array;

    public function PopUpManagerImpl() {
        var _loc1_: int = 0;
        var _loc2_: int = 0;
        this.mx_internal::popupInfo = [];
        super();
        if (mixins) {
            _loc1_ = 0;
            _loc2_ = 0;
            while (_loc2_ < _loc1_) {
                new mixins[_loc2_](this);
                _loc2_++;
            }
        }
        if (hasEventListener("initialize")) {
            dispatchEvent(new Event("initialize"));
        }
    }

    mx_internal static function createPopUpData(): PopUpData {
        if (!mx_internal::popUpInfoClass) {
            return new PopUpData();
        }
        return new mx_internal::popUpInfoClass() as PopUpData;
    }

    private static function weakDependency(): void {
    }

    public static function getInstance(): IPopUpManager {
        if (!instance) {
            instance = new PopUpManagerImpl();
        }
        return instance;
    }

    private static function nonmodalMouseDownOutsideHandler(param1: DisplayObject, param2: MouseEvent): void {
        if (!param1.hitTestPoint(param2.stageX, param2.stageY, true)) {
            if (param1 is IUIComponent) {
                if (IUIComponent(param1).owns(DisplayObject(param2.target))) {
                    return;
                }
            }
            dispatchMouseDownOutsideEvent(param1, param2);
        }
    }

    private static function nonmodalMouseWheelOutsideHandler(param1: DisplayObject, param2: MouseEvent): void {
        if (!param1.hitTestPoint(param2.stageX, param2.stageY, true)) {
            if (param1 is IUIComponent) {
                if (IUIComponent(param1).owns(DisplayObject(param2.target))) {
                    return;
                }
            }
            dispatchMouseWheelOutsideEvent(param1, param2);
        }
    }

    private static function dispatchMouseWheelOutsideEvent(param1: DisplayObject, param2: MouseEvent): void {
        if (!param1) {
            return;
        }
        var _loc3_: MouseEvent = new FlexMouseEvent(FlexMouseEvent.MOUSE_WHEEL_OUTSIDE);
        var _loc4_: Point = param1.globalToLocal(new Point(param2.stageX, param2.stageY));
        _loc3_.localX = _loc4_.x;
        _loc3_.localY = _loc4_.y;
        _loc3_.buttonDown = param2.buttonDown;
        _loc3_.shiftKey = param2.shiftKey;
        _loc3_.altKey = param2.altKey;
        _loc3_.ctrlKey = param2.ctrlKey;
        _loc3_.delta = param2.delta;
        _loc3_.relatedObject = InteractiveObject(param2.target);
        param1.dispatchEvent(_loc3_);
    }

    private static function dispatchMouseDownOutsideEvent(param1: DisplayObject, param2: MouseEvent): void {
        if (!param1) {
            return;
        }
        var _loc3_: MouseEvent = new FlexMouseEvent(FlexMouseEvent.MOUSE_DOWN_OUTSIDE);
        var _loc4_: Point = param1.globalToLocal(new Point(param2.stageX, param2.stageY));
        _loc3_.localX = _loc4_.x;
        _loc3_.localY = _loc4_.y;
        _loc3_.buttonDown = param2.buttonDown;
        _loc3_.shiftKey = param2.shiftKey;
        _loc3_.altKey = param2.altKey;
        _loc3_.ctrlKey = param2.ctrlKey;
        _loc3_.delta = param2.delta;
        _loc3_.relatedObject = InteractiveObject(param2.target);
        param1.dispatchEvent(_loc3_);
    }

    public function createPopUp(param1: DisplayObject, param2: Class, param3: Boolean = false, param4: String = null, param5: IFlexModuleFactory = null): IFlexDisplayObject {
        var _loc6_: IUIComponent = new param2();
        this.addPopUp(_loc6_, param1, param3, param4, param5);
        return _loc6_;
    }

    public function addPopUp(param1: IFlexDisplayObject, param2: DisplayObject, param3: Boolean = false, param4: String = null, param5: IFlexModuleFactory = null): void {
        var _loc8_: * = null;
        var _loc9_: * = false;
        var _loc13_: * = null;
        var _loc14_: * = null;
        var _loc6_: Boolean = Boolean(param1.visible);
        if (param2 is IUIComponent && param1 is IUIComponent && IUIComponent(param1).document == null) {
            IUIComponent(param1).document = IUIComponent(param2).document;
        }
        if (param1 is IFlexModule && IFlexModule(param1).moduleFactory == null) {
            if (param5) {
                IFlexModule(param1).moduleFactory = param5;
            } else if (param2 is IUIComponent && IUIComponent(param2).document is IFlexModule) {
                IFlexModule(param1).moduleFactory = IFlexModule(IUIComponent(param2).document).moduleFactory;
            }
        }
        var _loc7_: ISystemManager;
        if (!(_loc7_ = this.mx_internal::getTopLevelSystemManager(param2))) {
            if ((_loc7_ = ISystemManager(SystemManagerGlobals.topLevelSystemManagers[0])).getSandboxRoot() != param2) {
                return;
            }
        }
        var _loc10_: ISystemManager = _loc7_;
        if (hasEventListener("addPopUp")) {
            _loc13_ = new Request("addPopUp", false, true, {
                "parent": param2,
                "sm": _loc7_,
                "modal": param3,
                "childList": param4
            });
            if (!dispatchEvent(_loc13_)) {
                _loc10_ = _loc13_.value as ISystemManager;
            }
        }
        if (param1 is IUIComponent) {
            IUIComponent(param1).isPopUp = true;
        }
        if (!param4 || param4 == PopUpManagerChildList.PARENT) {
            _loc9_ = Boolean(_loc10_.popUpChildren.contains(param2));
        } else {
            _loc9_ = param4 == PopUpManagerChildList.POPUP;
        }
        _loc8_ = _loc9_ ? _loc10_.popUpChildren : _loc10_;
        if (DisplayObject(param1).parent != _loc8_) {
            _loc8_.addChild(DisplayObject(param1));
        }
        param1.visible = false;
        var _loc11_: PopUpData;
        (_loc11_ = mx_internal::createPopUpData()).owner = DisplayObject(param1);
        _loc11_.topMost = _loc9_;
        _loc11_.systemManager = _loc10_;
        this.mx_internal::popupInfo.push(_loc11_);
        var _loc12_: IActiveWindowManager = IActiveWindowManager(_loc10_.getImplementation("mx.managers::IActiveWindowManager"));
        if (param1 is IFocusManagerContainer) {
            if (IFocusManagerContainer(param1).focusManager) {
                _loc12_.addFocusManager(IFocusManagerContainer(param1));
            } else {
                IFocusManagerContainer(param1).focusManager = new FocusManager(IFocusManagerContainer(param1), true);
            }
        }
        if (hasEventListener("addPlaceHolder")) {
            (_loc14_ = new DynamicEvent("addPlaceHolder")).sm = _loc7_;
            _loc14_.window = param1;
            dispatchEvent(_loc14_);
        }
        if (param1 is IAutomationObject) {
            IAutomationObject(param1).showInAutomationHierarchy = true;
        }
        if (param1 is ILayoutManagerClient) {
            UIComponentGlobals.mx_internal::layoutManager.validateClient(ILayoutManagerClient(param1), true);
        }
        _loc11_.parent = param2;
        if (param1 is IUIComponent) {
            IUIComponent(param1).setActualSize(IUIComponent(param1).getExplicitOrMeasuredWidth(), IUIComponent(param1).getExplicitOrMeasuredHeight());
        }
        if (true) {
            if (param1 is ILayoutDirectionElement) {
                ILayoutDirectionElement(param1).invalidateLayoutDirection();
            }
        }
        if (param3) {
            if (false && false) {
                param1.addEventListener(FlexEvent.CREATION_COMPLETE, this.modalPopUpCreationCompleteHandler, false, 0, true);
            }
            this.mx_internal::createModalWindow(param2, _loc11_, _loc8_, _loc6_, _loc10_, _loc10_.getSandboxRoot());
        } else {
            _loc11_._mouseDownOutsideHandler = nonmodalMouseDownOutsideHandler;
            _loc11_._mouseWheelOutsideHandler = nonmodalMouseWheelOutsideHandler;
            param1.visible = _loc6_;
        }
        _loc11_.owner.addEventListener(FlexEvent.SHOW, this.showOwnerHandler);
        _loc11_.owner.addEventListener(FlexEvent.HIDE, this.hideOwnerHandler);
        this.addMouseOutEventListeners(_loc11_);
        param1.addEventListener(Event.REMOVED, this.popupRemovedHandler);
        if (param1 is IFocusManagerContainer && _loc6_) {
            if (hasEventListener("addedPopUp")) {
                (_loc14_ = new DynamicEvent("addedPopUp", false, true)).window = param1;
                _loc14_.systemManager = _loc10_;
                dispatchEvent(_loc14_);
            } else {
                _loc12_.activate(IFocusManagerContainer(param1));
            }
        }
    }

    mx_internal function getTopLevelSystemManager(param1: DisplayObject): ISystemManager {
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: * = null;
        if (hasEventListener("topLevelSystemManager")) {
            (_loc4_ = new Request("topLevelSystemManager", false, true)).value = param1;
            if (!dispatchEvent(_loc4_)) {
                _loc2_ = _loc4_.value as DisplayObjectContainer;
            }
        }
        if (!_loc2_) {
            _loc2_ = DisplayObjectContainer(param1.root);
        }
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

    public function centerPopUp(param1: IFlexDisplayObject): void {
        var _loc4_: * = null;
        var _loc5_: Number = NaN;
        var _loc6_: Number = NaN;
        var _loc7_: Number = NaN;
        var _loc8_: Number = NaN;
        var _loc9_: Number = NaN;
        var _loc10_: Number = NaN;
        var _loc11_: * = null;
        var _loc12_: * = null;
        var _loc13_: * = null;
        var _loc14_: Boolean = false;
        var _loc15_: * = null;
        var _loc16_: * = null;
        var _loc17_: * = null;
        var _loc18_: * = null;
        var _loc19_: * = null;
        var _loc20_: * = null;
        if (param1 is IInvalidating) {
            IInvalidating(param1).validateNow();
        }
        var _loc2_: PopUpData = this.findPopupInfoByOwner(param1);
        var _loc3_: DisplayObject = _loc2_ && _loc2_.parent && Boolean(_loc2_.parent.stage) ? _loc2_.parent : param1.parent;
        if (_loc3_) {
            _loc4_ = _loc2_.systemManager;
            _loc12_ = new Point();
            _loc15_ = _loc4_.getSandboxRoot();
            if (hasEventListener("isTopLevelRoot")) {
                _loc16_ = new Request("isTopLevelRoot", false, true);
            }
            if (Boolean(_loc16_) && !dispatchEvent(_loc16_)) {
                _loc14_ = Boolean(_loc16_.value);
            } else {
                _loc14_ = Boolean(_loc4_.isTopLevelRoot());
            }
            if (_loc14_ && false) {
                _loc7_ = (_loc17_ = _loc4_.screen).width;
                _loc8_ = _loc17_.height;
            } else {
                (_loc11_ = _loc4_.getVisibleApplicationRect()).topLeft = DisplayObject(_loc4_).globalToLocal(_loc11_.topLeft);
                _loc11_.bottomRight = DisplayObject(_loc4_).globalToLocal(_loc11_.bottomRight);
                _loc12_ = _loc11_.topLeft.clone();
                _loc7_ = _loc11_.width;
                _loc8_ = _loc11_.height;
            }
            if (_loc3_ is UIComponent) {
                _loc11_ = UIComponent(_loc3_).getVisibleRect();
                if (UIComponent(_loc3_).systemManager != _loc15_) {
                    _loc11_ = UIComponent(_loc3_).systemManager.getVisibleApplicationRect(_loc11_);
                }
                _loc18_ = _loc3_.globalToLocal(_loc11_.topLeft);
                _loc12_.x += _loc18_.x;
                _loc12_.y += _loc18_.y;
                _loc9_ = _loc11_.width;
                _loc10_ = _loc11_.height;
            } else {
                _loc9_ = _loc3_.width;
                _loc10_ = _loc3_.height;
            }
            _loc5_ = Math.max(0, (Math.min(_loc7_, _loc9_) - Number(param1.width)) / 2);
            _loc6_ = Math.max(0, (Math.min(_loc8_, _loc10_) - Number(param1.height)) / 2);
            if (true) {
                _loc19_ = param1 as ILayoutDirectionElement;
                _loc20_ = _loc3_ as ILayoutDirectionElement;
                if (Boolean(_loc19_) && (_loc20_ && _loc20_.layoutDirection != _loc19_.layoutDirection || !_loc20_ && _loc19_.layoutDirection == LayoutDirection.RTL)) {
                    _loc5_ = -_loc5_ - Number(param1.width);
                }
            }
            _loc13_ = new Point(_loc12_.x, _loc12_.y);
            _loc13_ = _loc3_.localToGlobal(_loc13_);
            _loc13_ = param1.parent.globalToLocal(_loc13_);
            param1.move(Math.round(_loc5_) + _loc13_.x, Math.round(_loc6_) + _loc13_.y);
        }
    }

    public function removePopUp(param1: IFlexDisplayObject): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: * = null;
        if (Boolean(param1) && Boolean(param1.parent)) {
            _loc2_ = this.findPopupInfoByOwner(param1);
            if (_loc2_) {
                _loc3_ = _loc2_.systemManager;
                if (!_loc3_) {
                    if (!(_loc4_ = param1 as IUIComponent)) {
                        return;
                    }
                    _loc3_ = ISystemManager(_loc4_.systemManager);
                }
                if (_loc2_.topMost) {
                    _loc3_.popUpChildren.removeChild(DisplayObject(param1));
                } else {
                    _loc3_.removeChild(DisplayObject(param1));
                }
            }
        }
    }

    public function bringToFront(param1: IFlexDisplayObject): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: * = null;
        if (Boolean(param1) && Boolean(param1.parent)) {
            _loc2_ = this.findPopupInfoByOwner(param1);
            if (_loc2_) {
                if (hasEventListener("bringToFront")) {
                    (_loc4_ = new DynamicEvent("bringToFront", false, true)).popUpData = _loc2_;
                    _loc4_.popUp = param1;
                    if (!dispatchEvent(_loc4_)) {
                        return;
                    }
                }
                _loc3_ = ISystemManager(param1.parent);
                if (_loc2_.topMost) {
                    _loc3_.popUpChildren.setChildIndex(DisplayObject(param1), _loc3_.popUpChildren.numChildren - 1);
                } else {
                    _loc3_.setChildIndex(DisplayObject(param1), _loc3_.numChildren - 1);
                }
            }
        }
    }

    mx_internal function createModalWindow(param1: DisplayObject, param2: PopUpData, param3: IChildList, param4: Boolean, param5: ISystemManager, param6: DisplayObject): void {
        var _loc7_: * = null;
        var _loc10_: * = null;
        var _loc15_: * = null;
        var _loc8_: IStyleClient = (_loc7_ = IFlexDisplayObject(param2.owner)) as IStyleClient;
        if (this.mx_internal::modalWindowClass) {
            _loc10_ = new this.mx_internal::modalWindowClass();
        } else {
            (_loc10_ = new FlexSprite()).name = "modalWindow";
        }
        if (!param5 && Boolean(param1)) {
            param5 = IUIComponent(param1).systemManager;
        }
        var _loc11_: IActiveWindowManager;
        ++(_loc11_ = IActiveWindowManager(param5.getImplementation("mx.managers::IActiveWindowManager"))).numModalWindows;
        if (_loc7_) {
            param3.addChildAt(_loc10_, param3.getChildIndex(DisplayObject(_loc7_)));
        } else {
            param3.addChild(_loc10_);
        }
        if (_loc7_ is IAutomationObject) {
            IAutomationObject(_loc7_).showInAutomationHierarchy = true;
        }
        param2.modalWindow = _loc10_;
        if (_loc8_) {
            _loc10_.alpha = _loc8_.getStyle("modalTransparency");
        } else {
            _loc10_.alpha = 0;
        }
        _loc10_.tabEnabled = false;
        var _loc12_: Rectangle = param5.screen;
        var _loc13_: Graphics = _loc10_.graphics;
        var _loc14_: Number = 16777215;
        if (_loc8_) {
            _loc14_ = _loc8_.getStyle("modalTransparencyColor");
        }
        if (hasEventListener("createModalWindow")) {
            (_loc15_ = new DynamicEvent("createModalWindow", false, true)).popUpData = param2;
            _loc15_.popUp = _loc7_;
            _loc15_.color = _loc14_;
            _loc15_.visibleFlag = param4;
            _loc15_.childrenList = param3;
            if (!dispatchEvent(_loc15_)) {
                _loc14_ = Number(_loc15_.color);
            }
        }
        _loc13_.clear();
        _loc13_.beginFill(_loc14_, 100);
        _loc13_.drawRect(_loc12_.x, _loc12_.y, _loc12_.width, _loc12_.height);
        _loc13_.endFill();
        if (hasEventListener("updateModalMask")) {
            (_loc15_ = new DynamicEvent("updateModalMask")).popUpData = param2;
            _loc15_.popUp = _loc7_;
            _loc15_.childrenList = param3;
            dispatchEvent(_loc15_);
        }
        param2._mouseDownOutsideHandler = dispatchMouseDownOutsideEvent;
        param2._mouseWheelOutsideHandler = dispatchMouseWheelOutsideEvent;
        param5.addEventListener(Event.RESIZE, param2.resizeHandler);
        if (_loc7_) {
            _loc7_.addEventListener(FlexEvent.SHOW, this.popupShowHandler);
            _loc7_.addEventListener(FlexEvent.HIDE, this.popupHideHandler);
        }
        if (param4) {
            this.mx_internal::showModalWindow(param2, param5, false);
        } else {
            _loc7_.visible = param4;
        }
        if (hasEventListener("createdModalWindow")) {
            (_loc15_ = new DynamicEvent("createdModalWindow")).popUpData = param2;
            _loc15_.popUp = _loc7_;
            _loc15_.visibleFlag = param4;
            _loc15_.childrenList = param3;
            dispatchEvent(_loc15_);
        }
    }

    private function endEffects(param1: PopUpData): void {
        if (param1.fade) {
            param1.fade.end();
            param1.fade = null;
        }
        if (param1.blur) {
            param1.blur.end();
            param1.blur = null;
        }
    }

    mx_internal function showModalWindow(param1: PopUpData, param2: ISystemManager, param3: Boolean = true): void {
        var _loc10_: * = null;
        var _loc4_: IStyleClient = param1.owner as IStyleClient;
        var _loc5_: Number = 0;
        var _loc6_: Number = 0;
        if (_loc4_) {
            _loc5_ = _loc4_.getStyle("modalTransparencyDuration");
        }
        if (_loc4_) {
            _loc6_ = _loc4_.getStyle("modalTransparency");
        }
        var _loc7_: Number = 0;
        if (_loc4_) {
            _loc7_ = _loc4_.getStyle("modalTransparencyBlur");
        }
        var _loc8_: Number = 16777215;
        if (_loc4_) {
            _loc8_ = _loc4_.getStyle("modalTransparencyColor");
        }
        var _loc9_: DisplayObject = param2.getSandboxRoot();
        if (hasEventListener("showModalWindow")) {
            (_loc10_ = new DynamicEvent("showModalWindow", false, true)).popUpData = param1;
            _loc10_.sendRequest = param3;
            _loc10_.alpha = _loc6_;
            _loc10_.blurAmount = _loc7_;
            _loc10_.duration = _loc5_;
            _loc10_.systemManager = param2;
            _loc10_.transparencyColor = _loc8_;
            if (!dispatchEvent(_loc10_)) {
                _loc6_ = Number(_loc10_.alpha);
                _loc7_ = Number(_loc10_.blurAmount);
                _loc5_ = Number(_loc10_.duration);
                _loc8_ = Number(_loc10_.transparencyColor);
            }
        }
        param1.modalWindow.alpha = _loc6_;
        this.showModalWindowInternal(param1, _loc5_, _loc6_, _loc8_, _loc7_, param2, _loc9_);
    }

    private function setModalPopupVisible(param1: DisplayObject, param2: Boolean): void {
        param1.removeEventListener(FlexEvent.SHOW, this.popupShowHandler);
        param1.removeEventListener(FlexEvent.HIDE, this.popupHideHandler);
        param1.visible = param2;
        param1.addEventListener(FlexEvent.SHOW, this.popupShowHandler);
        param1.addEventListener(FlexEvent.HIDE, this.popupHideHandler);
    }

    private function showModalWindowInternal(param1: PopUpData, param2: Number, param3: Number, param4: Number, param5: Number, param6: ISystemManager, param7: DisplayObject): void {
        var _loc8_: * = null;
        var _loc9_: Number = NaN;
        var _loc10_: * = null;
        var _loc12_: * = null;
        this.endEffects(param1);
        if (param2) {
            (_loc8_ = new Fade(param1.modalWindow)).alphaFrom = 0;
            _loc8_.alphaTo = param3;
            _loc8_.duration = param2;
            _loc8_.addEventListener(EffectEvent.EFFECT_END, this.fadeInEffectEndHandler);
            param1.modalWindow.alpha = 0;
            param1.modalWindow.visible = true;
            param1.fade = _loc8_;
            if (param1.owner) {
                this.setModalPopupVisible(param1.owner, false);
            }
            _loc8_.play();
            if (_loc9_ = param5) {
                if (DisplayObject(param6).parent is Stage) {
                    param1.blurTarget = param6.document;
                } else if (param6 != param7) {
                    if (hasEventListener("blurTarget")) {
                        _loc12_ = new Request("blurTarget", false, true, {"popUpData": param1});
                        if (!dispatchEvent(_loc12_)) {
                            param1.blurTarget = _loc12_.value;
                        }
                    }
                } else {
                    param1.blurTarget = FlexGlobals.topLevelApplication;
                }
                _loc10_ = new Blur(param1.blurTarget);
                _loc10_.blurXFrom = _loc10_.blurYFrom = 0;
                _loc10_.blurXTo = _loc10_.blurYTo = _loc9_;
                _loc10_.duration = param2;
                _loc10_.addEventListener(EffectEvent.EFFECT_END, this.effectEndHandler);
                param1.blur = _loc10_;
                _loc10_.play();
            }
        } else {
            if (param1.owner) {
                this.setModalPopupVisible(param1.owner, true);
            }
            param1.modalWindow.visible = true;
        }
    }

    mx_internal function hideModalWindow(param1: PopUpData, param2: Boolean = false): void {
        var _loc5_: * = null;
        var _loc6_: Number = NaN;
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc3_: IStyleClient = param1.owner as IStyleClient;
        var _loc4_: Number = 0;
        if (_loc3_) {
            _loc4_ = _loc3_.getStyle("modalTransparencyDuration");
        }
        this.endEffects(param1);
        if (_loc4_) {
            (_loc5_ = new Fade(param1.modalWindow)).alphaFrom = param1.modalWindow.alpha;
            _loc5_.alphaTo = 0;
            _loc5_.duration = _loc4_;
            _loc5_.addEventListener(EffectEvent.EFFECT_END, param2 ? this.fadeOutDestroyEffectEndHandler : this.fadeOutCloseEffectEndHandler);
            param1.modalWindow.visible = true;
            param1.fade = _loc5_;
            _loc5_.play();
            if (_loc6_ = _loc3_.getStyle("modalTransparencyBlur")) {
                _loc7_ = new Blur(param1.blurTarget);
                _loc7_.blurXFrom = _loc7_.blurYFrom = _loc6_;
                _loc7_.blurXTo = _loc7_.blurYTo = 0;
                _loc7_.duration = _loc4_;
                _loc7_.addEventListener(EffectEvent.EFFECT_END, this.effectEndHandler);
                param1.blur = _loc7_;
                _loc7_.play();
            }
        } else {
            param1.modalWindow.visible = false;
        }
        if (hasEventListener("hideModalWindow")) {
            (_loc8_ = new DynamicEvent("hideModalWindow", false, false)).popUpData = param1;
            _loc8_.destroy = param2;
            dispatchEvent(_loc8_);
        }
    }

    private function findPopupInfoIndexByOwner(param1: Object): int {
        var _loc4_: * = null;
        var _loc2_: int = this.mx_internal::popupInfo.length;
        var _loc3_: int = 0;
        while (_loc3_ < _loc2_) {
            if ((_loc4_ = this.mx_internal::popupInfo[_loc3_]).owner == param1) {
                return _loc3_;
            }
            _loc3_++;
        }
        return -1;
    }

    private function findPopupInfoByOwner(param1: Object): PopUpData {
        var _loc2_: int = this.findPopupInfoIndexByOwner(param1);
        return _loc2_ > -1 ? this.mx_internal::popupInfo[_loc2_] : null;
    }

    private function addMouseOutEventListeners(param1: PopUpData): void {
        var _loc3_: * = null;
        var _loc2_: DisplayObject = param1.systemManager.getSandboxRoot();
        if (param1.modalWindow) {
            param1.modalWindow.addEventListener(MouseEvent.MOUSE_DOWN, param1.mouseDownOutsideHandler);
            param1.modalWindow.addEventListener(MouseEvent.MOUSE_WHEEL, param1.mouseWheelOutsideHandler, true);
        } else {
            _loc2_.addEventListener(MouseEvent.MOUSE_DOWN, param1.mouseDownOutsideHandler);
            _loc2_.addEventListener(MouseEvent.MOUSE_WHEEL, param1.mouseWheelOutsideHandler, true);
        }
        if (hasEventListener("addMouseOutEventListeners")) {
            _loc3_ = new DynamicEvent("addMouseOutEventListeners", false, false);
            _loc3_.popUpData = param1;
            dispatchEvent(_loc3_);
        }
    }

    private function removeMouseOutEventListeners(param1: PopUpData): void {
        var _loc3_: * = null;
        var _loc2_: DisplayObject = param1.systemManager.getSandboxRoot();
        if (param1.modalWindow) {
            param1.modalWindow.removeEventListener(MouseEvent.MOUSE_DOWN, param1.mouseDownOutsideHandler);
            param1.modalWindow.removeEventListener(MouseEvent.MOUSE_WHEEL, param1.mouseWheelOutsideHandler, true);
        } else {
            _loc2_.removeEventListener(MouseEvent.MOUSE_DOWN, param1.mouseDownOutsideHandler);
            _loc2_.removeEventListener(MouseEvent.MOUSE_WHEEL, param1.mouseWheelOutsideHandler, true);
        }
        if (hasEventListener("removeMouseOutEventListeners")) {
            _loc3_ = new DynamicEvent("removeMouseOutEventListeners", false, false);
            _loc3_.popUpData = param1;
            dispatchEvent(_loc3_);
        }
    }

    private function popupShowHandler(param1: FlexEvent): void {
        var _loc2_: PopUpData = this.findPopupInfoByOwner(param1.target);
        if (_loc2_) {
            this.mx_internal::showModalWindow(_loc2_, this.mx_internal::getTopLevelSystemManager(_loc2_.parent));
        }
    }

    private function popupHideHandler(param1: FlexEvent): void {
        var _loc2_: PopUpData = this.findPopupInfoByOwner(param1.target);
        if (_loc2_) {
            this.mx_internal::hideModalWindow(_loc2_);
        }
    }

    private function showOwnerHandler(param1: FlexEvent): void {
        var _loc2_: PopUpData = this.findPopupInfoByOwner(param1.target);
        if (_loc2_) {
            this.addMouseOutEventListeners(_loc2_);
        }
    }

    private function hideOwnerHandler(param1: FlexEvent): void {
        var _loc2_: PopUpData = this.findPopupInfoByOwner(param1.target);
        if (_loc2_) {
            this.removeMouseOutEventListeners(_loc2_);
        }
    }

    private function popupRemovedHandler(param1: Event): void {
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc9_: * = null;
        var _loc10_: * = null;
        var _loc2_: int = this.mx_internal::popupInfo.length;
        var _loc3_: int = 0;
        while (_loc3_ < _loc2_) {
            if ((_loc5_ = (_loc4_ = this.mx_internal::popupInfo[_loc3_]).owner) == param1.target) {
                _loc6_ = _loc4_.parent;
                _loc7_ = _loc4_.modalWindow;
                if (!(_loc8_ = _loc4_.systemManager).isTopLevel()) {
                    _loc8_ = _loc8_.topLevelSystemManager;
                }
                if (_loc5_ is IUIComponent) {
                    IUIComponent(_loc5_).isPopUp = false;
                }
                _loc9_ = IActiveWindowManager(_loc8_.getImplementation("mx.managers::IActiveWindowManager"));
                if (_loc5_ is IFocusManagerContainer) {
                    _loc9_.removeFocusManager(IFocusManagerContainer(_loc5_));
                }
                _loc5_.removeEventListener(Event.REMOVED, this.popupRemovedHandler);
                if (hasEventListener("removeMouseOutEventListeners")) {
                    (_loc10_ = new DynamicEvent("popUpRemoved")).popUpData = _loc4_;
                    dispatchEvent(_loc10_);
                }
                if (_loc4_.owner) {
                    _loc4_.owner.removeEventListener(FlexEvent.SHOW, this.showOwnerHandler);
                    _loc4_.owner.removeEventListener(FlexEvent.HIDE, this.hideOwnerHandler);
                }
                this.removeMouseOutEventListeners(_loc4_);
                if (_loc7_) {
                    this.removeModalPopUpAccessibility(_loc5_);
                    _loc8_.removeEventListener(Event.RESIZE, _loc4_.resizeHandler);
                    _loc5_.removeEventListener(FlexEvent.SHOW, this.popupShowHandler);
                    _loc5_.removeEventListener(FlexEvent.HIDE, this.popupHideHandler);
                    this.mx_internal::hideModalWindow(_loc4_, true);
                    --_loc9_.numModalWindows;
                }
                this.mx_internal::popupInfo.splice(_loc3_, 1);
                break;
            }
            _loc3_++;
        }
    }

    private function fadeInEffectEndHandler(param1: EffectEvent): void {
        var _loc4_: * = null;
        this.effectEndHandler(param1);
        var _loc2_: int = this.mx_internal::popupInfo.length;
        var _loc3_: int = 0;
        while (_loc3_ < _loc2_) {
            if (Boolean((_loc4_ = this.mx_internal::popupInfo[_loc3_]).owner) && _loc4_.modalWindow == param1.effectInstance.target) {
                this.setModalPopupVisible(_loc4_.owner, true);
                break;
            }
            _loc3_++;
        }
    }

    private function fadeOutDestroyEffectEndHandler(param1: EffectEvent): void {
        var _loc4_: * = null;
        this.effectEndHandler(param1);
        var _loc2_: DisplayObject = DisplayObject(param1.effectInstance.target);
        var _loc3_: DisplayObject = _loc2_.mask;
        if (_loc3_) {
            _loc2_.mask = null;
            _loc4_.popUpChildren.removeChild(_loc3_);
        }
        if (_loc2_.parent is ISystemManager) {
            if ((_loc4_ = ISystemManager(_loc2_.parent)).popUpChildren.contains(_loc2_)) {
                _loc4_.popUpChildren.removeChild(_loc2_);
            } else {
                _loc4_.removeChild(_loc2_);
            }
        } else if (_loc2_.parent) {
            _loc2_.parent.removeChild(_loc2_);
        }
    }

    private function fadeOutCloseEffectEndHandler(param1: EffectEvent): void {
        this.effectEndHandler(param1);
        DisplayObject(param1.effectInstance.target).visible = false;
    }

    private function effectEndHandler(param1: EffectEvent): void {
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc2_: int = this.mx_internal::popupInfo.length;
        var _loc3_: int = 0;
        while (_loc3_ < _loc2_) {
            _loc4_ = this.mx_internal::popupInfo[_loc3_];
            if ((_loc5_ = param1.effectInstance.effect) == _loc4_.fade) {
                _loc4_.fade = null;
            } else if (_loc5_ == _loc4_.blur) {
                _loc4_.blur = null;
            }
            _loc3_++;
        }
    }

    private function modalPopUpCreationCompleteHandler(param1: FlexEvent): void {
        param1.target.removeEventListener(FlexEvent.CREATION_COMPLETE, this.modalPopUpCreationCompleteHandler);
        this.addModalPopUpAccessibility(param1.currentTarget as DisplayObject);
    }

    private function addModalPopUpAccessibility(param1: DisplayObject): Boolean {
        var _loc2_: * = null;
        var _loc3_: int = 0;
        var _loc4_: int = 0;
        var _loc5_: * = null;
        var _loc6_: * = null;
        if (false && false) {
            _loc2_ = this.findPopupInfoByOwner(param1);
            if (_loc2_) {
                _loc3_ = this.mx_internal::popupInfo.length;
                _loc4_ = 0;
                while (_loc4_ < _loc3_) {
                    if ((Boolean(_loc6_ = this.mx_internal::popupInfo[_loc4_])) && _loc6_ != _loc2_) {
                        _loc6_.owner.accessibilityProperties.silent = true;
                    }
                    _loc4_++;
                }
                if (!(_loc5_ = _loc2_.systemManager.getSandboxRoot()).document.accessibilityProperties) {
                    _loc5_.document.accessibilityProperties = new AccessibilityProperties();
                }
                _loc5_.document.accessibilityProperties.silent = true;
                Accessibility.updateProperties();
            }
            return true;
        }
        return false;
    }

    private function removeModalPopUpAccessibility(param1: DisplayObject): Boolean {
        var _loc2_: * = null;
        var _loc3_: * = null;
        if (false && false) {
            _loc2_ = this.findPopupInfoByOwner(param1);
            if (_loc2_) {
                this.handleAccessibilityForNestedPopups(param1);
                if (this.mx_internal::popupInfo.length <= 1) {
                    _loc3_ = _loc2_.systemManager.getSandboxRoot();
                    _loc3_.document.accessibilityProperties.silent = false;
                }
                Accessibility.updateProperties();
            }
            return true;
        }
        return false;
    }

    private function handleAccessibilityForNestedPopups(param1: DisplayObject): void {
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: * = null;
        if (!param1) {
            return;
        }
        var _loc2_: int = this.findPopupInfoIndexByOwner(param1);
        var _loc3_: PopUpData = _loc2_ > -1 ? this.mx_internal::popupInfo[_loc2_] : null;
        if (_loc2_ == 0) {
            if (_loc5_ = this.mx_internal::getTopLevelSystemManager(_loc3_.parent)) {
                _loc5_.document.accessibilityProperties.silent = false;
                (_loc6_ = _loc3_.systemManager.getSandboxRoot()).document.accessibilityProperties.silent = false;
            }
        } else if (_loc2_ > 0) {
            (_loc4_ = this.mx_internal::popupInfo[_loc2_ - 1]).owner.accessibilityProperties.silent = false;
            if (_loc4_.modalWindow) {
                return;
            }
            this.handleAccessibilityForNestedPopups(_loc4_.owner);
        }
    }
}
}
