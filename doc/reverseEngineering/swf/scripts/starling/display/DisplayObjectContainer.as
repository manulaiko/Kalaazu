package starling.display {

import flash.geom.Matrix;
import flash.geom.Point;
import flash.geom.Rectangle;
import flash.system.Capabilities;
import flash.utils.getQualifiedClassName;

import starling.core.RenderSupport;
import starling.core.starling_internal;
import starling.errors.AbstractClassError;
import starling.events.Event;
import starling.filters.FragmentFilter;
import starling.utils.MatrixUtil;

public class DisplayObjectContainer extends DisplayObject {

    private static var sHelperMatrix: Matrix = new Matrix();

    private static var sHelperPoint: Point = new Point();

    private static var sBroadcastListeners: Vector.<DisplayObject> = new Vector.<DisplayObject>(0);

    private static var sSortBuffer: Vector.<DisplayObject> = new Vector.<DisplayObject>(0);


    private var mChildren: Vector.<DisplayObject>;

    private var mTouchGroup: Boolean;

    public function DisplayObjectContainer() {
        super();
        if (false && getQualifiedClassName(this) == "starling.display::DisplayObjectContainer") {
            throw new AbstractClassError();
        }
        this.mChildren = new Vector.<DisplayObject>(0);
    }

    private static function mergeSort(param1: Vector.<DisplayObject>, param2: Function, param3: int, param4: int, param5: Vector.<DisplayObject>): void {
        var _loc6_: int = 0;
        var _loc7_: int = 0;
        var _loc8_: int = 0;
        var _loc9_: int = 0;
        var _loc10_: int = 0;
        if (param4 <= 1) {
            return;
        }
        _loc6_ = 0;
        _loc7_ = param3 + param4;
        _loc8_ = param4 / 2;
        _loc9_ = param3;
        _loc10_ = param3 + _loc8_;
        mergeSort(param1, param2, param3, _loc8_, param5);
        mergeSort(param1, param2, param3 + _loc8_, param4 - _loc8_, param5);
        _loc6_ = 0;
        while (_loc6_ < param4) {
            if (_loc9_ < param3 + _loc8_ && (_loc10_ == _loc7_ || param2(param1[_loc9_], param1[_loc10_]) <= 0)) {
                param5[_loc6_] = param1[_loc9_];
                _loc9_++;
            } else {
                param5[_loc6_] = param1[_loc10_];
                _loc10_++;
            }
            _loc6_++;
        }
        _loc6_ = param3;
        while (_loc6_ < _loc7_) {
            param1[_loc6_] = param5[int(_loc6_ - param3)];
            _loc6_++;
        }
    }

    override public function dispose(): void {
        var _loc1_: int = this.mChildren.length - 1;
        while (_loc1_ >= 0) {
            this.mChildren[_loc1_].dispose();
            _loc1_--;
        }
        super.dispose();
    }

    public function addChild(param1: DisplayObject): DisplayObject {
        this.addChildAt(param1, this.numChildren);
        return param1;
    }

    public function addChildAt(param1: DisplayObject, param2: int): DisplayObject {
        var _loc4_: * = null;
        var _loc3_: int = this.mChildren.length;
        if (param2 >= 0 && param2 <= _loc3_) {
            if (param1.parent == this) {
                this.setChildIndex(param1, param2);
            } else {
                param1.removeFromParent();
                if (param2 == _loc3_) {
                    this.mChildren[_loc3_] = param1;
                } else {
                    this.mChildren.splice(param2, 0, param1);
                }
                param1.setParent(this);
                param1.dispatchEventWith(Event.ADDED, true);
                if (stage) {
                    if (_loc4_ = param1 as DisplayObjectContainer) {
                        _loc4_.broadcastEventWith(Event.ADDED_TO_STAGE);
                    } else {
                        param1.dispatchEventWith(Event.ADDED_TO_STAGE);
                    }
                }
            }
            return param1;
        }
        throw new RangeError("Invalid child index");
    }

    public function removeChild(param1: DisplayObject, param2: Boolean = false): DisplayObject {
        var _loc3_: int = this.getChildIndex(param1);
        if (_loc3_ != -1) {
            this.removeChildAt(_loc3_, param2);
        }
        return param1;
    }

    public function removeChildAt(param1: int, param2: Boolean = false): DisplayObject {
        var _loc3_: * = null;
        var _loc4_: * = null;
        if (param1 >= 0 && param1 < this.numChildren) {
            _loc3_ = this.mChildren[param1];
            _loc3_.dispatchEventWith(Event.REMOVED, true);
            if (stage) {
                if (_loc4_ = _loc3_ as DisplayObjectContainer) {
                    _loc4_.broadcastEventWith(Event.REMOVED_FROM_STAGE);
                } else {
                    _loc3_.dispatchEventWith(Event.REMOVED_FROM_STAGE);
                }
            }
            _loc3_.setParent(null);
            param1 = this.mChildren.indexOf(_loc3_);
            if (param1 >= 0) {
                this.mChildren.splice(param1, 1);
            }
            if (param2) {
                _loc3_.dispose();
            }
            return _loc3_;
        }
        throw new RangeError("Invalid child index");
    }

    public function removeChildren(param1: int = 0, param2: int = -1, param3: Boolean = false): void {
        if (param2 < 0 || param2 >= this.numChildren) {
            param2 = this.numChildren - 1;
        }
        var _loc4_: int = param1;
        while (_loc4_ <= param2) {
            this.removeChildAt(param1, param3);
            _loc4_++;
        }
    }

    public function getChildAt(param1: int): DisplayObject {
        if (param1 >= 0 && param1 < this.numChildren) {
            return this.mChildren[param1];
        }
        throw new RangeError("Invalid child index");
    }

    public function getChildByName(param1: String): DisplayObject {
        var _loc2_: int = this.mChildren.length;
        var _loc3_: int = 0;
        while (_loc3_ < _loc2_) {
            if (this.mChildren[_loc3_].name == param1) {
                return this.mChildren[_loc3_];
            }
            _loc3_++;
        }
        return null;
    }

    public function getChildIndex(param1: DisplayObject): int {
        return this.mChildren.indexOf(param1);
    }

    public function setChildIndex(param1: DisplayObject, param2: int): void {
        var _loc3_: int = this.getChildIndex(param1);
        if (_loc3_ == param2) {
            return;
        }
        if (_loc3_ == -1) {
            throw new ArgumentError("Not a child of this container");
        }
        this.mChildren.splice(_loc3_, 1);
        this.mChildren.splice(param2, 0, param1);
    }

    public function swapChildren(param1: DisplayObject, param2: DisplayObject): void {
        var _loc3_: int = this.getChildIndex(param1);
        var _loc4_: int = this.getChildIndex(param2);
        if (_loc3_ == -1 || _loc4_ == -1) {
            throw new ArgumentError("Not a child of this container");
        }
        this.swapChildrenAt(_loc3_, _loc4_);
    }

    public function swapChildrenAt(param1: int, param2: int): void {
        var _loc3_: DisplayObject = this.getChildAt(param1);
        var _loc4_: DisplayObject = this.getChildAt(param2);
        this.mChildren[param1] = _loc4_;
        this.mChildren[param2] = _loc3_;
    }

    public function sortChildren(param1: Function): void {
        sSortBuffer.length = this.mChildren.length;
        mergeSort(this.mChildren, param1, 0, this.mChildren.length, sSortBuffer);
        sSortBuffer.length = 0;
    }

    public function contains(param1: DisplayObject): Boolean {
        while (param1) {
            if (param1 == this) {
                return true;
            }
            param1 = param1.parent;
        }
        return false;
    }

    override public function getBounds(param1: DisplayObject, param2: Rectangle = null): Rectangle {
        var _loc4_: Number = NaN;
        var _loc5_: Number = NaN;
        var _loc6_: Number = NaN;
        var _loc7_: Number = NaN;
        var _loc8_: int = 0;
        if (param2 == null) {
            param2 = new Rectangle();
        }
        var _loc3_: int = this.mChildren.length;
        if (_loc3_ == 0) {
            getTransformationMatrix(param1, sHelperMatrix);
            MatrixUtil.transformCoords(sHelperMatrix, 0, 0, sHelperPoint);
            param2.setTo(sHelperPoint.x, sHelperPoint.y, 0, 0);
        } else if (_loc3_ == 1) {
            param2 = this.mChildren[0].getBounds(param1, param2);
        } else {
            _loc4_ = 0;
            _loc5_ = 0;
            _loc6_ = 0;
            _loc7_ = 0;
            _loc8_ = 0;
            while (_loc8_ < _loc3_) {
                this.mChildren[_loc8_].getBounds(param1, param2);
                _loc4_ = _loc4_ < param2.x ? _loc4_ : param2.x;
                _loc5_ = _loc5_ > param2.right ? _loc5_ : param2.right;
                _loc6_ = _loc6_ < param2.y ? _loc6_ : param2.y;
                _loc7_ = _loc7_ > param2.bottom ? _loc7_ : param2.bottom;
                _loc8_++;
            }
            param2.setTo(_loc4_, _loc6_, _loc5_ - _loc4_, _loc7_ - _loc6_);
        }
        return param2;
    }

    override public function hitTest(param1: Point, param2: Boolean = false): DisplayObject {
        var _loc8_: * = null;
        if (param2 && (!visible || !touchable)) {
            return null;
        }
        var _loc3_: * = null;
        var _loc4_: Number = param1.x;
        var _loc5_: Number = param1.y;
        var _loc6_: int;
        var _loc7_: int = (_loc6_ = this.mChildren.length) - 1;
        while (_loc7_ >= 0) {
            _loc8_ = this.mChildren[_loc7_];
            getTransformationMatrix(_loc8_, sHelperMatrix);
            MatrixUtil.transformCoords(sHelperMatrix, _loc4_, _loc5_, sHelperPoint);
            _loc3_ = _loc8_.hitTest(sHelperPoint, param2);
            if (_loc3_) {
                return param2 && this.mTouchGroup ? {} : _loc3_;
            }
            _loc7_--;
        }
        return null;
    }

    override public function render(param1: RenderSupport, param2: Number): void {
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc3_: Number = param2 * this.alpha;
        var _loc4_: int = this.mChildren.length;
        var _loc5_: String = param1.blendMode;
        var _loc6_: int = 0;
        while (_loc6_ < _loc4_) {
            if ((_loc7_ = this.mChildren[_loc6_]).hasVisibleArea) {
                _loc8_ = _loc7_.filter;
                param1.pushMatrix();
                param1.transformMatrix(_loc7_);
                param1.blendMode = _loc7_.blendMode;
                if (_loc8_) {
                    _loc8_.render(_loc7_, param1, _loc3_);
                } else {
                    _loc7_.render(param1, _loc3_);
                }
                param1.blendMode = _loc5_;
                param1.popMatrix();
            }
            _loc6_++;
        }
    }

    public function broadcastEvent(param1: Event): void {
        if (param1.bubbles) {
            throw new ArgumentError("Broadcast of bubbling events is prohibited");
        }
        var _loc2_: int = 0;
        this.getChildEventListeners(this, param1.type, sBroadcastListeners);
        var _loc3_: int = 0;
        var _loc4_: int = _loc2_;
        while (_loc4_ < _loc3_) {
            sBroadcastListeners[_loc4_].dispatchEvent(param1);
            _loc4_++;
        }
        sBroadcastListeners.length = _loc2_;
    }

    public function broadcastEventWith(param1: String, param2: Object = null): void {
        var _loc3_: Event = Event.starling_internal::fromPool(param1, false, param2);
        this.broadcastEvent(_loc3_);
        Event.starling_internal::toPool(_loc3_);
    }

    public function get numChildren(): int {
        return this.mChildren.length;
    }

    public function get touchGroup(): Boolean {
        return this.mTouchGroup;
    }

    public function set touchGroup(param1: Boolean): void {
        this.mTouchGroup = param1;
    }

    function getChildEventListeners(param1: DisplayObject, param2: String, param3: Vector.<DisplayObject>): void {
        var _loc5_: * = null;
        var _loc6_: int = 0;
        var _loc7_: int = 0;
        var _loc4_: DisplayObjectContainer = param1 as DisplayObjectContainer;
        if (param1.hasEventListener(param2)) {
            param3[param3.length] = param1;
        }
        if (_loc4_) {
            _loc6_ = (_loc5_ = _loc4_.mChildren).length;
            _loc7_ = 0;
            while (_loc7_ < _loc6_) {
                this.getChildEventListeners(_loc5_[_loc7_], param2, param3);
                _loc7_++;
            }
        }
    }
}
}
