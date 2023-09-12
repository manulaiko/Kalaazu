package mx.binding {

import flash.events.Event;
import flash.events.IEventDispatcher;

import mx.core.EventPriority;
import mx.core.mx_internal;

public class FunctionReturnWatcher extends Watcher {

    mx_internal static const VERSION: String = "4.6.0.23201";


    private var functionName: String;

    private var document: Object;

    private var parameterFunction: Function;

    private var events: Object;

    private var parentObj: Object;

    public var parentWatcher: Watcher;

    private var functionGetter: Function;

    private var isStyle: Boolean;

    public function FunctionReturnWatcher(param1: String, param2: Object, param3: Function, param4: Object, param5: Array, param6: Function = null, param7: Boolean = false) {
        super(param5);
        this.functionName = param1;
        this.document = param2;
        this.parameterFunction = param3;
        this.events = param4;
        this.functionGetter = param6;
        this.isStyle = param7;
    }

    override public function updateParent(param1: Object): void {
        if (!(param1 is Watcher)) {
            this.setupParentObj(param1);
        } else if (param1 == this.parentWatcher) {
            this.setupParentObj(this.parentWatcher.value);
        }
        this.updateFunctionReturn();
    }

    override protected function shallowClone(): Watcher {
        return new FunctionReturnWatcher(this.functionName, this.document, this.parameterFunction, this.events, listeners, this.functionGetter);
    }

    public function updateFunctionReturn(): void {
        wrapUpdate(function (): void {
            if (functionGetter != null) {
                value = functionGetter(functionName).apply(parentObj, parameterFunction.apply(document));
            } else {
                value = parentObj[functionName].apply(parentObj, parameterFunction.apply(document));
            }
            updateChildren();
        });
    }

    private function setupParentObj(param1: Object): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        if (this.parentObj != null && this.parentObj is IEventDispatcher) {
            _loc2_ = this.parentObj as IEventDispatcher;
            if (this.events != null) {
                for (_loc3_ in this.events) {
                    if (_loc3_ != "__NoChangeEvent__") {
                        _loc2_.removeEventListener(_loc3_, this.eventHandler);
                    }
                }
            }
            if (this.isStyle) {
                _loc3_ = this.parameterFunction.apply(this.document) + "Changed";
                _loc2_.removeEventListener(_loc3_, this.eventHandler);
                _loc2_.removeEventListener("allStylesChanged", this.eventHandler);
            }
        }
        this.parentObj = param1;
        if (this.parentObj != null && this.parentObj is IEventDispatcher) {
            _loc2_ = this.parentObj as IEventDispatcher;
            if (this.events != null) {
                for (_loc3_ in this.events) {
                    if (_loc3_ != "__NoChangeEvent__") {
                        _loc2_.addEventListener(_loc3_, this.eventHandler, false, EventPriority.BINDING, true);
                    }
                }
            }
            if (this.isStyle) {
                _loc3_ = this.parameterFunction.apply(this.document) + "Changed";
                _loc2_.addEventListener(_loc3_, this.eventHandler, false, EventPriority.BINDING, true);
                _loc2_.addEventListener("allStylesChanged", this.eventHandler, false, EventPriority.BINDING, true);
            }
        }
    }

    public function eventHandler(param1: Event): void {
        this.updateFunctionReturn();
        if (this.events != null) {
            notifyListeners(this.events[param1.type]);
        }
        if (this.isStyle) {
            notifyListeners(true);
        }
    }
}
}
