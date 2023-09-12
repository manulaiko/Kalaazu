package mx.binding {

import flash.events.Event;
import flash.events.IEventDispatcher;
import flash.utils.getQualifiedClassName;

import mx.core.EventPriority;
import mx.core.mx_internal;
import mx.events.PropertyChangeEvent;
import mx.utils.DescribeTypeCache;

public class PropertyWatcher extends Watcher {

    mx_internal static const VERSION: String = "4.6.0.23201";


    private var parentObj: Object;

    protected var events: Object;

    protected var propertyGetter: Function;

    private var _propertyName: String;

    private var useRTTI: Boolean;

    public function PropertyWatcher(param1: String, param2: Object, param3: Array, param4: Function = null) {
        super(param3);
        this._propertyName = param1;
        this.events = param2;
        this.propertyGetter = param4;
        this.useRTTI = !param2;
    }

    public function get propertyName(): String {
        return this._propertyName;
    }

    override public function updateParent(param1: Object): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        if (Boolean(this.parentObj) && this.parentObj is IEventDispatcher) {
            for (_loc2_ in this.events) {
                this.parentObj.removeEventListener(_loc2_, this.eventHandler);
            }
        }
        if (param1 is Watcher) {
            this.parentObj = param1.value;
        } else {
            this.parentObj = param1;
        }
        if (this.parentObj) {
            if (this.useRTTI) {
                this.events = {};
                if (this.parentObj is IEventDispatcher) {
                    _loc3_ = DescribeTypeCache.describeType(this.parentObj).bindabilityInfo;
                    this.events = _loc3_.getChangeEvents(this._propertyName);
                    if (this.objectIsEmpty(this.events)) {
                        trace("warning: unable to bind to property \'" + this._propertyName + "\' on class \'" + getQualifiedClassName(this.parentObj) + "\'");
                    } else {
                        this.addParentEventListeners();
                    }
                } else {
                    trace("warning: unable to bind to property \'" + this._propertyName + "\' on class \'" + getQualifiedClassName(this.parentObj) + "\' (class is not an IEventDispatcher)");
                }
            } else if (this.parentObj is IEventDispatcher) {
                this.addParentEventListeners();
            }
        }
        wrapUpdate(this.updateProperty);
    }

    override protected function shallowClone(): Watcher {
        return new PropertyWatcher(this._propertyName, this.events, listeners, this.propertyGetter);
    }

    private function addParentEventListeners(): void {
        var _loc1_: * = null;
        for (_loc1_ in this.events) {
            if (_loc1_ != "__NoChangeEvent__") {
                this.parentObj.addEventListener(_loc1_, this.eventHandler, false, EventPriority.BINDING, true);
            }
        }
    }

    private function traceInfo(): String {
        return "Watcher(" + getQualifiedClassName(this.parentObj) + "." + this._propertyName + "): events = [" + this.eventNamesToString() + (this.useRTTI ? "] (RTTI)" : "]");
    }

    private function eventNamesToString(): String {
        var _loc2_: * = null;
        var _loc1_: String = " ";
        for (_loc2_ in this.events) {
            _loc1_ += _loc2_ + " ";
        }
        return _loc1_;
    }

    private function objectIsEmpty(param1: Object): Boolean {
        var _loc2_: * = null;
        var _loc3_: int = 0;
        var _loc4_: * = param1;
        for (_loc2_ in _loc4_) {
            return false;
        }
        return true;
    }

    private function updateProperty(): void {
        if (this.parentObj) {
            if (this._propertyName == "this") {
                value = this.parentObj;
            } else if (this.propertyGetter != null) {
                value = this.propertyGetter.apply(this.parentObj, [this._propertyName]);
            } else {
                value = this.parentObj[this._propertyName];
            }
        } else {
            value = null;
        }
        updateChildren();
    }

    public function eventHandler(param1: Event): void {
        var _loc2_: * = null;
        if (param1 is PropertyChangeEvent) {
            _loc2_ = PropertyChangeEvent(param1).property;
            if (_loc2_ != this._propertyName) {
                return;
            }
        }
        wrapUpdate(this.updateProperty);
        notifyListeners(this.events[param1.type]);
    }
}
}
