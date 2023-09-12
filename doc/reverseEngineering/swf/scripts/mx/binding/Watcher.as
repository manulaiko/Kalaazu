package mx.binding {

import mx.collections.errors.ItemPendingError;
import mx.core.mx_internal;

public class Watcher {

    mx_internal static const VERSION: String = "4.6.0.23201";


    protected var listeners: Array;

    protected var children: Array;

    public var value: Object;

    protected var cloneIndex: int;

    public function Watcher(param1: Array = null) {
        super();
        this.listeners = param1;
    }

    public function updateParent(param1: Object): void {
    }

    public function addChild(param1: Watcher): void {
        if (!this.children) {
            this.children = [param1];
        } else {
            this.children.push(param1);
        }
        param1.updateParent(this);
    }

    public function removeChildren(param1: int): void {
        this.children.splice(param1);
    }

    public function updateChildren(): void {
        var _loc1_: int = 0;
        var _loc2_: int = 0;
        if (this.children) {
            _loc1_ = this.children.length;
            _loc2_ = 0;
            while (_loc2_ < _loc1_) {
                this.children[_loc2_].updateParent(this);
                _loc2_++;
            }
        }
    }

    private function valueChanged(param1: Object): Boolean {
        if (param1 == null && this.value == null) {
            return false;
        }
        var _loc2_: * = typeof this.value;
        if (_loc2_ == "string") {
            if (param1 == null && this.value == "") {
                return false;
            }
            return param1 != this.value;
        }
        if (_loc2_ == "number") {
            if (param1 == null && this.value == 0) {
                return false;
            }
            return param1 != this.value;
        }
        if (_loc2_ == "boolean") {
            if (param1 == null && this.value == false) {
                return false;
            }
            return param1 != this.value;
        }
        return true;
    }

    protected function wrapUpdate(param1: Function): void {
        var wrappedFunction: Function = param1;
        try {
            wrappedFunction.apply(this);
        } catch (itemPendingError: ItemPendingError) {
            value = null;
        } catch (rangeError: RangeError) {
            value = null;
        } catch (error: Error) {
            if (error.errorID != 1006 && error.errorID != 1009 && error.errorID != 1010 && error.errorID != 1055 && error.errorID != 1069 && error.errorID != 1507) {
                throw error;
            }
        }
    }

    protected function deepClone(param1: int): Watcher {
        var _loc3_: int = 0;
        var _loc4_: int = 0;
        var _loc5_: * = null;
        var _loc2_: Watcher = this.shallowClone();
        _loc2_.cloneIndex = param1;
        if (this.listeners) {
            _loc2_.listeners = this.listeners.concat();
        }
        if (this.children) {
            _loc3_ = this.children.length;
            _loc4_ = 0;
            while (_loc4_ < _loc3_) {
                _loc5_ = this.children[_loc4_].deepClone(param1);
                _loc2_.addChild(_loc5_);
                _loc4_++;
            }
        }
        return _loc2_;
    }

    protected function shallowClone(): Watcher {
        return new Watcher();
    }

    public function notifyListeners(param1: Boolean): void {
        var _loc2_: int = 0;
        var _loc3_: int = 0;
        if (this.listeners) {
            _loc2_ = this.listeners.length;
            _loc3_ = 0;
            while (_loc3_ < _loc2_) {
                this.listeners[_loc3_].watcherFired(param1, this.cloneIndex);
                _loc3_++;
            }
        }
    }
}
}
