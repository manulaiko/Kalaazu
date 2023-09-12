package mx.managers {

import flash.display.Stage;
import flash.events.Event;
import flash.events.EventDispatcher;

import mx.core.UIComponentGlobals;
import mx.core.mx_internal;
import mx.events.DynamicEvent;
import mx.events.FlexEvent;
import mx.managers.layoutClasses.PriorityQueue;

public class LayoutManager extends EventDispatcher implements ILayoutManager {

    mx_internal static const VERSION: String = "4.6.0.23201";

    private static var instance: LayoutManager;


    private var updateCompleteQueue: PriorityQueue;

    private var invalidatePropertiesQueue: PriorityQueue;

    private var invalidatePropertiesFlag: Boolean = false;

    private var invalidateClientPropertiesFlag: Boolean = false;

    private var invalidateSizeQueue: PriorityQueue;

    private var invalidateSizeFlag: Boolean = false;

    private var invalidateClientSizeFlag: Boolean = false;

    private var invalidateDisplayListQueue: PriorityQueue;

    private var invalidateDisplayListFlag: Boolean = false;

    private var waitedAFrame: Boolean = false;

    private var listenersAttached: Boolean = false;

    private var originalFrameRate: Number;

    private var targetLevel: int = 2147483647;

    private var systemManager: ISystemManager;

    private var currentObject: ILayoutManagerClient;

    private var _usePhasedInstantiation: Boolean = false;

    private var _usingBridge: int = -1;

    public function LayoutManager() {
        this.updateCompleteQueue = new PriorityQueue();
        this.invalidatePropertiesQueue = new PriorityQueue();
        this.invalidateSizeQueue = new PriorityQueue();
        this.invalidateDisplayListQueue = new PriorityQueue();
        super();
        this.systemManager = SystemManagerGlobals.topLevelSystemManagers[0];
    }

    public static function getInstance(): LayoutManager {
        if (!instance) {
            instance = new LayoutManager();
        }
        return instance;
    }

    public function get usePhasedInstantiation(): Boolean {
        return this._usePhasedInstantiation;
    }

    public function set usePhasedInstantiation(param1: Boolean): void {
        var _loc2_: * = null;
        if (this._usePhasedInstantiation != param1) {
            this._usePhasedInstantiation = param1;
            try {
                _loc2_ = this.systemManager.stage;
                if (_loc2_) {
                    if (param1) {
                        this.originalFrameRate = _loc2_.frameRate;
                        _loc2_.frameRate = 1000;
                    } else {
                        _loc2_.frameRate = this.originalFrameRate;
                    }
                }
            } catch (e: SecurityError) {
            }
        }
    }

    public function invalidateProperties(param1: ILayoutManagerClient): void {
        if (!this.invalidatePropertiesFlag && Boolean(this.systemManager)) {
            this.invalidatePropertiesFlag = true;
            if (!this.listenersAttached) {
                this.attachListeners(this.systemManager);
            }
        }
        if (this.targetLevel <= param1.nestLevel) {
            this.invalidateClientPropertiesFlag = true;
        }
        this.invalidatePropertiesQueue.addObject(param1, param1.nestLevel);
    }

    public function invalidateSize(param1: ILayoutManagerClient): void {
        if (!this.invalidateSizeFlag && Boolean(this.systemManager)) {
            this.invalidateSizeFlag = true;
            if (!this.listenersAttached) {
                this.attachListeners(this.systemManager);
            }
        }
        if (this.targetLevel <= param1.nestLevel) {
            this.invalidateClientSizeFlag = true;
        }
        this.invalidateSizeQueue.addObject(param1, param1.nestLevel);
    }

    public function invalidateDisplayList(param1: ILayoutManagerClient): void {
        if (!this.invalidateDisplayListFlag && Boolean(this.systemManager)) {
            this.invalidateDisplayListFlag = true;
            if (!this.listenersAttached) {
                this.attachListeners(this.systemManager);
            }
        } else if (!this.invalidateDisplayListFlag && !this.systemManager) {
        }
        this.invalidateDisplayListQueue.addObject(param1, param1.nestLevel);
    }

    private function validateProperties(): void {
        var _loc1_: ILayoutManagerClient = ILayoutManagerClient(this.invalidatePropertiesQueue.removeSmallest());
        while (_loc1_) {
            if (_loc1_.nestLevel) {
                this.currentObject = _loc1_;
                _loc1_.validateProperties();
                if (!_loc1_.updateCompletePendingFlag) {
                    this.updateCompleteQueue.addObject(_loc1_, _loc1_.nestLevel);
                    _loc1_.updateCompletePendingFlag = true;
                }
            }
            _loc1_ = ILayoutManagerClient(this.invalidatePropertiesQueue.removeSmallest());
        }
        if (this.invalidatePropertiesQueue.isEmpty()) {
            this.invalidatePropertiesFlag = false;
        }
    }

    private function validateSize(): void {
        var _loc1_: ILayoutManagerClient = ILayoutManagerClient(this.invalidateSizeQueue.removeLargest());
        while (_loc1_) {
            if (_loc1_.nestLevel) {
                this.currentObject = _loc1_;
                _loc1_.validateSize();
                if (!_loc1_.updateCompletePendingFlag) {
                    this.updateCompleteQueue.addObject(_loc1_, _loc1_.nestLevel);
                    _loc1_.updateCompletePendingFlag = true;
                }
            }
            _loc1_ = ILayoutManagerClient(this.invalidateSizeQueue.removeLargest());
        }
        if (this.invalidateSizeQueue.isEmpty()) {
            this.invalidateSizeFlag = false;
        }
    }

    private function validateDisplayList(): void {
        var _loc1_: ILayoutManagerClient = ILayoutManagerClient(this.invalidateDisplayListQueue.removeSmallest());
        while (_loc1_) {
            if (_loc1_.nestLevel) {
                this.currentObject = _loc1_;
                _loc1_.validateDisplayList();
                if (!_loc1_.updateCompletePendingFlag) {
                    this.updateCompleteQueue.addObject(_loc1_, _loc1_.nestLevel);
                    _loc1_.updateCompletePendingFlag = true;
                }
            }
            _loc1_ = ILayoutManagerClient(this.invalidateDisplayListQueue.removeSmallest());
        }
        if (this.invalidateDisplayListQueue.isEmpty()) {
            this.invalidateDisplayListFlag = false;
        }
    }

    private function doPhasedInstantiation(): void {
        var _loc1_: * = null;
        if (this.usePhasedInstantiation) {
            if (this.invalidatePropertiesFlag) {
                this.validateProperties();
                this.systemManager.document.dispatchEvent(new Event("validatePropertiesComplete"));
            } else if (this.invalidateSizeFlag) {
                this.validateSize();
                this.systemManager.document.dispatchEvent(new Event("validateSizeComplete"));
            } else if (this.invalidateDisplayListFlag) {
                this.validateDisplayList();
                this.systemManager.document.dispatchEvent(new Event("validateDisplayListComplete"));
            }
        } else {
            if (this.invalidatePropertiesFlag) {
                this.validateProperties();
            }
            if (this.invalidateSizeFlag) {
                this.validateSize();
            }
            if (this.invalidateDisplayListFlag) {
                this.validateDisplayList();
            }
        }
        if (this.invalidatePropertiesFlag || this.invalidateSizeFlag || this.invalidateDisplayListFlag) {
            this.attachListeners(this.systemManager);
        } else {
            this.usePhasedInstantiation = false;
            this.listenersAttached = false;
            _loc1_ = ILayoutManagerClient(this.updateCompleteQueue.removeLargest());
            while (_loc1_) {
                if (!_loc1_.initialized && _loc1_.processedDescriptors) {
                    _loc1_.initialized = true;
                }
                if (_loc1_.hasEventListener(FlexEvent.UPDATE_COMPLETE)) {
                    _loc1_.dispatchEvent(new FlexEvent(FlexEvent.UPDATE_COMPLETE));
                }
                _loc1_.updateCompletePendingFlag = false;
                _loc1_ = ILayoutManagerClient(this.updateCompleteQueue.removeLargest());
            }
            dispatchEvent(new FlexEvent(FlexEvent.UPDATE_COMPLETE));
        }
    }

    public function validateNow(): void {
        var _loc1_: int = 0;
        if (!this.usePhasedInstantiation) {
            _loc1_ = 0;
            while (this.listenersAttached && _loc1_++ < 100) {
                this.doPhasedInstantiation();
            }
        }
    }

    public function validateClient(param1: ILayoutManagerClient, param2: Boolean = false): void {
        var _loc4_: * = null;
        var _loc3_: ILayoutManagerClient = this.currentObject;
        var _loc6_: Boolean = false;
        var _loc7_: int = this.targetLevel;
        if (this.targetLevel == int.MAX_VALUE) {
            this.targetLevel = param1.nestLevel;
        }
        while (!_loc6_) {
            _loc6_ = true;
            _loc4_ = ILayoutManagerClient(this.invalidatePropertiesQueue.removeSmallestChild(param1));
            while (_loc4_) {
                if (_loc4_.nestLevel) {
                    this.currentObject = _loc4_;
                    _loc4_.validateProperties();
                    if (!_loc4_.updateCompletePendingFlag) {
                        this.updateCompleteQueue.addObject(_loc4_, _loc4_.nestLevel);
                        _loc4_.updateCompletePendingFlag = true;
                    }
                }
                _loc4_ = ILayoutManagerClient(this.invalidatePropertiesQueue.removeSmallestChild(param1));
            }
            if (this.invalidatePropertiesQueue.isEmpty()) {
                this.invalidatePropertiesFlag = false;
                this.invalidateClientPropertiesFlag = false;
            }
            _loc4_ = ILayoutManagerClient(this.invalidateSizeQueue.removeLargestChild(param1));
            while (_loc4_) {
                if (_loc4_.nestLevel) {
                    this.currentObject = _loc4_;
                    _loc4_.validateSize();
                    if (!_loc4_.updateCompletePendingFlag) {
                        this.updateCompleteQueue.addObject(_loc4_, _loc4_.nestLevel);
                        _loc4_.updateCompletePendingFlag = true;
                    }
                }
                if (this.invalidateClientPropertiesFlag) {
                    if (_loc4_ = ILayoutManagerClient(this.invalidatePropertiesQueue.removeSmallestChild(param1))) {
                        this.invalidatePropertiesQueue.addObject(_loc4_, _loc4_.nestLevel);
                        _loc6_ = false;
                        break;
                    }
                }
                _loc4_ = ILayoutManagerClient(this.invalidateSizeQueue.removeLargestChild(param1));
            }
            if (this.invalidateSizeQueue.isEmpty()) {
                this.invalidateSizeFlag = false;
                this.invalidateClientSizeFlag = false;
            }
            if (!param2) {
                _loc4_ = ILayoutManagerClient(this.invalidateDisplayListQueue.removeSmallestChild(param1));
                while (_loc4_) {
                    if (_loc4_.nestLevel) {
                        this.currentObject = _loc4_;
                        _loc4_.validateDisplayList();
                        if (!_loc4_.updateCompletePendingFlag) {
                            this.updateCompleteQueue.addObject(_loc4_, _loc4_.nestLevel);
                            _loc4_.updateCompletePendingFlag = true;
                        }
                    }
                    if (this.invalidateClientPropertiesFlag) {
                        if (_loc4_ = ILayoutManagerClient(this.invalidatePropertiesQueue.removeSmallestChild(param1))) {
                            this.invalidatePropertiesQueue.addObject(_loc4_, _loc4_.nestLevel);
                            _loc6_ = false;
                            break;
                        }
                    }
                    if (this.invalidateClientSizeFlag) {
                        if (_loc4_ = ILayoutManagerClient(this.invalidateSizeQueue.removeLargestChild(param1))) {
                            this.invalidateSizeQueue.addObject(_loc4_, _loc4_.nestLevel);
                            _loc6_ = false;
                            break;
                        }
                    }
                    _loc4_ = ILayoutManagerClient(this.invalidateDisplayListQueue.removeSmallestChild(param1));
                }
                if (this.invalidateDisplayListQueue.isEmpty()) {
                    this.invalidateDisplayListFlag = false;
                }
            }
        }
        if (_loc7_ == int.MAX_VALUE) {
            this.targetLevel = int.MAX_VALUE;
            if (!param2) {
                _loc4_ = ILayoutManagerClient(this.updateCompleteQueue.removeLargestChild(param1));
                while (_loc4_) {
                    if (!_loc4_.initialized) {
                        _loc4_.initialized = true;
                    }
                    if (_loc4_.hasEventListener(FlexEvent.UPDATE_COMPLETE)) {
                        _loc4_.dispatchEvent(new FlexEvent(FlexEvent.UPDATE_COMPLETE));
                    }
                    _loc4_.updateCompletePendingFlag = false;
                    _loc4_ = ILayoutManagerClient(this.updateCompleteQueue.removeLargestChild(param1));
                }
            }
        }
        this.currentObject = _loc3_;
    }

    public function isInvalid(): Boolean {
        return this.invalidatePropertiesFlag || this.invalidateSizeFlag || this.invalidateDisplayListFlag;
    }

    private function waitAFrame(param1: Event): void {
        this.systemManager.removeEventListener(Event.ENTER_FRAME, this.waitAFrame);
        this.systemManager.addEventListener(Event.ENTER_FRAME, this.doPhasedInstantiationCallback);
        this.waitedAFrame = true;
    }

    public function attachListeners(param1: ISystemManager): void {
        if (!this.waitedAFrame) {
            param1.addEventListener(Event.ENTER_FRAME, this.waitAFrame);
        } else {
            param1.addEventListener(Event.ENTER_FRAME, this.doPhasedInstantiationCallback);
            if (!this.usePhasedInstantiation) {
                if (Boolean(param1) && (param1.stage || this.usingBridge(param1))) {
                    param1.addEventListener(Event.RENDER, this.doPhasedInstantiationCallback);
                    if (param1.stage) {
                        param1.stage.invalidate();
                    }
                }
            }
        }
        this.listenersAttached = true;
    }

    private function doPhasedInstantiationCallback(param1: Event): void {
        var callLaterErrorEvent: DynamicEvent = null;
        var var_6: Event = param1;
        if (false) {
            return;
        }
        this.systemManager.removeEventListener(Event.ENTER_FRAME, this.doPhasedInstantiationCallback);
        this.systemManager.removeEventListener(Event.RENDER, this.doPhasedInstantiationCallback);
        if (true) {
            this.doPhasedInstantiation();
        } else {
            try {
                this.doPhasedInstantiation();
            } catch (e: Error) {
                callLaterErrorEvent = new DynamicEvent("callLaterError");
                callLaterErrorEvent.error = e;
                callLaterErrorEvent.source = this;
                callLaterErrorEvent.object = currentObject;
                systemManager.dispatchEvent(callLaterErrorEvent);
            }
        }
        this.currentObject = null;
    }

    private function usingBridge(param1: ISystemManager): Boolean {
        if (this._usingBridge == 0) {
            return false;
        }
        if (this._usingBridge == 1) {
            return true;
        }
        if (!param1) {
            return false;
        }
        var _loc2_: Object = param1.getImplementation("mx.managers::IMarshalSystemManager");
        if (!_loc2_) {
            this._usingBridge = 0;
            return false;
        }
        if (_loc2_.useSWFBridge()) {
            this._usingBridge = 1;
            return true;
        }
        this._usingBridge = 0;
        return false;
    }
}
}
