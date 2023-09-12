package mx.collections {

import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;
import flash.utils.IExternalizable;
import flash.utils.getQualifiedClassName;

import mx.core.IPropertyChangeNotifier;
import mx.core.mx_internal;
import mx.events.CollectionEvent;
import mx.events.CollectionEventKind;
import mx.events.PropertyChangeEvent;
import mx.events.PropertyChangeEventKind;
import mx.resources.IResourceManager;
import mx.resources.ResourceManager;
import mx.utils.ArrayUtil;
import mx.utils.UIDUtil;

public class ArrayList extends EventDispatcher implements IList, IExternalizable, IPropertyChangeNotifier {

    mx_internal static const VERSION: String = "4.6.0.23201";


    private var resourceManager: IResourceManager;

    private var _dispatchEvents: int = 0;

    private var _source: Array;

    private var _uid: String;

    public function ArrayList(param1: Array = null) {
        this.resourceManager = ResourceManager.getInstance();
        super();
        this.disableEvents();
        this.source = param1;
        this.enableEvents();
        this._uid = UIDUtil.createUID();
    }

    [Bindable("collectionChange")]
    public function get length(): int {
        if (this.source) {
            return this.source.length;
        }
        return 0;
    }

    public function get source(): Array {
        return this._source;
    }

    public function set source(param1: Array): void {
        var _loc2_: int = 0;
        var _loc3_: int = 0;
        var _loc4_: * = null;
        if (Boolean(this._source) && Boolean(this._source.length)) {
            _loc3_ = this._source.length;
            _loc2_ = 0;
            while (_loc2_ < _loc3_) {
                this.stopTrackUpdates(this._source[_loc2_]);
                _loc2_++;
            }
        }
        this._source = !!param1 ? param1 : [];
        _loc3_ = this._source.length;
        _loc2_ = 0;
        while (_loc2_ < _loc3_) {
            this.startTrackUpdates(this._source[_loc2_]);
            _loc2_++;
        }
        if (this._dispatchEvents == 0) {
            (_loc4_ = new CollectionEvent(CollectionEvent.COLLECTION_CHANGE)).kind = CollectionEventKind.RESET;
            dispatchEvent(_loc4_);
        }
    }

    public function get uid(): String {
        return this._uid;
    }

    public function set uid(param1: String): void {
        this._uid = param1;
    }

    public function getItemAt(param1: int, param2: int = 0): Object {
        var _loc3_: * = null;
        if (param1 < 0 || param1 >= this.length) {
            _loc3_ = this.resourceManager.getString("collections", "outOfBounds", [param1]);
            throw new RangeError(_loc3_);
        }
        return this.source[param1];
    }

    public function setItemAt(param1: Object, param2: int): Object {
        var _loc4_: * = null;
        var _loc5_: Boolean = false;
        var _loc6_: Boolean = false;
        var _loc7_: * = null;
        var _loc8_: * = null;
        if (param2 < 0 || param2 >= this.length) {
            _loc4_ = this.resourceManager.getString("collections", "outOfBounds", [param2]);
            throw new RangeError(_loc4_);
        }
        var _loc3_: Object = this.source[param2];
        this.source[param2] = param1;
        this.stopTrackUpdates(_loc3_);
        this.startTrackUpdates(param1);
        if (this._dispatchEvents == 0) {
            _loc5_ = hasEventListener(CollectionEvent.COLLECTION_CHANGE);
            _loc6_ = hasEventListener(PropertyChangeEvent.PROPERTY_CHANGE);
            if (_loc5_ || _loc6_) {
                (_loc7_ = new PropertyChangeEvent(PropertyChangeEvent.PROPERTY_CHANGE)).kind = PropertyChangeEventKind.UPDATE;
                _loc7_.oldValue = _loc3_;
                _loc7_.newValue = param1;
                _loc7_.property = param2;
            }
            if (_loc5_) {
                (_loc8_ = new CollectionEvent(CollectionEvent.COLLECTION_CHANGE)).kind = CollectionEventKind.REPLACE;
                _loc8_.location = param2;
                _loc8_.items.push(_loc7_);
                dispatchEvent(_loc8_);
            }
            if (_loc6_) {
                dispatchEvent(_loc7_);
            }
        }
        return _loc3_;
    }

    public function addItem(param1: Object): void {
        this.addItemAt(param1, this.length);
    }

    public function addItemAt(param1: Object, param2: int): void {
        var _loc3_: * = null;
        if (param2 < 0 || param2 > this.length) {
            _loc3_ = this.resourceManager.getString("collections", "outOfBounds", [param2]);
            throw new RangeError(_loc3_);
        }
        this.source.splice(param2, 0, param1);
        this.startTrackUpdates(param1);
        this.internalDispatchEvent(CollectionEventKind.ADD, param1, param2);
    }

    public function addAll(param1: IList): void {
        this.addAllAt(param1, this.length);
    }

    public function addAllAt(param1: IList, param2: int): void {
        var _loc3_: int = param1.length;
        var _loc4_: int = 0;
        while (_loc4_ < _loc3_) {
            this.addItemAt(param1.getItemAt(_loc4_), _loc4_ + param2);
            _loc4_++;
        }
    }

    public function getItemIndex(param1: Object): int {
        return ArrayUtil.getItemIndex(param1, this.source);
    }

    public function removeItem(param1: Object): Boolean {
        var _loc2_: int = this.getItemIndex(param1);
        var _loc3_: * = _loc2_ >= 0;
        if (_loc3_) {
            this.removeItemAt(_loc2_);
        }
        return _loc3_;
    }

    public function removeItemAt(param1: int): Object {
        var _loc3_: * = null;
        if (param1 < 0 || param1 >= this.length) {
            _loc3_ = this.resourceManager.getString("collections", "outOfBounds", [param1]);
            throw new RangeError(_loc3_);
        }
        var _loc2_: Object = this.source.splice(param1, 1)[0];
        this.stopTrackUpdates(_loc2_);
        this.internalDispatchEvent(CollectionEventKind.REMOVE, _loc2_, param1);
        return _loc2_;
    }

    public function removeAll(): void {
        var _loc1_: int = 0;
        var _loc2_: int = 0;
        if (this.length > 0) {
            _loc1_ = this.length;
            _loc2_ = 0;
            while (_loc2_ < _loc1_) {
                this.stopTrackUpdates(this.source[_loc2_]);
                _loc2_++;
            }
            this.source.splice(0, this.length);
            this.internalDispatchEvent(CollectionEventKind.RESET);
        }
    }

    public function itemUpdated(param1: Object, param2: Object = null, param3: Object = null, param4: Object = null): void {
        var _loc5_: PropertyChangeEvent;
        (_loc5_ = new PropertyChangeEvent(PropertyChangeEvent.PROPERTY_CHANGE)).kind = PropertyChangeEventKind.UPDATE;
        _loc5_.source = param1;
        _loc5_.property = param2;
        _loc5_.oldValue = param3;
        _loc5_.newValue = param4;
        this.itemUpdateHandler(_loc5_);
    }

    public function toArray(): Array {
        return this.source.concat();
    }

    public function readExternal(param1: IDataInput): void {
        this.source = param1.readObject();
    }

    public function writeExternal(param1: IDataOutput): void {
        param1.writeObject(this._source);
    }

    override public function toString(): String {
        if (this.source) {
            return this.source.toString();
        }
        return getQualifiedClassName(this);
    }

    private function enableEvents(): void {
        ++this._dispatchEvents;
        if (this._dispatchEvents > 0) {
            this._dispatchEvents = 0;
        }
    }

    private function disableEvents(): void {
        --this._dispatchEvents;
    }

    private function internalDispatchEvent(param1: String, param2: Object = null, param3: int = -1): void {
        var _loc4_: * = null;
        var _loc5_: * = null;
        if (this._dispatchEvents == 0) {
            if (hasEventListener(CollectionEvent.COLLECTION_CHANGE)) {
                (_loc4_ = new CollectionEvent(CollectionEvent.COLLECTION_CHANGE)).kind = param1;
                _loc4_.items.push(param2);
                _loc4_.location = param3;
                dispatchEvent(_loc4_);
            }
            if (hasEventListener(PropertyChangeEvent.PROPERTY_CHANGE) && (param1 == CollectionEventKind.ADD || param1 == CollectionEventKind.REMOVE)) {
                (_loc5_ = new PropertyChangeEvent(PropertyChangeEvent.PROPERTY_CHANGE)).property = param3;
                if (param1 == CollectionEventKind.ADD) {
                    _loc5_.newValue = param2;
                } else {
                    _loc5_.oldValue = param2;
                }
                dispatchEvent(_loc5_);
            }
        }
    }

    protected function itemUpdateHandler(param1: PropertyChangeEvent): void {
        var _loc2_: * = null;
        var _loc3_: * = 0;
        this.internalDispatchEvent(CollectionEventKind.UPDATE, param1);
        if (this._dispatchEvents == 0 && hasEventListener(PropertyChangeEvent.PROPERTY_CHANGE)) {
            _loc2_ = PropertyChangeEvent(param1.clone());
            _loc3_ = this.getItemIndex(param1.target);
            _loc2_.property = _loc3_.toString() + "." + param1.property;
            dispatchEvent(_loc2_);
        }
    }

    protected function startTrackUpdates(param1: Object): void {
        if (Boolean(param1) && param1 is IEventDispatcher) {
            IEventDispatcher(param1).addEventListener(PropertyChangeEvent.PROPERTY_CHANGE, this.itemUpdateHandler, false, 0, true);
        }
    }

    protected function stopTrackUpdates(param1: Object): void {
        if (Boolean(param1) && param1 is IEventDispatcher) {
            IEventDispatcher(param1).removeEventListener(PropertyChangeEvent.PROPERTY_CHANGE, this.itemUpdateHandler);
        }
    }
}
}
